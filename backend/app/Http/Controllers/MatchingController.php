<?php

namespace App\Http\Controllers;

use App\Models\Matching;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MatchingController extends Controller
{
    public function match(Request $request, $id)
    {
        $request->validate([
            'type' => 'required|string',
        ]);
        if ($id == Auth::id()) {
            return response()->json([
                'status' => 'error',
                'message' => 'You cannot match yourself',
            ], 400);
        }
        $isAlreadyMatched = Matching::factory()->isRequestExist(Auth::id(), $id, $request->type);
        if ($isAlreadyMatched == 0) {
            $matching = Matching::create([
                'from_user_id' => Auth::id(),
                'to_user_id' => $id,
                'type' => $request->type,
                'status' => 'pending',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }else{
            $matching = Matching::find($isAlreadyMatched);
            if($matching->from_user_id == Auth::id() && $matching->to_user_id == $id){
                $matching->type = $request->type;
                $matching->save();
            }else{
                $matching->status = 'matched';
                $matching->save();
            }
        }
        return response()->json([
            'status' => 'success',
            'matching' => $matching,
        ]);
    }

}
