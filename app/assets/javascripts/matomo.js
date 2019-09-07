var idSite = 1;
var matomoTrackingApiUrl = 'https://matomo.pfischbeck.de/matomo.php';

var _paq = window._paq || [];
_paq.push(['setTrackerUrl', matomoTrackingApiUrl]);
_paq.push(['setSiteId', idSite]);
_paq.push(['trackPageView']);
_paq.push(['enableLinkTracking']);

// Send Matomo a new event when navigating to a new page using Turbolinks
// (see https://developer.matomo.org/guides/spa-tracking)
(function() {
    var previousPageUrl = null;
    addEventListener('turbolinks:load', function(event) {
        if (previousPageUrl) {
            _paq.push(['setReferrerUrl', previousPageUrl]);
            _paq.push(['setCustomUrl', window.location.href]);
            _paq.push(['setDocumentTitle', document.title]);
            if (event.data && event.data.timing) {
                _paq.push(['setGenerationTimeMs', event.data.timing.visitEnd - event.data.timing.visitStart]);
            }
            _paq.push(['trackPageView']);
        }
        previousPageUrl = window.location.href;
    });
})();