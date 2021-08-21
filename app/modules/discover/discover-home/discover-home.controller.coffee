###
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2021-present Kaleidos Ventures SL
###

class DiscoverHomeController
    @.$inject = [
        'tgCurrentUserService',
        '$tgLocation',
        '$tgNavUrls',
        'tgAppMetaService',
        '$translate'
    ]

    constructor: (@currentUserService, @location, @navUrls, @appMetaService, @translate) ->
        if not @currentUserService.getUser()
            @location.path(@navUrls.resolve("login"))
        else
            title = @translate.instant("DISCOVER.PAGE_TITLE")
            description = @translate.instant("DISCOVER.PAGE_DESCRIPTION")
            @appMetaService.setAll(title, description)

    onSubmit: (q) ->
        url = @navUrls.resolve('discover-search')

        @location.search('text', q).path(url)

angular.module("taigaDiscover").controller("DiscoverHome", DiscoverHomeController)
