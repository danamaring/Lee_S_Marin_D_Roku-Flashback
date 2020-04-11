export default {
    name: "TheAudioComponent",

    template: `
    <section>
        <div class="row">
            <div class="col-12 order-2 order-md-1 col-md-3 media-container">
                <h4 class="media-title">{{currentMediaDetails.music_title}}</h4>
                <p class="media-details" v-html="currentMediaDetails.music_lyrics"></p>
                <span class="media-year">{{currentMediaDetails.music_year}}</span>
                <div class="social-media-here">
                <!-- replace the link when the site is live -->
                    <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-width="" data-layout="button_count" data-action="like" data-size="small" data-share="true"></div>            
                    <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-width="" data-numposts="3"></div>
                </div>            
            </div>

            <div class="col-12 col-sm-9 media-info">
            <ul class="media-genres">
                <li>
                    <a href="pop" @click.prevent="filterMedia('pop')">pop</a>
                </li>
                <li>
                    <a href="dance" @click.prevent="filterMedia('dance')">dance</a>
                </li>
                <li>
                    <a href="rock" @click.prevent="filterMedia('rock')">rock</a>
                </li>
                <li>
                    <a href="folk" @click.prevent="filterMedia('folk')">folk</a>
                </li>
                <li>
                    <a href="horror" @click.prevent="retrieveVideoContent">All</a>
                </li>
            </ul>
        </div>

            <div>
                <audio autoplay controls :src="'images/' + currentMediaDetails.music_audio"></audio>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-sm-9">
                <div class="thumb-wrapper clearfix">
                    <img v-for="item in allRetrievedVideos" :src="'images/' + item.music_cover" alt="media
                    thumb" @click="loadNewMovie(item)" class="img-thumbnail rounded float-left
                    media-thumb">
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

            let url = `./admin/index.php?media=music&filter=${filter}`;

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
                let url = `./admin/index.php?media=music`;

                fetch(url)
                    .then(res => res.json())
                    .then(data => {
                        localStorage.setItem("cachedVideo", JSON.stringify(data));

                        this.allRetrievedVideos = data;
                        this.currentMediaDetails = data[0];
                    })

            } else {
                this.allRetrievedVideos = JSON.parse(localStorage.getItem("cachedVideo"));
                this.currentMediaDetails = this.allRetrievedVideos[0];
            }

        },

        loadNewMovie(movie) {
            this.currentMediaDetails = movie;
        }
    }
}