// Design:  Chris Burton
// URL:     chrisburton.me
// JS by: https://github.com/vitorarjol

Vue.component('like', {
    template: "<div class='like-data'><button class='icon-rocknroll' v-class='active: liked' v-on='click: toggleLike'>&hearts;</button><span class='like-count' v-class='active: liked'>{{ likesCount }}</span></div>",
    data: function() {
        return {
            liked: false,
            likesCount: 0
        }
    },
    methods: {
        toggleLike: function() {
            this.liked = !this.liked;
            this.liked ? this.likesCount++ : this.likesCount--;
        }
    }
});
new Vue({
    el: '#app',
});