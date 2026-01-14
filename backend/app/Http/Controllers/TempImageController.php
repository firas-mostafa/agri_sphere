<?php

namespace App\Http\Controllers;

use App\Models\TempImage;
use App\Services\ResponseService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\ImageManager;

class TempImageController extends Controller
{
    // This method will store the temporary image
    public function store(Request $request) {
        
        // Validate the request
        $validator = Validator::make($request->all(), [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,webp',
        ]);

        if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

        $tempImage = new TempImage();
        $tempImage->name = 'Dummy Image Name';
        $tempImage->save();


        $image = $request->file('image');
        $imageName = time().'.'.$image->extension(); // 23224242.jpg
        $image->move(public_path('uploads/temp'), $imageName);

        $tempImage->name = $imageName;
        $tempImage->save();

        // Save image thumbnail
        $manager = new ImageManager(Driver::class);
        $img = $manager->read(public_path('uploads/temp/'.$imageName));
        $img->coverDown(400, 450);
        $img->save(public_path('uploads/temp/thumb/'.$imageName));

        return response()->json([
            'status' => 200,
            'message' => 'Image has been uploaded successfully',
            'data' => $tempImage,
        ], 200);
    }

    // This method will delete temp image from DB
    public function destroy($id) {
        $tempImage = TempImage::find($id);

        if ( $tempImage == null ) {
            return response()->json([
                'status' => 404,
                'message' => 'Temp image not found'
            ], 404);
        }

        File::delete(public_path('uploads/temp/').$tempImage->name);
        File::delete(public_path('uploads/temp/thumb/').$tempImage->name);

        $tempImage->delete();

        return response()->json([
            'status' => 200,
            'message' => 'Temp Image deleted successfully',
        ], 200);
    }
}
