/* moved helper templates out of erb-generated image upload file */

wysiHelpers = {
    getImageTemplate: function() {
        /* this is what goes in the wysiwyg content after the image has been chosen */
        var tmpl;
        tmpl = _.template("<img class='<%= klass %>' src='<%= url %>' alt='<%= caption %>'>");
        return tmpl;
    }
};