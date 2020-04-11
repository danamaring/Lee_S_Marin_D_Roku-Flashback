export default {
    name: "TheVideoComponentKids",

    template: `
    <section>
        <div class="row">
            <div class="col-12 order-2 order-md-1 col-md-3 media-container">
                <h4 class="media-title">{{currentMediaDetailsKids.movies_title}}</h4>
                <p class="media-details" v-html="currentMediaDetailsKids.movies_storyline"></p>
                <span class="media-time">{{currentMediaDetailsKids.movies_runtime}}</span>
                <span class="media-year">{{currentMediaDetailsKids.movies_year}}</span>
                <div>
                <!-- replace the link when the site is live -->
                    <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-width="" data-layout="button_count" data-action="like" data-size="small" data-share="true"></div>            
                    <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-width="" data-numposts="3"></div>
                </div>            
            </div>

            <div class="col-12 order-1 order-md-2 col-md-9 media-container">
                <video autoplay controls muted :src="'images/' + currentMediaDetailsKids.movies_trailer" class="fs-video"></video>
            </div>
        </div>

        <div class="col-12 col-sm-9 media-info">
            <ul class="media-genres">
                <li>
                    <a href="animation" @click.prevent="filterMedia('animation')">animation</a>
                </li>
                <li>
                    <a href="music" @click.prevent="filterMedia('music')">music</a>
                </li>
                <li>
                    <a href="family" @click.prevent="filterMedia('family')">Family</a>
                </li>
                <li>
                    <a href="fantasy" @click.prevent="filterMedia('fantasy')">Fantasy</a>
                </li>
                <li>
                    <a href="horror" @click.prevent="retrieveVideoContent">All</a>
                </li>
            </ul>
        </div>

        <div class="row">
            <div class="col-12 col-sm-9">
                <div class="thumb-wrapper clearfix">
                    <img v-for="item in allRetrievedVideosKids" :src="'images/' + item.movies_cover" alt="media
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
        filterMedia(filter) {
            // debugger;

            let url = `./admin/index.php?media=movies_kids&filter=${filter}`;

            fetch(url)
                .then(res => res.json())
                .then(data => {
                    this.allRetrievedVideosKids = data;
                    this.currentMediaDetailsKids = data[0];
                })

        },
        
        retrieveVideoContent() {
            // fetch all the video content here (don't care about filtering, genre etc at this point)
            // debugger;

            if (localStorage.getItem("cachedVideo")) {
                let url = `./admin/index.php?media=movies_kids`;

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