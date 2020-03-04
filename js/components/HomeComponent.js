export default {
    template: `
        <section>
        <div class="header header-logo-roku">
            <img src="images/logo_w_flashback-01.svg" alt="Logo Roku">
        </div>
        <div id="movies-section"
            <h1 class="hidden">Movies to choose from...</h1>
            <!-- movies trending now -->
            <div id="trending-now">
            <h1>Trending Now</h1>
            <div id="movies-flexbox">
                <img src="images/parasite_home_trending.jpg" alt="Parasite Thumbnail">
                <img src="images/killingeve_home_trending.jpg" alt="Killing Eve Thumbnail">
            </div>
            <!-- movies recommended for you-->
            <div id="recommended">
            <h1>Recommended for you</h1>
            <div id="movies-flexbox">
                <img src="images/thesimpsons.jpg" alt="The Simpsons Thumbnail">
                <img src="images/beautynbeast.jpg" alt="The beauty and the beast Thumbnail">
                <img src="images/thebigbangtheory.jpg" alt="The big bang theory Thumbnail">
            </div>
            </div>
        </div>
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