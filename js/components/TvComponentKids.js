export default {
    name: "TheTvComponentKids",

    template: `
    <section>
        <div class="row">
            <div class="col-12 order-2 order-md-1 col-md-3 media-container">
                <h4 class="media-title">{{currentMediaDetailsKids.tv_title}}</h4>
                <p class="media-details" v-html="currentMediaDetailsKids.tv_storyline"></p>
                <span class="media-year">{{currentMediaDetailsKids.tv_year}}</span>
            </div>

            <div class="col-12 order-1 order-md-2 col-md-9 media-container">
                <video autoplay controls muted :src="'images/' + currentMediaDetailsKids.tv_trailer" class="fs-video"></video>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-sm-9">
                <div class="thumb-wrapper clearfix">
                    <img v-for="item in allRetrievedVideosKids" :src="'images/' + item.tv_cover" alt="media
                    thumb" @click="loadNewMovieKids(item)" class="img-thumbnail rounded float-left
                    media-thumb">
                </div>
            </div>
        </div>
    </section>
    `,

    data: function () {
        return {
            currentMediaDetailsKids: {},
            allRetrievedVideosKids: []
        }
    },

    created: function() {
        this.retrieveVideoContent();
    },

    methods: {
        retrieveVideoContent() {
            // fetch all the video content here (don't care about filtering, genre etc at this point)
            // debugger;

            if (localStorage.getItem("cachedVideo")) {
                let url = `./admin/index.php?media=tv_kids`;

                fetch(url)
                    .then(res => res.json())
                    .then(data => {
                        localStorage.setItem("cachedVideo", JSON.stringify(data));

                        this.allRetrievedVideosKids = data;
                        this.currentMediaDetailsKids = data[0];
                    })

            } else {
                this.allRetrievedVideosKids = JSON.parse(localStorage.getItem("cachedVideo"));

                this.currentMediaDetailsKids = this.allRetrievedVideosKids[0];
            }

        },

        loadNewMovieKids(movie) {
            this.currentMediaDetailsKids = movie;
        }
    }
}