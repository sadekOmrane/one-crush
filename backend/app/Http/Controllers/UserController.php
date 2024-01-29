<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{

    public function getSuggestions()
    {
        $users = User::all()->diff([Auth::user()]);
        $matchingUsers = User::select('users.*')
        ->join('matchings', function($join){
            $join->on('users.id', '=', 'matchings.from_user_id')
            ->orOn('users.id', '=', 'matchings.to_user_id');
        })
        ->where(function ($query) {
            $query->where('matchings.from_user_id', Auth::user()->id)
                  ->orWhere('matchings.to_user_id', Auth::user()->id);
        })
        ->get();
        return $this->sendResponse($users->diff($matchingUsers), 'Suggestions retrieved successfully');
    }

    public function getUser($id)
    {
        $profile = User::find($id);
        return $this->sendResponse($profile, 'User retrieved successfully');
    }

    public function getProfile()
    {
        $profile = User::where('id', Auth::id())->with('profile')->first();
        return $this->sendResponse($profile, 'Profile retrieved successfully');
    }

    public function updateProfile(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'bio' => 'required|string|max:255',
            'profile_pic_id' => 'required|integer',
        ]);

        $user = User::find(Auth::user()->id);
        $user->name = $request->name;
        $user->save();

        $profile = DB::table('profiles')
            ->where('user_id', Auth::user()->id)
            ->update([
                'bio' => $request->bio,
                'profile_pic_id' => $request->profile_pic_id,
            ]);
        return $this->sendResponse($profile, 'Profile updated successfully');
    }
}
