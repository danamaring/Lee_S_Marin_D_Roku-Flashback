<?php
    require_once '../load.php';
    // confirm_logged_in();
    // movies
    if (isset($_GET['media'])){
        $tbl = "tbl_" . trim($_GET["media"]);
        // echo $tbl;
    }

    if(isset($_GET['filter'])){
        $args = array(
            'tbl' => $tbl,
            'tbl2' => 'tbl_genre',
            'tbl3' => 'tbl_mov_genre',
            'col' => 'movies_id',
            'col2' => 'genre_id',
            'col3' => 'genre_name',
            'filter' => $_GET['filter'],
        );

        $results = getMoviesByFilter($args);
        echo json_encode($results->fetchAll(PDO::FETCH_ASSOC));
    } else {
            $results = getAll($tbl);
            echo json_encode($results);
    }

    // tv shows
    if(isset($_GET['filter_tv'])){
        $args = array(
            'tbl' => $tbl,
            'tbl2' => 'tbl_genre',
            'tbl3' => 'tbl_tv_genre',
            'col' => 'tv_id',
            'col2' => 'genre_id',
            'col3' => 'genre_name',
            'filter_tv' => $_GET['filter_tv'],
        );

        $results = getTvByFilter($args);
        echo json_encode($results->fetchAll(PDO::FETCH_ASSOC));
    } 

    // audio
    if(isset($_GET['filter_audio'])){
        $args = array(
            'tbl' => $tbl_,
            'tbl2' => 'tbl_genre',
            'tbl3' => 'tbl_mu_genre',
            'col' => 'music_id',
            'col2' => 'genre_id',
            'col3' => 'genre_name',
            'filter_audio' => $_GET['filter_audio'],
        );

        $results = getAudioByFilter($args);
        echo json_encode($results->fetchAll(PDO::FETCH_ASSOC));
    }
?>