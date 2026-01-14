<?php

namespace App\Services;

use App\Http\Requests\review\StoreReviewRequest;
use App\Models\Review;

class ReviewService
{
    // This method will show all reviews
    public static function showAllReviews() {
        $reviews = Review::orderBy('created_at')->get();

        return $reviews;
    }

    // This method will store a single review in DB
    public static function storeReview(StoreReviewRequest $request) {
        $data = $request->validated();

        $review = new Review();
        $review->name = $data['name'];
        $review->is_active = $data['is_active'];

        $review->save();

        return $review;
    }

    // This method will update a single review with specific ID
    public static function updateReviewById(StoreReviewRequest $request, string $id) {
        $review = Review::find($id);

        if ( $review == null ) return null;

        $data = $request->validated();

        $review->name = $data['name'];
        $review->is_active = $data['is_active'];

        $review->save();

        return $review;
    }
    
    // This method will delete a single review with specific ID
    public static function deleteReviewById(string $id) {
        $review = Review::find($id);

        if ( $review == null ) return null;

        $review->delete();

        return $review;
    }
}
