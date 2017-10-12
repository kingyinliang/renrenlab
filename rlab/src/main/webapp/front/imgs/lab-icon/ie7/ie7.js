/* To avoid CSS expressions while still supporting IE 7 and IE 6, use this script */
/* The script tag referencing this file must be placed before the ending body tag. */

/* Use conditional comments in order to target IE 7 and older:
	<!--[if lt IE 8]><!-->
	<script src="ie7/ie7.js"></script>
	<!--<![endif]-->
*/

(function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'lab-icon\'">' + entity + '</span>' + html;
	}
	var icons = {
		'lab-arrow-down': '&#xe900;',
		'lab-arrow-left': '&#xe901;',
		'lab-arrow-right': '&#xe902;',
		'lab-arrow-up': '&#xe903;',
		'lab-identifying-code': '&#xe904;',
		'lab-more': '&#xe905;',
		'lab-phone-type-2': '&#xe906;',
		'lab-qr-code-1': '&#xe907;',
		'lab-stick': '&#xe908;',
		'lab-addicon': '&#xe909;',
		'lab-adress': '&#xe90a;',
		'lab-alter': '&#xe90b;',
		'lab-await': '&#xe90c;',
		'lab-checked-1': '&#xe90d;',
		'lab-checked-2': '&#xe90e;',
		'lab-checked-3': '&#xe90f;',
		'lab-close-1': '&#xe910;',
		'lab-close-2': '&#xe911;',
		'lab-commont': '&#xe912;',
		'lab-company': '&#xe913;',
		'lab-coupon': '&#xe914;',
		'lab-data': '&#xe915;',
		'lab-del': '&#xe916;',
		'lab-down': '&#xe917;',
		'lab-exit': '&#xe918;',
		'lab-godAdress': '&#xe919;',
		'lab-godPrice': '&#xe91a;',
		'lab-godScheme': '&#xe91b;',
		'lab-godTime': '&#xe91c;',
		'lab-history': '&#xe91d;',
		'lab-im': '&#xe91e;',
		'lab-instrument': '&#xe91f;',
		'lab-lock': '&#xe920;',
		'lab-order': '&#xe921;',
		'lab-phone': '&#xe922;',
		'lab-scheme': '&#xe923;',
		'lab-search': '&#xe924;',
		'lab-service': '&#xe925;',
		'lab-set': '&#xe926;',
		'lab-share-1': '&#xe927;',
		'lab-tip': '&#xe928;',
		'lab-top': '&#xe929;',
		'lab-user': '&#xe92a;',
		'0': 0
		},
		els = document.getElementsByTagName('*'),
		i, c, el;
	for (i = 0; ; i += 1) {
		el = els[i];
		if(!el) {
			break;
		}
		c = el.className;
		c = c.match(/lab-[^\s'"]+/);
		if (c && icons[c[0]]) {
			addIcon(el, icons[c[0]]);
		}
	}
}());
