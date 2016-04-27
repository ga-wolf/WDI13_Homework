$(document).ready(function() {
    var pageNum;
    var query = '';
    var executed = false;
    var perPage = 100;

    var searchFlickr = function(term) {
        var flickrURL = 'https://api.flickr.com/services/rest/?jsoncallback=?';
        $.getJSON(flickrURL, {
            method: 'flickr.photos.search',
            api_key: '2f5ac274ecfac5a455f38745704ad084',
            text: term,
            format: 'json',
            page: pageNum,
            per_page: perPage
        }).done(function(data) {
            for (var i = 0; i < data.photos.photo.length; i++) {
                var url = generateURL(data.photos.photo[i]);
                var link = 'https://www.flickr.com/photos/' + data.photos.photo[i].owner +'/' + data.photos.photo[i].id;
                displayPhoto(url, link);
            }
            if (pageNum === data.photos.pages) {
                executed = true;
                console.log('did it');
                return;
            }
            pageNum++;
            executed = false;
        });
    };

    var displayPhoto = function(url, link) {
        var $img = $('<img>', {src: url});
        var $div = $('<div>');
        var $atag = $('<a>', {href: link});
        $div.addClass('imageDiv small');
        $img.appendTo($div);
        $div.appendTo($atag);
        $atag.appendTo('#results');
    };

    var generateURL = function(photo) {
        return [
            'http://farm',
            photo.farm,
            '.static.flickr.com/',
            photo.server,
            '/',
            photo.id,
            '_',
            photo.secret,
            '_q.jpg'
        ].join('');
    };

    $('#search').on('submit', function(e) {
        e.preventDefault();
        pageNum = 1;
        maxPages = 1;
        $('#results').removeClass('home-page');
        $('#results').html('');
        query = $('#query').val();
        searchFlickr(query);
    });


    $(window).on('scroll', function() {
        perPage = 40;
        var pixelsFromBottom = $(document).height() - $(window).scrollTop() - $(window).height();
        if (pixelsFromBottom < 1200 && executed === false) {
            executed = true;
            searchFlickr(query);
        }
    });

    $('.btn-size').on('click', function() {
        $('.imageDiv').removeClass('small medium large');
        var newClass = $(this).attr('id').slice(7);
        $('.imageDiv').addClass(newClass);
    });

});
