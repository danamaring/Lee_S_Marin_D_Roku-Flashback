<?php
    require_once '../load.php';

    $ip = $_SERVER['REMOTE_ADDR'];

    if(isset($_POST['submit'])){
        $username = trim($_POST['username']);
        $password = trim($_POST['password']);

        if(!empty($username) && !empty($password)){
            //Log user in
            $message = login($username, $password, $ip);
        }else{
            $message = 'Please fill out the required fields';
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login Page</title>
</head>
<body>
<section id="login-container">
    <h1 class="hidden">Login page</h1>
    <div id="help">
        <a href="help.html">Help</a>
    </div>
    <div id="stacked-logo">
        <img src="images/logo-stacked.svg" alt="Roku Flashback Logo">
    </div>
    <form @submit.prevent="login">
        <div class="login-form">
            <div class="username-field">
                <label for="inlineFormInputName"></label>
                <input v-model="input.username" type="text" placeholder="username" required>
            </div>

            <div class="password-field">
                <label for="inlineFormPassword"></label>
                <input v-model="input.password" type="password" placeholder="password" required>
            </div>

            <div class="submit-button">
                <button type="submit">Sign In</button>
            </div>
        </div>
        <div id="new-to-roku">
            <a href="sign-up.html">New to Roku? Sign up now.</a>
        </div>
    </form>  
</section>
</body>
</html>