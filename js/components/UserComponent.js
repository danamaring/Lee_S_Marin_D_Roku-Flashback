export default {
    props: ['liveuser'],

    template: `
    <div class="col-xs-12 col-sm-6 col-md-4 mx-auto">
        <div @click="navToUserHome()">
            <div class="card-body text-center">
                <img :src="'images/user/' + liveuser.avatar + '.jpg'" class="rounded-circle img-fluid">
                <p>{{ liveuser.username }}</p>
            </div>
        </div>
    </div>`,

    created: function() {
        if (this.liveuser.avatar === null || this.liveuser.avatar === "null") {
            this.liveuser.avatar = "temp_avatar";
        }
    },

    methods: {
        navToUserHome() {
            // debugger;
            // send this user to its home page, and pass the user object to the home page
            if (this.liveuser.admin === "1") {
                localStorage.setItem("cachedUser", JSON.stringify(this.liveuser));
                this.$router.push({ name: "home", params: { currentuser: this.liveuser }})
            } else {
                localStorage.setItem("cachedUser", JSON.stringify(this.liveuser));
                this.$router.push({ name: "homekids", params: { currentuser: this.liveuser }})
            }
        }
    }

}