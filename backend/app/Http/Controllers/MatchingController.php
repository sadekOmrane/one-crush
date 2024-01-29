<?php

namespace App\Http\Controllers;

use App\Models\Matching;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class MatchingController extends Controller
{
    public function match(Request $request, $id)
    {
        $request->validate([
            'type' => 'required|string',
        ]);
        if ($id == Auth::id()) {
            return $this->sendResponse(null, 'You cannot match yourself', 400);
        }
        $matchingRequested = Matching::factory()->isRequestExist($id, Auth::id(), $request->type);
        if ($matchingRequested) {
            $matchingRequested->status = 'matched';
            $matchingRequested->save();
            Matching::create([
                'from_user_id' => Auth::id(),
                'to_user_id' => $id,
                'type' => $request->type,
                'status' => 'matched',
                'created_at' => now(),
                'updated_at' => now(),
            ]);

        }else{
            $sameMatching = Matching::factory()->isRequestExist(Auth::id(), $id, $request->type);
            if($sameMatching){
                return $this->sendResponse(null, 'you already match this user', 400);
            }
            $matching = Matching::create([
                'from_user_id' => Auth::id(),
                'to_user_id' => $id,
                'type' => $request->type,
                'status' => 'pending',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
        return $this->sendResponse($matching, 'Matching created successfully');
    }




}
