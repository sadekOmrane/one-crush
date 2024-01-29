<?php

namespace App\Http\Controllers;

use App\Models\MediaFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MediaFileController extends Controller
{

    public function upload(Request $request)
    {
        $request->validate([
            'file' => 'required|file|mimes:jpeg,png,gif,webp,mp4|max:2048',
        ]);
        $file = $request->file('file');
        $fileName = time() . '_' . $file->getClientOriginalName();
        $filePath = $request->file('file')->storeAs('uploads', $fileName, 'public');
        $fileExtension = $file->getClientOriginalExtension();
        $fileSize = $file->getSize();
        $fileMimeType = $file->getMimeType();

        MediaFile::create([
            'user_id' => Auth::id(),
            'name' => $fileName,
            'path' => $filePath,
            'extension' => $fileExtension,
            'size' => $fileSize,
            'type' => $fileMimeType,
        ]);
        return response()->json([
            'status' => 'success',
            'message' => 'file uploaded',
            'data' => [
                'path' => '/storage/' . $filePath
            ],
        ]);
    }

    public function update(Request $request, $id){
        $request->validate([
            'file' => 'required|file|mimes:jpeg,png,gif,webp,mp4|max:2048',
        ]);

        $file = $request->file('file');
        $fileName = time() . '_' . $file->getClientOriginalName();
        $filePath = $request->file('file')->storeAs('uploads', $fileName, 'public');
        $fileExtension = $file->getClientOriginalExtension();
        $fileSize = $file->getSize();
        $fileMimeType = $file->getMimeType();

        $mediaFile = MediaFile::find($id);
        if($mediaFile->user_id != Auth::id()){
            return response()->json([
                'status' => 'error',
                'message' => 'You are not allowed to update this file',
            ], 401);
        }
        $mediaFile->name = $fileName;
        $mediaFile->path = $filePath;
        $mediaFile->extension = $fileExtension;
        $mediaFile->size = $fileSize;
        $mediaFile->type = $fileMimeType;
        $mediaFile->save();

        return response()->json([
            'status' => 'success',
            'message' => 'file updated',
            'data' => [
                'path' => '/storage/' . $filePath
            ],
        ]);
    }
}
