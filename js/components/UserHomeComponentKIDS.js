import VideoComponentKids from "./VideoComponentKids.js";
import TvComponentKids from "./TvComponentKids.js";
import AudioComponent from "./AudioComponent.js";


export default {
    name: "TheUserHomeComponentKIDS",

    props: ['currentuser'],

    template: `
    <div id="kids">
        <component :is="this.activeComponent"></component>

        <!-- show media icons here -->
        <div class="row"> <!-- 2-up for nav and media info -->
            <nav class="col-12 col-sm-3 side-nav">
                <ul class="media-type">
                    <li v-for="media in mediaTypes" :data-type="media.description" @click="switchMedia(media.component)">
                        <span>
                            <i v-bind:class="[media.iconClass]"></i>
                        </span>
                        
                        <span class="d-none d-md-block">{{ media.description }}</span>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    `,

    data: function() {
        return {
            activeComponent: VideoComponentKids,
            
            mediaTypes: [
                { iconClass: "fas fa-film", description: "Movies", component: VideoComponentKids },
                { iconClass: "fas fa-tv", description: "Television", component: TvComponentKids },
                { iconClass: "fas fa-headphones", description: "Music", component: AudioComponent }
            ]
        }
    },

    methods: {
        switchMedia(theComponent) {
            this.activeComponent = theComponent;
        }
    }
}