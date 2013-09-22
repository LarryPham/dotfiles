/*!
 * Ghostery for Chrome
 * http://www.ghostery.com/
 *
 * Copyright 2013 EVIDON, Inc. All rights reserved.
 * See ghostery_eula.txt for license.
 */

define([
	'underscore',
	'backbone',
	'lib/utils'
], function (_, Backbone, utils) {

	var dispatcher = _.clone(Backbone.Events),
		_on = dispatcher.on,
		_trigger = dispatcher.trigger;

	dispatcher.on = function () {
		utils.log("dispatcher.on called with %o", arguments);
		_on.apply(this, arguments);
	};

	dispatcher.trigger = function () {
		utils.log("dispatcher.trigger called with %o", arguments);
		_trigger.apply(this, arguments);
	};

	return dispatcher;

});
