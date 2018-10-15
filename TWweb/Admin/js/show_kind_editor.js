KindEditor.ready(function(K) {
    var editor1 = K.create('#content', {
        cssPath : 'js/kindeditor/plugins/code/prettify.css',
        uploadJson: 'ashx/upload_json.ashx',
        fileManagerJson: 'ashx/file_manager_json.ashx',
        allowFileManager : true,
        afterCreate : function() {
            var self = this;
            K.ctrl(document, 13, function() {
                self.sync();
                document.forms['example'].submit();
            });
            K.ctrl(self.edit.doc, 13, function() {
                self.sync();
                document.forms['example'].submit();
            });
        }
    });
    prettyPrint();
});