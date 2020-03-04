export default {
    template: `
    <section>
        <!-- header -->
        <div>
            <img src="images/user_edit_icon.svg" alt="Edit User">
        </div>
        <div>
            <img src="images/logo-stacked.svg" alt="Roku Flashback">
            <h3>Who's Watching?</h3>
        </div>
        <div>
            <div id="profile-flexbox">
                <a href="">
                    <img src="images/profile1.jpg" alt="Profile 1">
                    <h3>Vivian</h3>
                </a>
                <a href="">
                    <img src="images/profile2.jpg" alt="Profile 2">
                    <h3>Tom</h3>
                </a>
                <a href="">
                    <img src="images/profile3.jpg" alt="Profile 3">
                    <h3>Lily</h3>
                </a>
                <a href="">
                    <img src="images/add_icon.svg" alt="Create a new profile">
                    <h3>Add Profile</h3>
                </a>
            </div>
        </div>
    </section>
    `,

    data() {
        return {
            message: "Who's Using Roku?",
            userList: []
        }
    }
}