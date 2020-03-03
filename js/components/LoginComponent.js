export default {
    template: `
        <section id="login-container">
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
            //console.log(this.$parent.mockAccount.username);
            // debugger;
            if (this.input.username != "" && this.input.password != "") {
                // use the FormData object to collect and send our params
                let formData = new FormData();

                formData.append("username", this.input.username);
                formData.append("password", this.input.password);

                let url = "./includes/index.php?user=true";

                fetch(url, {
                    method: "POST",
                    body: formData
                })
                .then(res => res.json())
                .then(data => {
                    console.log(data);

                    // tell the app that we have a successful login
                    // and store the user object that we retrieved

                    // true below means that authentication worked
                    // data is the user we retrieved from the DB
                    this.$emit("authenticated", true, data[0]);

                    // push the user to the users page
                    this.$router.replace({name: "users"});                    
                })
                .catch((err) => console.log(err));

            } else {
                console.error("inputs can't be blank!");
            }
        }
    }
}