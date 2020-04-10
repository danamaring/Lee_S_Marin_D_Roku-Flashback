export default {
    template: `
        <div id="container">
            <div id="help">
                <a href="help.html">Help</a>
            </div>
            <div id="stacked-logo">
                <img src="images/logo-stacked.svg" alt="Roku Flashback Logo">
            </div>
            <div id="welcome">
                <p>Welcome to Roku Flashback!</p>
                <br>
                <p>Please enjoy Tv shows, 
                Movies and Musics.</p>
            </div>
            <form>
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
                        <button v-on:click.prevent="login()" type="submit">Sign In</button>
                    </div>
                </div>
                <div id="new-to-roku">
                    <a href="sign-up.html">New to Roku?  Sign up now.</a>
                </div>
            </form>

            
        </div>
     `,

    data() {
        return {
            input: {
                username: "",
                password: ""
            },

        }
    },

    methods: {
        login() {

            if (this.input.username != "" && this.input.password != "") {
                // fetch the user from the DB
                // generate the form data
                let formData = new FormData();

                formData.append("username", this.input.username);
                formData.append("password", this.input.password);

                let url = `./admin/admin_login.php`;

                fetch(url, {
                    method: 'POST',
                    body: formData
                })
                    .then(res => res.json())
                    .then(data => {
                        if (typeof data != "object") { // means that we're not getting a user object back
                            console.warn(data);
                            // just for testing
                            alert("authentication failed, please try again");
                        } else {
                            this.$emit("authenticated", true, data);
                            this.$router.replace({ name: "users" });
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            } else {
                console.log("A username and password must be present");
            }
        }
    }
}