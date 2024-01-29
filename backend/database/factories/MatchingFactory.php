<?php

namespace Database\Factories;

use App\Models\Matching;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Matching>
 */
class MatchingFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            //
        ];
    }

    static public function isRequestExist($from_id, $to_id, $type) : ?Matching
    {
        $matching = Matching::where('from_user_id', $from_id)
            ->where('to_user_id', $to_id)
            ->where('type', $type)
            ->first();
        return $matching;
    }

}
