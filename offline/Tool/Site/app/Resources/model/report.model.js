var reportModel = function () {

    /**
     *
     * @type {{name: string, department: string, coordinator: string, nrOfParticipants: string, dateAssessment: string, dateLatestAssessment: string, dateDesiredSituation: string, comment: string}}
     */
    this.data = {
        version: 0,
        name: '',
        department: '',
        coordinator: '',
        secretary: '',
        nrOfParticipants: '',
        dateAssessment: '',
        dateLatestAssessment: '',
        dateDesiredSituation: '',
        comment: ''
    }

    /**
     *
     * @type {Array}
     */
    this.reportItems = [];

    /**
     *
     * @private
     */
    this.__construct = function () {
        var url = window.location.pathname, filename = url.substring(url.lastIndexOf('/') + 1);
        if (localStorage.hasOwnProperty('reportModel')) {
            if (filename == 'new.html') {
                window.location = './quickView.html'
            }
            var storage = JSON.parse(localStorage.reportModel);
            this.data = storage.data;
            this.reportItems = storage.reportItems;
        } else {
            if (filename != 'new.html') {
                window.location = './new.html';
            }
        }
        this.set('version', settings.version.id);
    }

    /**
     *
     * @param field
     * @param value
     */
    this.set = function (field, value) {
        this.data[field] = value;
    }

    /**
     *
     * @param chapterNr
     * @returns {*}
     */
    this.getChapter = function (chapterNr) {
        for (var i in this.reportItems) {
            var chapter = this.reportItems[i];
            if (chapter.chapterNr == chapterNr) {
                return chapter;
            }
        }
        return false; // return false if failed to retrieve the chapter
    }

    /**
     *
     * @param chapterNr
     * @returns {boolean}
     */
    this.addChapter = function (chapterNr) {
        if (!this.getChapter(chapterNr)) { // safety check to check if the chapter already exists, so we do not overwrite it
            var chapter = {
                chapterNr: chapterNr,
                children: []
            }
            this.reportItems.push(chapter);
            if (this.getChapter(chapterNr)) { // check if the chapter has been added.
                return true;
            }
        }
        return false; // return false if failed
    }

    /**
     *
     * @param chapterNr
     * @param paragraphNr
     * @returns {*}
     */
    this.getParagraph = function (chapterNr, paragraphNr) {
        var chapter = this.getChapter(chapterNr); // get the chapter
        if (!chapter) {
            return false; // return false if chapter does not exist
        } else { // create the chapter
            for (var i in chapter.children) {
                var paragraph = chapter.children[i];
                if (paragraph.paragraphNr == paragraphNr) {
                    return paragraph;
                }
            }
        }
        return false; // return false if failed to retrieve the paragraph
    }

    /**
     *
     * @param chapterNr
     * @param paragraphNr
     * @returns {boolean}
     */
    this.addParagraph = function (chapterNr, paragraphNr) {
        if (!this.getParagraph(chapterNr, paragraphNr)) { // safety check to check if the paragraph already exists, so we do not overwrite it
            if (!this.getChapter(chapterNr)) {
                return false; // return false if the chapter does not exist, we cannot add the paragraph
            } else { // create the paragraph
                var paragraph = {
                    paragraphNr: paragraphNr,
                }
                for (var i in this.reportItems) {
                    var chapter = this.reportItems[i];
                    if (chapter.chapterNr == chapterNr) {
                        this.reportItems[i]['children'].push(paragraph);
                    }
                }
            }
        }
        return false; // return false if paragraph
    }

    /**
     *
     * @param chapterNr
     * @param paragraphNr
     * @param data
     * @returns {boolean}
     */
    this.paragraphSet = function (chapterNr, paragraphNr, data) {
        var i, ii;
        if (this.getParagraph(chapterNr, paragraphNr) != false) {

            for (i in this.reportItems) {
                var chapter = this.reportItems[i];
                if (chapter.chapterNr == chapterNr) {
                    //
                    for (ii in chapter.children) {
                        var paragraph = chapter.children[ii];
                        if (paragraph.paragraphNr == paragraphNr) {

                            for (property in data) {
                                this.reportItems[i]['children'][ii][property] = data[property];
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    /**
     * saves the current state of the object to localStorage
     *
     * @returns {boolean}
     */
    this.save = function () {
        var report = {};
        report.data = this.data;
        report.reportItems = this.reportItems;
        localStorage.reportModel = JSON.stringify(report);
        return localStorage.reportModel == JSON.stringify(report)
    }

    /**
     *
     * @returns {*}
     */
    this.toJson = function () {
        var data = {};
        for (field in this.data) {
            data[field] = this.data[field];
        }
        data.reportItems = this.reportItems;
        return JSON.stringify(data);
    }

    /**
     *
     */
    this.__construct(); // execute construct when creating the object.
}