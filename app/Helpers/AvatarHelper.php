<?php

namespace App\Helpers;

use Illuminate\Support\Str;

class AvatarHelper
{
    /**
     * Gera uma URL de avatar aleatório usando a API DiceBear.
     *
     * @return string URL do avatar SVG gerado aleatoriamente.
     */
    public static function generateRandomAvatar()
    {
        // Gera um seed aleatório de 10 caracteres
        $seed = Str::random(10);

        // Monta a URL da API DiceBear com o seed
        $avatarUrl = "https://api.dicebear.com/7.x/avataaars/svg?seed={$seed}";

        return $avatarUrl;
    }
}
