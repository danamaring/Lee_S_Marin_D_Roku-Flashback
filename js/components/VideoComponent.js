export default {
    name: "TheVideoComponent",

    template: `
    <section>
        <div class="row">
            <div class="col-12 order-2 order-md-1 col-md-3 media-container">
                <h4 class="media-title">{{currentMediaDetails.movies_title}}</h4>
                <p class="media-details" v-html="currentMediaDetails.movies_storyline"></p>
                <span class="media-time">{{currentMediaDetails.movies_runtime}}</span>
                <span class="media-year">{{currentMediaDetails.movies_year}}</span>
                <div>
                <!-- replace the link when the site is live -->
                    <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-width="" data-layout="button_count" data-action="like" data-size="small" data-share="true"></div>            
                    <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-width="" data-numposts="3"></div>
                </div>
            </div>
            
            <div class="col-12 order-1 order-md-2 col-md-9 media-container">
                <video autoplay controls muted :src="'images/' + currentMediaDetails.movies_trailer" class="fs-video"></video>
            </div>
        </div>
        <div class="col-12 col-sm-9 media-info">
            <ul class="media-genres">
                <li>
                    <a href="horror" @click.prevent="filterMedia('horror')">Horror</a>
                </li>
                <li>
                    <a href="comedy" @click.prevent="filterMedia('comedy')">Comedy</a>
                </li>
                <li>
                    <a href="family" @click.prevent="filterMedia('family')">Family</a>
                </li>
                <li>
                    <a href="horror" @click.prevent="filterMedia('fantasy')">Fantasy</a>
                </li>
                <li>
                    <a href="horror" @click.prevent="retrieveVideoContent">All</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="coverS">
                <div class="col-12 col-sm-9 posterC">
                    <div class="thumb-wrapper clearfix">
                        <img v-for="item in allRetrievedVideos" :src="'images/' + item.movies_cover" alt="media
                        thumb" @click="loadNewMovie(item)" class="img-thumbnail rounded float-left
                        media-thumb">
                    </div>
                </div>
            </div>    
        </div>
    </section>
    `,

    data: function () {
        return {
            currentMediaDetails: {},
            allRetrievedVideos: []
        }
    },

    created: function() {
        this.retrieveVideoContent();
    },

    methods: {
        filterMedia(filter) {
            // debugger;

            let url = `./admin/index.php?media=movies&filter=${filter}`;

            fetch(url)
                .then(res => res.json())
                .then(data => {
                    this.allRetrievedVideos = data;
                    this.currentMediaDetails = data[0];
                })

        },

        retrieveVideoContent() {
            // fetch all the video content here (don't care about filtering, genre etc at this point)
            // debugger;

            if (localStorage.getItem("cachedVideo")) {
                this.allRetrievedVideos = JSON.parse(localStorage.getItem("cachedVideo"));

                this.currentMediaDetails = this.allRetrievedVideos[0];

            } else {
                let url = `./admin/index.php?media=movies`;

                fetch(url)
                    .then(res => res.json())
                    .then(data => {
                        localStorage.setItem("cachedVideo", JSON.stringify(data));

                        this.allRetrievedVideos = data;
                        this.currentMediaDetails = data[0];
                    })
            }

        },

        loadNewMovie(movie) {
            this.currentMediaDetails = movie;
        }
    }
}