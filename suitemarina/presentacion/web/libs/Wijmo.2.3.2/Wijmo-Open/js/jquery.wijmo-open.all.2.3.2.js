/*
 *
 * Wijmo Library 2.3.2
 * http://wijmo.com/
 *
 * Copyright(c) GrapeCity, Inc.  All rights reserved.
 * 
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * licensing@wijmo.com
 * http://wijmo.com/widgets/license/
 *
 **/
/*!
 * Globalize
 *
 * http://github.com/jquery/globalize
 *
 * Copyright Software Freedom Conservancy, Inc.
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 */ (function (z, y) {
    var a, x, t, s, w, c, j, r, k, v, p, e, b, q, f, h, m, n, u, l, g, i, o, d;
    a = function (b) {
        return new a.prototype.init(b)
    };
    if (typeof require !== "undefined" && typeof exports !== "undefined" && typeof module !== "undefined") module.exports = a;
    else z.Globalize = a;
    a.cultures = {};
    a.prototype = {
        constructor: a,
        init: function (b) {
            this.cultures = a.cultures;
            this.cultureSelector = b;
            return this
        }
    };
    a.prototype.init.prototype = a.prototype;
    a.cultures["default"] = {
        name: "en",
        englishName: "English",
        nativeName: "English",
        isRTL: false,
        language: "en",
        numberFormat: {
            pattern: ["-n"],
            decimals: 2,
            ",": ",",
            ".": ".",
            groupSizes: [3],
            "+": "+",
            "-": "-",
            NaN: "NaN",
            negativeInfinity: "-Infinity",
            positiveInfinity: "Infinity",
            percent: {
                pattern: ["-n %", "n %"],
                decimals: 2,
                groupSizes: [3],
                ",": ",",
                ".": ".",
                symbol: "%"
            },
            currency: {
                pattern: ["($n)", "$n"],
                decimals: 2,
                groupSizes: [3],
                ",": ",",
                ".": ".",
                symbol: "$"
            }
        },
        calendars: {
            standard: {
                name: "Gregorian_USEnglish",
                "/": "/",
                ":": ":",
                firstDay: 0,
                days: {
                    names: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
                    namesAbbr: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
                    namesShort: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
                },
                months: {
                    names: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""],
                    namesAbbr: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", ""]
                },
                AM: ["AM", "am", "AM"],
                PM: ["PM", "pm", "PM"],
                eras: [{
                    name: "A.D.",
                    start: null,
                    offset: 0
                }],
                twoDigitYearMax: 2029,
                patterns: {
                    d: "M/d/yyyy",
                    D: "dddd, MMMM dd, yyyy",
                    t: "h:mm tt",
                    T: "h:mm:ss tt",
                    f: "dddd, MMMM dd, yyyy h:mm tt",
                    F: "dddd, MMMM dd, yyyy h:mm:ss tt",
                    M: "MMMM dd",
                    Y: "yyyy MMMM",
                    S: "yyyy'-'MM'-'dd'T'HH':'mm':'ss"
                }
            }
        },
        messages: {}
    };
    a.cultures["default"].calendar = a.cultures["default"].calendars.standard;
    a.cultures.en = a.cultures["default"];
    a.cultureSelector = "en";
    x = /^0x[a-f0-9]+$/i;
    t = /^[+-]?infinity$/i;
    s = /^[+-]?\d*\.?\d*(e[+-]?\d+)?$/;
    w = /^\s+|\s+$/g;
    c = function (a, c) {
        if (a.indexOf) return a.indexOf(c);
        for (var b = 0, d = a.length; b < d; b++) if (a[b] === c) return b;
        return -1
    };
    j = function (b, a) {
        return b.substr(b.length - a.length) === a
    };
    r = function (i) {
        var g, d, c, b, f, h, a = arguments[0] || {}, e = 1,
            j = arguments.length,
            i = false;
        if (typeof a === "boolean") {
            i = a;
            a = arguments[1] || {};
            e = 2
        }
        if (typeof a !== "object" && !v(a)) a = {};
        for (; e < j; e++) if ((g = arguments[e]) != null) for (d in g) {
            c = a[d];
            b = g[d];
            if (a === b) continue;
            if (i && b && (p(b) || (f = k(b)))) {
                if (f) {
                    f = false;
                    h = c && k(c) ? c : []
                } else h = c && p(c) ? c : {};
                a[d] = r(i, h, b)
            } else if (b !== y) a[d] = b
        }
        return a
    };
    k = Array.isArray || function (a) {
        return Object.prototype.toString.call(a) === "[object Array]"
    };
    v = function (a) {
        return Object.prototype.toString.call(a) === "[object Function]"
    };
    p = function (a) {
        return Object.prototype.toString.call(a) === "[object Object]"
    };
    e = function (b, a) {
        return b.indexOf(a) === 0
    };
    b = function (a) {
        return (a + "").replace(w, "")
    };
    q = function (a) {
        return isNaN(a) ? NaN : a | 0
    };
    f = function (a, c, d) {
        for (var b = a.length; b < c; b += 1) a = d ? "0" + a : a + "0";
        return a
    };
    h = function (e, b) {
        for (var d = 0, a = false, c = 0, g = e.length; c < g; c++) {
            var f = e.charAt(c);
            switch (f) {
                case "'":
                    if (a) b.push("'");
                    else d++;
                    a = false;
                    break;
                case "\\":
                    a && b.push("\\");
                    a = !a;
                    break;
                default:
                    b.push(f);
                    a = false
            }
        }
        return d
    };
    m = function (e, a) {
        a = a || "F";
        var b, d = e.patterns,
            c = a.length;
        if (c === 1) {
            b = d[a];
            if (!b) throw "Invalid date format string '" + a + "'.";
            a = b
        } else if (c === 2 && a.charAt(0) === "%") a = a.charAt(1);
        return a
    };
    n = function (b, f, r) {
        var c = r.calendar,
            s = c.convert;
        if (!f || !f.length || f === "i") {
            var a;
            if (r && r.name.length) if (s) a = n(b, c.patterns.F, r);
            else {
                var z = new Date(b.getTime()),
                    H = g(b, c.eras);
                z.setFullYear(i(b, c, H));
                a = z.toLocaleString()
            } else a = b.toString();
            return a
        }
        var A = c.eras,
            y = f === "s";
        f = m(c, f);
        a = [];
        var j, G = ["0", "00", "000"],
            p, w, B = /([^d]|^)(d|dd)([^d]|$)/g,
            x = 0,
            v = l(),
            o;

        function e(d, a) {
            var b, c = d + "";
            if (a > 1 && c.length < a) {
                b = G[a - 2] + c;
                return b.substr(b.length - a, a)
            } else b = c;
            return b
        }
        function D() {
            if (p || w) return p;
            p = B.test(f);
            w = true;
            return p
        }
        function u(a, b) {
            if (o) return o[b];
            switch (b) {
                case 0:
                    return a.getFullYear();
                case 1:
                    return a.getMonth();
                case 2:
                    return a.getDate()
            }
        }
        if (!y && s) o = s.fromGregorian(b);
        for (;;) {
            var E = v.lastIndex,
                q = v.exec(f),
                C = f.slice(E, q ? q.index : f.length);
            x += h(C, a);
            if (!q) break;
            if (x % 2) {
                a.push(q[0]);
                continue
            }
            var t = q[0],
                d = t.length;
            switch (t) {
                case "ddd":
                case "dddd":
                    var F = d === 3 ? c.days.namesAbbr : c.days.names;
                    a.push(F[b.getDay()]);
                    break;
                case "d":
                case "dd":
                    p = true;
                    a.push(e(u(b, 2), d));
                    break;
                case "MMM":
                case "MMMM":
                    var k = u(b, 1);
                    a.push(c.monthsGenitive && D() ? c.monthsGenitive[d === 3 ? "namesAbbr" : "names"][k] : c.months[d === 3 ? "namesAbbr" : "names"][k]);
                    break;
                case "M":
                case "MM":
                    a.push(e(u(b, 1) + 1, d));
                    break;
                case "y":
                case "yy":
                case "yyyy":
                    k = o ? o[0] : i(b, c, g(b, A), y);
                    if (d < 4) k = k % 100;
                    a.push(e(k, d));
                    break;
                case "h":
                case "hh":
                    j = b.getHours() % 12;
                    if (j === 0) j = 12;
                    a.push(e(j, d));
                    break;
                case "H":
                case "HH":
                    a.push(e(b.getHours(), d));
                    break;
                case "m":
                case "mm":
                    a.push(e(b.getMinutes(), d));
                    break;
                case "s":
                case "ss":
                    a.push(e(b.getSeconds(), d));
                    break;
                case "t":
                case "tt":
                    k = b.getHours() < 12 ? c.AM ? c.AM[0] : " " : c.PM ? c.PM[0] : " ";
                    a.push(d === 1 ? k.charAt(0) : k);
                    break;
                case "f":
                case "ff":
                case "fff":
                    a.push(e(b.getMilliseconds(), 3).substr(0, d));
                    break;
                case "z":
                case "zz":
                    j = b.getTimezoneOffset() / 60;
                    a.push((j <= 0 ? "+" : "-") + e(Math.floor(Math.abs(j)), d));
                    break;
                case "zzz":
                    j = b.getTimezoneOffset() / 60;
                    a.push((j <= 0 ? "+" : "-") + e(Math.floor(Math.abs(j)), 2) + ":" + e(Math.abs(b.getTimezoneOffset() % 60), 2));
                    break;
                case "g":
                case "gg":
                    c.eras && a.push(c.eras[g(b, A)].name);
                    break;
                case "/":
                    a.push(c["/"]);
                    break;
                default:
                    throw "Invalid date format pattern '" + t + "'.";
            }
        }
        return a.join("")
    };
    (function () {
        var a;
        a = function (j, h, l) {
            var m = l.groupSizes,
                i = m[0],
                k = 1,
                p = Math.pow(10, h),
                n = Math.round(j * p) / p;
            if (!isFinite(n)) n = j;
            j = n;
            var b = j + "",
                a = "",
                e = b.split(/e/i),
                c = e.length > 1 ? parseInt(e[1], 10) : 0;
            b = e[0];
            e = b.split(".");
            b = e[0];
            a = e.length > 1 ? e[1] : "";
            var q;
            if (c > 0) {
                a = f(a, c, false);
                b += a.slice(0, c);
                a = a.substr(c)
            } else if (c < 0) {
                c = -c;
                b = f(b, c + 1);
                a = b.slice(-c, b.length) + a;
                b = b.slice(0, -c)
            }
            if (h > 0) a = l["."] + (a.length > h ? a.slice(0, h) : f(a, h));
            else a = "";
            var d = b.length - 1,
                o = l[","],
                g = "";
            while (d >= 0) {
                if (i === 0 || i > d) return b.slice(0, d + 1) + (g.length ? o + g + a : a);
                g = b.slice(d - i + 1, d + 1) + (g.length ? o + g : "");
                d -= i;
                if (k < m.length) {
                    i = m[k];
                    k++
                }
            }
            return b.slice(0, d + 1) + o + g + a
        };
        u = function (d, e, j) {
            if (!isFinite(d)) return d === Infinity ? j.numberFormat.positiveInfinity : d === -Infinity ? j.numberFormat.negativeInfinity : j.numberFormat.NaN;
            if (!e || e === "i") return j.name.length ? d.toLocaleString() : d.toString();
            e = e || "D";
            var i = j.numberFormat,
                b = Math.abs(d),
                g = -1,
                k;
            if (e.length > 1) g = parseInt(e.slice(1), 10);
            var m = e.charAt(0).toUpperCase(),
                c;
            switch (m) {
                case "D":
                    k = "n";
                    b = q(b);
                    if (g !== -1) b = f("" + b, g, true);
                    if (d < 0) b = "-" + b;
                    break;
                case "N":
                    c = i;
                case "C":
                    c = c || i.currency;
                case "P":
                    c = c || i.percent;
                    k = d < 0 ? c.pattern[0] : c.pattern[1] || "n";
                    if (g === -1) g = c.decimals;
                    b = a(b * (m === "P" ? 100 : 1), g, c);
                    break;
                default:
                    throw "Bad number format specifier: " + m;
            }
            for (var n = /n|\$|-|%/g, h = "";;) {
                var o = n.lastIndex,
                    l = n.exec(k);
                h += k.slice(o, l ? l.index : k.length);
                if (!l) break;
                switch (l[0]) {
                    case "n":
                        h += b;
                        break;
                    case "$":
                        h += i.currency.symbol;
                        break;
                    case "-":
                        if (/[1-9]/.test(b)) h += i["-"];
                        break;
                    case "%":
                        h += i.percent.symbol
                }
            }
            return h
        }
    })();
    l = function () {
        return /\/|dddd|ddd|dd|d|MMMM|MMM|MM|M|yyyy|yy|y|hh|h|HH|H|mm|m|ss|s|tt|t|fff|ff|f|zzz|zz|z|gg|g/g
    };
    g = function (e, c) {
        if (!c) return 0;
        for (var b, d = e.getTime(), a = 0, f = c.length; a < f; a++) {
            b = c[a].start;
            if (b === null || d >= b) return a
        }
        return 0
    };
    i = function (d, b, e, c) {
        var a = d.getFullYear();
        if (!c && b.eras) a -= b.eras[e].offset;
        return a
    };
    (function () {
        var p, n, k, j, a, f, d;
        p = function (d, b) {
            if (b < 100) {
                var e = new Date,
                    f = g(e),
                    c = i(e, d, f),
                    a = d.twoDigitYearMax;
                a = typeof a === "string" ? (new Date).getFullYear() % 100 + parseInt(a, 10) : a;
                b += c - c % 100;
                if (b > a) b -= 100
            }
            return b
        };
        n = function (h, b, i) {
            var e, g = h.days,
                a = h._upperDays;
            if (!a) h._upperDays = a = [d(g.names), d(g.namesAbbr), d(g.namesShort)];
            b = f(b);
            if (i) {
                e = c(a[1], b);
                if (e === -1) e = c(a[2], b)
            } else e = c(a[0], b);
            return e
        };
        k = function (a, e, k) {
            var j = a.months,
                i = a.monthsGenitive || a.months,
                b = a._upperMonths,
                g = a._upperMonthsGen;
            if (!b) {
                a._upperMonths = b = [d(j.names), d(j.namesAbbr)];
                a._upperMonthsGen = g = [d(i.names), d(i.namesAbbr)]
            }
            e = f(e);
            var h = c(k ? b[1] : b[0], e);
            if (h < 0) h = c(k ? g[1] : g[0], e);
            return h
        };
        j = function (d, g) {
            var e = d._parseRegExp;
            if (!e) d._parseRegExp = e = {};
            else {
                var o = e[g];
                if (o) return o
            }
            var f = m(d, g).replace(/([\^\$\.\*\+\?\|\[\]\(\)\{\}])/g, "\\\\$1"),
                b = ["^"],
                p = [],
                i = 0,
                n = 0,
                k = l(),
                c;
            while ((c = k.exec(f)) !== null) {
                var s = f.slice(i, c.index);
                i = k.lastIndex;
                n += h(s, b);
                if (n % 2) {
                    b.push(c[0]);
                    continue
                }
                var j = c[0],
                    t = j.length,
                    a;
                switch (j) {
                    case "dddd":
                    case "ddd":
                    case "MMMM":
                    case "MMM":
                    case "gg":
                    case "g":
                        a = "(\\D+)";
                        break;
                    case "tt":
                    case "t":
                        a = "(\\D*)";
                        break;
                    case "yyyy":
                    case "fff":
                    case "ff":
                    case "f":
                        a = "(\\d{" + t + "})";
                        break;
                    case "dd":
                    case "d":
                    case "MM":
                    case "M":
                    case "yy":
                    case "y":
                    case "HH":
                    case "H":
                    case "hh":
                    case "h":
                    case "mm":
                    case "m":
                    case "ss":
                    case "s":
                        a = "(\\d\\d?)";
                        break;
                    case "zzz":
                        a = "([+-]?\\d\\d?:\\d{2})";
                        break;
                    case "zz":
                    case "z":
                        a = "([+-]?\\d\\d?)";
                        break;
                    case "/":
                        a = "(\\" + d["/"] + ")";
                        break;
                    default:
                        throw "Invalid date format pattern '" + j + "'.";
                }
                a && b.push(a);
                p.push(c[0])
            }
            h(f.slice(i), b);
            b.push("$");
            var r = b.join("").replace(/\s+/g, "\\s+"),
                q = {
                    regExp: r,
                    groups: p
                };
            return e[g] = q
        };
        a = function (a, c, b) {
            return a < c || a > b
        };
        f = function (a) {
            return a.split("\u00a0").join(" ").toUpperCase()
        };
        d = function (c) {
            for (var b = [], a = 0, d = c.length; a < d; a++) b[a] = f(c[a]);
            return b
        };
        o = function (A, M, L) {
            A = b(A);
            var c = L.calendar,
                H = j(c, M),
                K = new RegExp(H.regExp).exec(A);
            if (K === null) return null;
            for (var J = H.groups, C = null, m = null, i = null, l = null, u = null, h = 0, o, D = 0, E = 0, B = 0, q = null, z = false, w = 0, N = J.length; w < N; w++) {
                var d = K[w + 1];
                if (d) {
                    var I = J[w],
                        r = I.length,
                        g = parseInt(d, 10);
                    switch (I) {
                        case "dd":
                        case "d":
                            l = g;
                            if (a(l, 1, 31)) return null;
                            break;
                        case "MMM":
                        case "MMMM":
                            i = k(c, d, r === 3);
                            if (a(i, 0, 11)) return null;
                            break;
                        case "M":
                        case "MM":
                            i = g - 1;
                            if (a(i, 0, 11)) return null;
                            break;
                        case "y":
                        case "yy":
                        case "yyyy":
                            m = r < 4 ? p(c, g) : g;
                            if (a(m, 0, 9999)) return null;
                            break;
                        case "h":
                        case "hh":
                            h = g;
                            if (h === 12) h = 0;
                            if (a(h, 0, 11)) return null;
                            break;
                        case "H":
                        case "HH":
                            h = g;
                            if (a(h, 0, 23)) return null;
                            break;
                        case "m":
                        case "mm":
                            D = g;
                            if (a(D, 0, 59)) return null;
                            break;
                        case "s":
                        case "ss":
                            E = g;
                            if (a(E, 0, 59)) return null;
                            break;
                        case "tt":
                        case "t":
                            z = c.PM && (d === c.PM[0] || d === c.PM[1] || d === c.PM[2]);
                            if (!z && (!c.AM || d !== c.AM[0] && d !== c.AM[1] && d !== c.AM[2])) return null;
                            break;
                        case "f":
                        case "ff":
                        case "fff":
                            B = g * Math.pow(10, 3 - r);
                            if (a(B, 0, 999)) return null;
                            break;
                        case "ddd":
                        case "dddd":
                            u = n(c, d, r === 3);
                            if (a(u, 0, 6)) return null;
                            break;
                        case "zzz":
                            var y = d.split(/:/);
                            if (y.length !== 2) return null;
                            o = parseInt(y[0], 10);
                            if (a(o, -12, 13)) return null;
                            var x = parseInt(y[1], 10);
                            if (a(x, 0, 59)) return null;
                            q = o * 60 + (e(d, "-") ? -x : x);
                            break;
                        case "z":
                        case "zz":
                            o = g;
                            if (a(o, -12, 13)) return null;
                            q = o * 60;
                            break;
                        case "g":
                        case "gg":
                            var t = d;
                            if (!t || !c.eras) return null;
                            t = b(t.toLowerCase());
                            for (var v = 0, O = c.eras.length; v < O; v++) if (t === c.eras[v].name.toLowerCase()) {
                                C = v;
                                break
                            }
                            if (C === null) return null
                    }
                }
            }
            var f = new Date,
                G, s = c.convert;
            G = s ? s.fromGregorian(f)[0] : f.getFullYear();
            if (m === null) m = G;
            else if (c.eras) m += c.eras[C || 0].offset;
            if (i === null) i = 0;
            if (l === null) l = 1;
            if (s) {
                f = s.toGregorian(m, i, l);
                if (f === null) return null
            } else {
                f.setFullYear(m, i, l);
                if (f.getDate() !== l) return null;
                if (u !== null && f.getDay() !== u) return null
            }
            if (z && h < 12) h += 12;
            f.setHours(h, D, E, B);
            if (q !== null) {
                var F = f.getMinutes() - (q + f.getTimezoneOffset());
                f.setHours(f.getHours() + parseInt(F / 60, 10), F % 60)
            }
            return f
        }
    })();
    d = function (a, f, g) {
        var b = f["-"],
            c = f["+"],
            d;
        switch (g) {
            case "n -":
                b = " " + b;
                c = " " + c;
            case "n-":
                if (j(a, b)) d = ["-", a.substr(0, a.length - b.length)];
                else if (j(a, c)) d = ["+", a.substr(0, a.length - c.length)];
                break;
            case "- n":
                b += " ";
                c += " ";
            case "-n":
                if (e(a, b)) d = ["-", a.substr(b.length)];
                else if (e(a, c)) d = ["+", a.substr(c.length)];
                break;
            case "(n)":
                if (e(a, "(") && j(a, ")")) d = ["-", a.substr(1, a.length - 2)]
        }
        return d || ["", a]
    };
    a.prototype.findClosestCulture = function (b) {
        return a.findClosestCulture.call(this, b)
    };
    a.prototype.format = function (d, c, b) {
        return a.format.call(this, d, c, b)
    };
    a.prototype.localize = function (c, b) {
        return a.localize.call(this, c, b)
    };
    a.prototype.parseInt = function (d, c, b) {
        return a.parseInt.call(this, d, c, b)
    };
    a.prototype.parseFloat = function (d, c, b) {
        return a.parseFloat.call(this, d, c, b)
    };
    a.prototype.culture = function (b) {
        return a.culture.call(this, b)
    };
    a.addCultureInfo = function (a, c, e) {
        var b = {}, d = false;
        if (typeof a !== "string") {
            e = a;
            a = this.culture().name;
            b = this.cultures[a]
        } else if (typeof c !== "string") {
            e = c;
            d = this.cultures[a] == null;
            b = this.cultures[a] || this.cultures["default"]
        } else {
            d = true;
            b = this.cultures[c]
        }
        this.cultures[a] = r(true, {}, b, e);
        if (d) this.cultures[a].calendar = this.cultures[a].calendars.standard
    };
    a.findClosestCulture = function (a) {
        var e;
        if (!a) return this.cultures[this.cultureSelector] || this.cultures["default"];
        if (typeof a === "string") a = a.split(",");
        if (k(a)) {
            for (var d, h = this.cultures, n = a, i = n.length, g = [], c = 0; c < i; c++) {
                a = b(n[c]);
                var f, j = a.split(";");
                d = b(j[0]);
                if (j.length === 1) f = 1;
                else {
                    a = b(j[1]);
                    if (a.indexOf("q=") === 0) {
                        a = a.substr(2);
                        f = parseFloat(a);
                        f = isNaN(f) ? 0 : f
                    } else f = 1
                }
                g.push({
                    lang: d,
                    pri: f
                })
            }
            g.sort(function (a, b) {
                return a.pri < b.pri ? 1 : -1
            });
            for (c = 0; c < i; c++) {
                d = g[c].lang;
                e = h[d];
                if (e) return e
            }
            for (c = 0; c < i; c++) {
                d = g[c].lang;
                do {
                    var m = d.lastIndexOf("-");
                    if (m === -1) break;
                    d = d.substr(0, m);
                    e = h[d];
                    if (e) return e
                } while (1)
            }
            for (c = 0; c < i; c++) {
                d = g[c].lang;
                for (var o in h) {
                    var l = h[o];
                    if (l.language == d) return l
                }
            }
        } else if (typeof a === "object") return a;
        return e || null
    };
    a.format = function (a, b, c) {
        culture = this.findClosestCulture(c);
        if (a instanceof Date) a = n(a, b, culture);
        else if (typeof a === "number") a = u(a, b, culture);
        return a
    };
    a.localize = function (a, b) {
        return this.findClosestCulture(b).messages[a] || this.cultures["default"].messages[a]
    };
    a.parseDate = function (g, a, b) {
        b = this.findClosestCulture(b);
        var c, h, d;
        if (a) {
            if (typeof a === "string") a = [a];
            if (a.length) for (var e = 0, i = a.length; e < i; e++) {
                var f = a[e];
                if (f) {
                    c = o(g, f, b);
                    if (c) break
                }
            }
        } else {
            d = b.calendar.patterns;
            for (h in d) {
                c = o(g, d[h], b);
                if (c) break
            }
        }
        return c || null
    };
    a.parseInt = function (d, c, b) {
        return q(a.parseFloat(d, c, b))
    };
    a.parseFloat = function (a, n, u) {
        if (typeof n !== "number") {
            u = n;
            n = 10
        }
        var k = this.findClosestCulture(u),
            o = NaN,
            c = k.numberFormat;
        if (a.indexOf(k.numberFormat.currency.symbol) > -1) {
            a = a.replace(k.numberFormat.currency.symbol, "");
            a = a.replace(k.numberFormat.currency["."], k.numberFormat["."])
        }
        a = b(a);
        if (t.test(a)) o = parseFloat(a);
        else if (!n && x.test(a)) o = parseInt(a, 16);
        else {
            var e = d(a, c, c.pattern[0]),
                g = e[0],
                h = e[1];
            if (g === "" && c.pattern[0] !== "(n)") {
                e = d(a, c, "(n)");
                g = e[0];
                h = e[1]
            }
            if (g === "" && c.pattern[0] !== "-n") {
                e = d(a, c, "-n");
                g = e[0];
                h = e[1]
            }
            g = g || "+";
            var l, i, j = h.indexOf("e");
            if (j < 0) j = h.indexOf("E");
            if (j < 0) {
                i = h;
                l = null
            } else {
                i = h.substr(0, j);
                l = h.substr(j + 1)
            }
            var f, m, y = c["."],
                q = i.indexOf(y);
            if (q < 0) {
                f = i;
                m = null
            } else {
                f = i.substr(0, q);
                m = i.substr(q + y.length)
            }
            var r = c[","];
            f = f.split(r).join("");
            var v = r.replace(/\u00A0/g, " ");
            if (r !== v) f = f.split(v).join("");
            var p = g + f;
            if (m !== null) p += "." + m;
            if (l !== null) {
                var w = d(l, c, "-n");
                p += "e" + (w[0] || "+") + w[1]
            }
            if (s.test(p)) o = parseFloat(p)
        }
        return o
    };
    a.culture = function (a) {
        if (typeof a !== "undefined") this.cultureSelector = a;
        return this.findClosestCulture(a) || this.culture["default"]
    }
})(this);
/*! Copyright (c) 2010 Brandon Aaron (http://brandonaaron.net)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Version 2.1.3-pre
 */

(function ($) {

    $.fn.bgiframe = ($.browser.msie && /msie 6\.0/i.test(navigator.userAgent) ? function (s) {
        s = $.extend({
            top: 'auto', // auto == .currentStyle.borderTopWidth
            left: 'auto', // auto == .currentStyle.borderLeftWidth
            width: 'auto', // auto == offsetWidth
            height: 'auto', // auto == offsetHeight
            opacity: true,
            src: 'javascript:false;'
        }, s);
        var html = '<iframe class="bgiframe"frameborder="0"tabindex="-1"src="' + s.src + '"' +
            'style="display:block;position:absolute;z-index:-1;' + (s.opacity !== false ? 'filter:Alpha(Opacity=\'0\');' : '') +
            'top:' + (s.top == 'auto' ? 'expression(((parseInt(this.parentNode.currentStyle.borderTopWidth)||0)*-1)+\'px\')' : prop(s.top)) + ';' +
            'left:' + (s.left == 'auto' ? 'expression(((parseInt(this.parentNode.currentStyle.borderLeftWidth)||0)*-1)+\'px\')' : prop(s.left)) + ';' +
            'width:' + (s.width == 'auto' ? 'expression(this.parentNode.offsetWidth+\'px\')' : prop(s.width)) + ';' +
            'height:' + (s.height == 'auto' ? 'expression(this.parentNode.offsetHeight+\'px\')' : prop(s.height)) + ';' +
            '"/>';
        return this.each(function () {
            if ($(this).children('iframe.bgiframe').length === 0) this.insertBefore(document.createElement(html), this.firstChild);
        });
    } : function () {
        return this;
    });

    // old alias
    $.fn.bgIframe = $.fn.bgiframe;

    function prop(n) {
        return n && n.constructor === Number ? n + 'px' : n;
    }

})(jQuery);
/*! Copyright (c) 2011 Brandon Aaron (http://brandonaaron.net)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Thanks to: http://adomas.org/javascript-mouse-wheel/ for some pointers.
 * Thanks to: Mathias Bank(http://www.mathias-bank.de) for a scope bug fix.
 * Thanks to: Seamus Leahy for adding deltaX and deltaY
 *
 * Version: 3.0.6
 * 
 * Requires: 1.2.2+
 */ (function (a) {
    function d(b) {
        var c = b || window.event,
            d = [].slice.call(arguments, 1),
            e = 0,
            f = !0,
            g = 0,
            h = 0;
        return b = a.event.fix(c), b.type = "mousewheel", c.wheelDelta && (e = c.wheelDelta / 120), c.detail && (e = -c.detail / 3), h = e, c.axis !== undefined && c.axis === c.HORIZONTAL_AXIS && (h = 0, g = -1 * e), c.wheelDeltaY !== undefined && (h = c.wheelDeltaY / 120), c.wheelDeltaX !== undefined && (g = -1 * c.wheelDeltaX / 120), d.unshift(b, e, g, h), (a.event.dispatch || a.event.handle).apply(this, d)
    }
    var b = ["DOMMouseScroll", "mousewheel"];
    if (a.event.fixHooks) for (var c = b.length; c;) a.event.fixHooks[b[--c]] = a.event.mouseHooks;
    a.event.special.mousewheel = {
        setup: function () {
            if (this.addEventListener) for (var a = b.length; a;) this.addEventListener(b[--a], d, !1);
            else this.onmousewheel = d
        },
        teardown: function () {
            if (this.removeEventListener) for (var a = b.length; a;) this.removeEventListener(b[--a], d, !1);
            else this.onmousewheel = null
        }
    }, a.fn.extend({
        mousewheel: function (a) {
            return a ? this.bind("mousewheel", a) : this.trigger("mousewheel")
        },
        unmousewheel: function (a) {
            return this.unbind("mousewheel", a)
        }
    })
})(jQuery);
/**
 * Cookie plugin
 *
 * Copyright (c) 2006 Klaus Hartl (stilbuero.de)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */

/**
 * Create a cookie with the given name and value and other optional parameters.
 *
 * @example $.cookie('the_cookie', 'the_value');
 * @desc Set the value of a cookie.
 * @example $.cookie('the_cookie', 'the_value', { expires: 7, path: '/', domain: 'jquery.com', secure: true });
 * @desc Create a cookie with all available options.
 * @example $.cookie('the_cookie', 'the_value');
 * @desc Create a session cookie.
 * @example $.cookie('the_cookie', null);
 * @desc Delete a cookie by passing null as value. Keep in mind that you have to use the same path and domain
 *       used when the cookie was set.
 *
 * @param String name The name of the cookie.
 * @param String value The value of the cookie.
 * @param Object options An object literal containing key/value pairs to provide optional cookie attributes.
 * @option Number|Date expires Either an integer specifying the expiration date from now on in days or a Date object.
 *                             If a negative value is specified (e.g. a date in the past), the cookie will be deleted.
 *                             If set to null or omitted, the cookie will be a session cookie and will not be retained
 *                             when the the browser exits.
 * @option String path The value of the path atribute of the cookie (default: path of page that created the cookie).
 * @option String domain The value of the domain attribute of the cookie (default: domain of page that created the cookie).
 * @option Boolean secure If true, the secure attribute of the cookie will be set and the cookie transmission will
 *                        require a secure protocol (like HTTPS).
 * @type undefined
 *
 * @name $.cookie
 * @cat Plugins/Cookie
 * @author Klaus Hartl/klaus.hartl@stilbuero.de
 */

/**
 * Get the value of a cookie with the given name.
 *
 * @example $.cookie('the_cookie');
 * @desc Get the value of a cookie.
 *
 * @param String name The name of the cookie.
 * @return The value of the cookie.
 * @type String
 *
 * @name $.cookie
 * @cat Plugins/Cookie
 * @author Klaus Hartl/klaus.hartl@stilbuero.de
 */
jQuery.cookie = function (name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        // CAUTION: Needed to parenthesize options.path and options.domain
        // in the following expressions, otherwise they evaluate to undefined
        // in the packed version for some reason...
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};
// +---------------------------------------------------------------------+ \\
// � Rapha�l 2.0.1 - JavaScript Vector Library                           � \\
// +---------------------------------------------------------------------� \\
// � Copyright (c) 2008-2011 Dmitry Baranovskiy (http://raphaeljs.com)   � \\
// � Copyright (c) 2008-2011 Sencha Labs (http://sencha.com)             � \\
// � Licensed under the MIT (http://raphaeljs.com/license.html) license. � \\
// +---------------------------------------------------------------------+ \\
(function (a) {
    var b = "0.4.0",
        c = "hasOwnProperty",
        d = /[\.\/]/,
        e = "*",
        f = function () {}, g = function (a, b) {
            return a - b
        }, h, i, j = {
            n: {}
        }, k = function (a, b) {
            var c = j,
                d = i,
                e = Array.prototype.slice.call(arguments, 2),
                f = k.listeners(a),
                l = 0,
                m = !1,
                n, o = [],
                p = {}, q = [],
                r = [];
            h = a, i = 0;
            for (var s = 0, t = f.length; s < t; s++) "zIndex" in f[s] && (o.push(f[s].zIndex), f[s].zIndex < 0 && (p[f[s].zIndex] = f[s]));
            o.sort(g);
            while (o[l] < 0) {
                n = p[o[l++]], q.push(n.apply(b, e));
                if (i) {
                    i = d;
                    return q
                }
            }
            for (s = 0; s < t; s++) {
                n = f[s];
                if ("zIndex" in n) if (n.zIndex == o[l]) {
                    q.push(n.apply(b, e));
                    if (i) {
                        i = d;
                        return q
                    }
                    do {
                        l++, n = p[o[l]], n && q.push(n.apply(b, e));
                        if (i) {
                            i = d;
                            return q
                        }
                    } while (n)
                } else p[n.zIndex] = n;
                else {
                    q.push(n.apply(b, e));
                    if (i) {
                        i = d;
                        return q
                    }
                }
            }
            i = d;
            return q.length ? q : null
        };
    k.listeners = function (a) {
        var b = a.split(d),
            c = j,
            f, g, h, i, k, l, m, n, o = [c],
            p = [];
        for (i = 0, k = b.length; i < k; i++) {
            n = [];
            for (l = 0, m = o.length; l < m; l++) {
                c = o[l].n, g = [c[b[i]], c[e]], h = 2;
                while (h--) f = g[h], f && (n.push(f), p = p.concat(f.f || []))
            }
            o = n
        }
        return p
    }, k.on = function (a, b) {
        var c = a.split(d),
            e = j;
        for (var g = 0, h = c.length; g < h; g++) e = e.n, !e[c[g]] && (e[c[g]] = {
            n: {}
        }), e = e[c[g]];
        e.f = e.f || [];
        for (g = 0, h = e.f.length; g < h; g++) if (e.f[g] == b) return f;
        e.f.push(b);
        return function (a) {
            +a == +a && (b.zIndex = +a)
        }
    }, k.stop = function () {
        i = 1
    }, k.nt = function (a) {
        if (a) return (new RegExp("(?:\\.|\\/|^)" + a + "(?:\\.|\\/|$)")).test(h);
        return h
    }, k.unbind = function (a, b) {
        var f = a.split(d),
            g, h, i, k, l, m, n, o = [j];
        for (k = 0, l = f.length; k < l; k++) for (m = 0; m < o.length; m += i.length - 2) {
            i = [m, 1], g = o[m].n;
            if (f[k] != e) g[f[k]] && i.push(g[f[k]]);
            else for (h in g) g[c](h) && i.push(g[h]);
            o.splice.apply(o, i)
        }
        for (k = 0, l = o.length; k < l; k++) {
            g = o[k];
            while (g.n) {
                if (b) {
                    if (g.f) {
                        for (m = 0, n = g.f.length; m < n; m++) if (g.f[m] == b) {
                            g.f.splice(m, 1);
                            break
                        }!g.f.length && delete g.f
                    }
                    for (h in g.n) if (g.n[c](h) && g.n[h].f) {
                        var p = g.n[h].f;
                        for (m = 0, n = p.length; m < n; m++) if (p[m] == b) {
                            p.splice(m, 1);
                            break
                        }!p.length && delete g.n[h].f
                    }
                } else {
                    delete g.f;
                    for (h in g.n) g.n[c](h) && g.n[h].f && delete g.n[h].f
                }
                g = g.n
            }
        }
    }, k.once = function (a, b) {
        var c = function () {
            b.apply(this, arguments), k.unbind(a, c)
        };
        return k.on(a, c)
    }, k.version = b, k.toString = function () {
        return "You are running Eve " + b
    }, typeof module != "undefined" && module.exports ? module.exports = k : a.eve = k
})(this),
function () {
    function cr(b, d, e, f, h, i) {
        e = Q(e);
        var j, k, l, m = [],
            o, p, q, t = b.ms,
            u = {}, v = {}, w = {};
        if (f) for (y = 0, z = cl.length; y < z; y++) {
            var x = cl[y];
            if (x.el.id == d.id && x.anim == b) {
                x.percent != e ? (cl.splice(y, 1), l = 1) : k = x, d.attr(x.totalOrigin);
                break
            }
        } else f = +v;
        for (var y = 0, z = b.percents.length; y < z; y++) {
            if (b.percents[y] == e || b.percents[y] > f * b.top) {
                e = b.percents[y], p = b.percents[y - 1] || 0, t = t / b.top * (e - p), o = b.percents[y + 1], j = b.anim[e];
                break
            }
            f && d.attr(b.anim[b.percents[y]])
        }
        if ( !! j) {
            if (!k) {
                for (var A in j) if (j[g](A)) if (U[g](A) || d.paper.customAttributes[g](A)) {
                    u[A] = d.attr(A), u[A] == null && (u[A] = T[A]), v[A] = j[A];
                    switch (U[A]) {
                        case C:
                            w[A] = (v[A] - u[A]) / t;
                            break;
                        case "colour":
                            u[A] = a.getRGB(u[A]);
                            var B = a.getRGB(v[A]);
                            w[A] = {
                                r: (B.r - u[A].r) / t,
                                g: (B.g - u[A].g) / t,
                                b: (B.b - u[A].b) / t
                            };
                            break;
                        case "path":
                            var D = bG(u[A], v[A]),
                                E = D[1];
                            u[A] = D[0], w[A] = [];
                            for (y = 0, z = u[A].length; y < z; y++) {
                                w[A][y] = [0];
                                for (var F = 1, G = u[A][y].length; F < G; F++) w[A][y][F] = (E[y][F] - u[A][y][F]) / t
                            }
                            break;
                        case "transform":
                            var H = d._,
                                I = bP(H[A], v[A]);
                            if (I) {
                                u[A] = I.from, v[A] = I.to, w[A] = [], w[A].real = !0;
                                for (y = 0, z = u[A].length; y < z; y++) {
                                    w[A][y] = [u[A][y][0]];
                                    for (F = 1, G = u[A][y].length; F < G; F++) w[A][y][F] = (v[A][y][F] - u[A][y][F]) / t
                                }
                            } else {
                                var J = d.matrix || new bQ,
                                    K = {
                                        _: {
                                            transform: H.transform
                                        },
                                        getBBox: function () {
                                            return d.getBBox(1)
                                        }
                                    };
                                u[A] = [J.a, J.b, J.c, J.d, J.e, J.f], bN(K, v[A]), v[A] = K._.transform, w[A] = [(K.matrix.a - J.a) / t, (K.matrix.b - J.b) / t, (K.matrix.c - J.c) / t, (K.matrix.d - J.d) / t, (K.matrix.e - J.e) / t, (K.matrix.e - J.f) / t]
                            }
                            break;
                        case "csv":
                            var L = r(j[A])[s](c),
                                M = r(u[A])[s](c);
                            if (A == "clip-rect") {
                                u[A] = M, w[A] = [], y = M.length;
                                while (y--) w[A][y] = (L[y] - u[A][y]) / t
                            }
                            v[A] = L;
                            break;
                        default:
                            L = [][n](j[A]), M = [][n](u[A]), w[A] = [], y = d.paper.customAttributes[A].length;
                            while (y--) w[A][y] = ((L[y] || 0) - (M[y] || 0)) / t
                    }
                }
                var O = j.easing,
                    P = a.easing_formulas[O];
                if (!P) {
                    P = r(O).match(N);
                    if (P && P.length == 5) {
                        var R = P;
                        P = function (a) {
                            return cp(a, +R[1], +R[2], +R[3], +R[4], t)
                        }
                    } else P = be
                }
                q = j.start || b.start || +(new Date), x = {
                    anim: b,
                    percent: e,
                    timestamp: q,
                    start: q + (b.del || 0),
                    status: 0,
                    initstatus: f || 0,
                    stop: !1,
                    ms: t,
                    easing: P,
                    from: u,
                    diff: w,
                    to: v,
                    el: d,
                    callback: j.callback,
                    prev: p,
                    next: o,
                    repeat: i || b.times,
                    origin: d.attr(),
                    totalOrigin: h
                }, cl.push(x);
                if (f && !k && !l) {
                    x.stop = !0, x.start = new Date - t * f;
                    if (cl.length == 1) return cn()
                }
                l && (x.start = new Date - x.ms * f), cl.length == 1 && cm(cn)
            } else k.initstatus = f, k.start = new Date - k.ms * f;
            eve("anim.start." + d.id, d, b)
        }
    }
    function cq(a, b) {
        var c = [],
            d = {};
        this.ms = b, this.times = 1;
        if (a) {
            for (var e in a) a[g](e) && (d[Q(e)] = a[e], c.push(Q(e)));
            c.sort(bc)
        }
        this.anim = d, this.top = c[c.length - 1], this.percents = c
    }
    function cp(a, b, c, d, e, f) {
        function o(a, b) {
            var c, d, e, f, j, k;
            for (e = a, k = 0; k < 8; k++) {
                f = m(e) - a;
                if (z(f) < b) return e;
                j = (3 * i * e + 2 * h) * e + g;
                if (z(j) < 1e-6) break;
                e = e - f / j
            }
            c = 0, d = 1, e = a;
            if (e < c) return c;
            if (e > d) return d;
            while (c < d) {
                f = m(e);
                if (z(f - a) < b) return e;
                a > f ? c = e : d = e, e = (d - c) / 2 + c
            }
            return e
        }
        function n(a, b) {
            var c = o(a, b);
            return ((l * c + k) * c + j) * c
        }
        function m(a) {
            return ((i * a + h) * a + g) * a
        }
        var g = 3 * b,
            h = 3 * (d - b) - g,
            i = 1 - g - h,
            j = 3 * c,
            k = 3 * (e - c) - j,
            l = 1 - j - k;
        return n(a, 1 / (200 * f))
    }
    function cd() {
        return this.x + q + this.y + q + this.width + " � " + this.height
    }
    function cc() {
        return this.x + q + this.y
    }
    function bQ(a, b, c, d, e, f) {
        a != null ? (this.a = +a, this.b = +b, this.c = +c, this.d = +d, this.e = +e, this.f = +f) : (this.a = 1, this.b = 0, this.c = 0, this.d = 1, this.e = 0, this.f = 0)
    }
    function bw(a) {
        var b = [];
        for (var c = 0, d = a.length; d - 2 > c; c += 2) {
            var e = [{
                x: +a[c],
                y: +a[c + 1]
            }, {
                x: +a[c],
                y: +a[c + 1]
            }, {
                x: +a[c + 2],
                y: +a[c + 3]
            }, {
                x: +a[c + 4],
                y: +a[c + 5]
            }];
            d - 4 == c ? (e[0] = {
                x: +a[c - 2],
                y: +a[c - 1]
            }, e[3] = e[2]) : c && (e[0] = {
                x: +a[c - 2],
                y: +a[c - 1]
            }), b.push(["C", (-e[0].x + 6 * e[1].x + e[2].x) / 6, (-e[0].y + 6 * e[1].y + e[2].y) / 6, (e[1].x + 6 * e[2].x - e[3].x) / 6, (e[1].y + 6 * e[2].y - e[3].y) / 6, e[2].x, e[2].y])
        }
        return b
    }
    function bv() {
        return this.hex
    }
    function bt(a, b, c) {
        function d() {
            var e = Array.prototype.slice.call(arguments, 0),
                f = e.join("?"),
                h = d.cache = d.cache || {}, i = d.count = d.count || [];
            if (h[g](f)) {
                bs(i, f);
                return c ? c(h[f]) : h[f]
            }
            i.length >= 1e3 && delete h[i.shift()], i.push(f), h[f] = a[m](b, e);
            return c ? c(h[f]) : h[f]
        }
        return d
    }
    function bs(a, b) {
        for (var c = 0, d = a.length; c < d; c++) if (a[c] === b) return a.push(a.splice(c, 1)[0])
    }
    function a(c) {
        if (a.is(c, "function")) return b ? c() : eve.on("DOMload", c);
        if (a.is(c, E)) return a._engine.create[m](a, c.splice(0, 3 + a.is(c[0], C))).add(c);
        var d = Array.prototype.slice.call(arguments, 0);
        if (a.is(d[d.length - 1], "function")) {
            var e = d.pop();
            return b ? e.call(a._engine.create[m](a, d)) : eve.on("DOMload", function () {
                e.call(a._engine.create[m](a, d))
            })
        }
        return a._engine.create[m](a, arguments)
    }
    a.version = "2.0.1", a.eve = eve;
    var b, c = /[, ]+/,
        d = {
            circle: 1,
            rect: 1,
            path: 1,
            ellipse: 1,
            text: 1,
            image: 1
        }, e = /\{(\d+)\}/g,
        f = "prototype",
        g = "hasOwnProperty",
        h = {
            doc: document,
            win: window
        }, i = {
            was: Object.prototype[g].call(h.win, "Raphael"),
            is: h.win.Raphael
        }, j = function () {
            this.ca = this.customAttributes = {}
        }, k, l = "appendChild",
        m = "apply",
        n = "concat",
        o = "createTouch" in h.doc,
        p = "",
        q = " ",
        r = String,
        s = "split",
        t = "click dblclick mousedown mousemove mouseout mouseover mouseup touchstart touchmove touchend touchcancel" [s](q),
        u = {
            mousedown: "touchstart",
            mousemove: "touchmove",
            mouseup: "touchend"
        }, v = r.prototype.toLowerCase,
        w = Math,
        x = w.max,
        y = w.min,
        z = w.abs,
        A = w.pow,
        B = w.PI,
        C = "number",
        D = "string",
        E = "array",
        F = "toString",
        G = "fill",
        H = Object.prototype.toString,
        I = {}, J = "push",
        K = a._ISURL = /^url\(['"]?([^\)]+?)['"]?\)$/i,
        L = /^\s*((#[a-f\d]{6})|(#[a-f\d]{3})|rgba?\(\s*([\d\.]+%?\s*,\s*[\d\.]+%?\s*,\s*[\d\.]+%?(?:\s*,\s*[\d\.]+%?)?)\s*\)|hsba?\(\s*([\d\.]+(?:deg|\xb0|%)?\s*,\s*[\d\.]+%?\s*,\s*[\d\.]+(?:%?\s*,\s*[\d\.]+)?)%?\s*\)|hsla?\(\s*([\d\.]+(?:deg|\xb0|%)?\s*,\s*[\d\.]+%?\s*,\s*[\d\.]+(?:%?\s*,\s*[\d\.]+)?)%?\s*\))\s*$/i,
        M = {
            NaN: 1,
            Infinity: 1,
            "-Infinity": 1
        }, N = /^(?:cubic-)?bezier\(([^,]+),([^,]+),([^,]+),([^\)]+)\)/,
        O = w.round,
        P = "setAttribute",
        Q = parseFloat,
        R = parseInt,
        S = r.prototype.toUpperCase,
        T = a._availableAttrs = {
            "arrow-end": "none",
            "arrow-start": "none",
            blur: 0,
            "clip-rect": "0 0 1e9 1e9",
            cursor: "default",
            cx: 0,
            cy: 0,
            fill: "#fff",
            "fill-opacity": 1,
            font: '10px "Arial"',
            "font-family": '"Arial"',
            "font-size": "10",
            "font-style": "normal",
            "font-weight": 400,
            gradient: 0,
            height: 0,
            href: "http://raphaeljs.com/",
            "letter-spacing": 0,
            opacity: 1,
            path: "M0,0",
            r: 0,
            rx: 0,
            ry: 0,
            src: "",
            stroke: "#000",
            "stroke-dasharray": "",
            "stroke-linecap": "butt",
            "stroke-linejoin": "butt",
            "stroke-miterlimit": 0,
            "stroke-opacity": 1,
            "stroke-width": 1,
            target: "_blank",
            "text-anchor": "middle",
            title: "Raphael",
            transform: "",
            width: 0,
            x: 0,
            y: 0
        }, U = a._availableAnimAttrs = {
            blur: C,
            "clip-rect": "csv",
            cx: C,
            cy: C,
            fill: "colour",
            "fill-opacity": C,
            "font-size": C,
            height: C,
            opacity: C,
            path: "path",
            r: C,
            rx: C,
            ry: C,
            stroke: "colour",
            "stroke-opacity": C,
            "stroke-width": C,
            transform: "transform",
            width: C,
            x: C,
            y: C
        }, V = /\s*,\s*/,
        W = {
            hs: 1,
            rg: 1
        }, X = /,?([achlmqrstvxz]),?/gi,
        Y = /([achlmrqstvz])[\s,]*((-?\d*\.?\d*(?:e[\-+]?\d+)?\s*,?\s*)+)/ig,
        Z = /([rstm])[\s,]*((-?\d*\.?\d*(?:e[\-+]?\d+)?\s*,?\s*)+)/ig,
        $ = /(-?\d*\.?\d*(?:e[\-+]?\d+)?)\s*,?\s*/ig,
        _ = a._radial_gradient = /^r(?:\(([^,]+?)\s*,\s*([^\)]+?)\))?/,
        ba = {}, bb = function (a, b) {
            return a.key - b.key
        }, bc = function (a, b) {
            return Q(a) - Q(b)
        }, bd = function () {}, be = function (a) {
            return a
        }, bf = a._rectPath = function (a, b, c, d, e) {
            if (e) return [["M", a + e, b], ["l", c - e * 2, 0], ["a", e, e, 0, 0, 1, e, e], ["l", 0, d - e * 2], ["a", e, e, 0, 0, 1, -e, e], ["l", e * 2 - c, 0], ["a", e, e, 0, 0, 1, -e, -e], ["l", 0, e * 2 - d], ["a", e, e, 0, 0, 1, e, -e], ["z"]];
            return [["M", a, b], ["l", c, 0], ["l", 0, d], ["l", -c, 0], ["z"]]
        }, bg = function (a, b, c, d) {
            d == null && (d = c);
            return [["M", a, b], ["m", 0, -d], ["a", c, d, 0, 1, 1, 0, 2 * d], ["a", c, d, 0, 1, 1, 0, -2 * d], ["z"]]
        }, bh = a._getPath = {
            path: function (a) {
                return a.attr("path")
            },
            circle: function (a) {
                var b = a.attrs;
                return bg(b.cx, b.cy, b.r)
            },
            ellipse: function (a) {
                var b = a.attrs;
                return bg(b.cx, b.cy, b.rx, b.ry)
            },
            rect: function (a) {
                var b = a.attrs;
                return bf(b.x, b.y, b.width, b.height, b.r)
            },
            image: function (a) {
                var b = a.attrs;
                return bf(b.x, b.y, b.width, b.height)
            },
            text: function (a) {
                var b = a._getBBox();
                return bf(b.x, b.y, b.width, b.height)
            }
        }, bi = a.mapPath = function (a, b) {
            if (!b) return a;
            var c, d, e, f, g, h, i;
            a = bG(a);
            for (e = 0, g = a.length; e < g; e++) {
                i = a[e];
                for (f = 1, h = i.length; f < h; f += 2) c = b.x(i[f], i[f + 1]), d = b.y(i[f], i[f + 1]), i[f] = c, i[f + 1] = d
            }
            return a
        };
    a._g = h, a.type = h.win.SVGAngle || h.doc.implementation.hasFeature("http://www.w3.org/TR/SVG11/feature#BasicStructure", "1.1") ? "SVG" : "VML";
    if (a.type == "VML") {
        var bj = h.doc.createElement("div"),
            bk;
        bj.innerHTML = '<v:shape adj="1"/>', bk = bj.firstChild, bk.style.behavior = "url(#default#VML)";
        if (!bk || typeof bk.adj != "object") return a.type = p;
        bj = null
    }
    a.svg = !(a.vml = a.type == "VML"), a._Paper = j, a.fn = k = j.prototype = a.prototype, a._id = 0, a._oid = 0, a.is = function (a, b) {
        b = v.call(b);
        if (b == "finite") return !M[g](+a);
        if (b == "array") return a instanceof Array;
        return b == "null" && a === null || b == typeof a && a !== null || b == "object" && a === Object(a) || b == "array" && Array.isArray && Array.isArray(a) || H.call(a).slice(8, -1).toLowerCase() == b
    }, a.angle = function (b, c, d, e, f, g) {
        if (f == null) {
            var h = b - d,
                i = c - e;
            if (!h && !i) return 0;
            return (180 + w.atan2(-i, -h) * 180 / B + 360) % 360
        }
        return a.angle(b, c, f, g) - a.angle(d, e, f, g)
    }, a.rad = function (a) {
        return a % 360 * B / 180
    }, a.deg = function (a) {
        return a * 180 / B % 360
    }, a.snapTo = function (b, c, d) {
        d = a.is(d, "finite") ? d : 10;
        if (a.is(b, E)) {
            var e = b.length;
            while (e--) if (z(b[e] - c) <= d) return b[e]
        } else {
            b = +b;
            var f = c % b;
            if (f < d) return c - f;
            if (f > b - d) return c - f + b
        }
        return c
    };
    var bl = a.createUUID = function (a, b) {
        return function () {
            return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(a, b).toUpperCase()
        }
    }(/[xy]/g, function (a) {
        var b = w.random() * 16 | 0,
            c = a == "x" ? b : b & 3 | 8;
        return c.toString(16)
    });
    a.setWindow = function (b) {
        eve("setWindow", a, h.win, b), h.win = b, h.doc = h.win.document, a._engine.initWin && a._engine.initWin(h.win)
    };
    var bm = function (b) {
        if (a.vml) {
            var c = /^\s+|\s+$/g,
                d;
            try {
                var e = new ActiveXObject("htmlfile");
                e.write("<body>"), e.close(), d = e.body
            } catch (f) {
                d = createPopup().document.body
            }
            var g = d.createTextRange();
            bm = bt(function (a) {
                try {
                    d.style.color = r(a).replace(c, p);
                    var b = g.queryCommandValue("ForeColor");
                    b = (b & 255) << 16 | b & 65280 | (b & 16711680) >>> 16;
                    return "#" + ("000000" + b.toString(16)).slice(-6)
                } catch (e) {
                    return "none"
                }
            })
        } else {
            var i = h.doc.createElement("i");
            i.title = "Rapha�l Colour Picker", i.style.display = "none", h.doc.body.appendChild(i), bm = bt(function (a) {
                i.style.color = a;
                return h.doc.defaultView.getComputedStyle(i, p).getPropertyValue("color")
            })
        }
        return bm(b)
    }, bn = function () {
        return "hsb(" + [this.h, this.s, this.b] + ")"
    }, bo = function () {
        return "hsl(" + [this.h, this.s, this.l] + ")"
    }, bp = function () {
        return this.hex
    }, bq = function (b, c, d) {
        c == null && a.is(b, "object") && "r" in b && "g" in b && "b" in b && (d = b.b, c = b.g, b = b.r);
        if (c == null && a.is(b, D)) {
            var e = a.getRGB(b);
            b = e.r, c = e.g, d = e.b
        }
        if (b > 1 || c > 1 || d > 1) b /= 255, c /= 255, d /= 255;
        return [b, c, d]
    }, br = function (b, c, d, e) {
        b *= 255, c *= 255, d *= 255;
        var f = {
            r: b,
            g: c,
            b: d,
            hex: a.rgb(b, c, d),
            toString: bp
        };
        a.is(e, "finite") && (f.opacity = e);
        return f
    };
    a.color = function (b) {
        var c;
        a.is(b, "object") && "h" in b && "s" in b && "b" in b ? (c = a.hsb2rgb(b), b.r = c.r, b.g = c.g, b.b = c.b, b.hex = c.hex) : a.is(b, "object") && "h" in b && "s" in b && "l" in b ? (c = a.hsl2rgb(b), b.r = c.r, b.g = c.g, b.b = c.b, b.hex = c.hex) : (a.is(b, "string") && (b = a.getRGB(b)), a.is(b, "object") && "r" in b && "g" in b && "b" in b ? (c = a.rgb2hsl(b), b.h = c.h, b.s = c.s, b.l = c.l, c = a.rgb2hsb(b), b.v = c.b) : (b = {
            hex: "none"
        }, b.r = b.g = b.b = b.h = b.s = b.v = b.l = -1)), b.toString = bp;
        return b
    }, a.hsb2rgb = function (a, b, c, d) {
        this.is(a, "object") && "h" in a && "s" in a && "b" in a && (c = a.b, b = a.s, a = a.h, d = a.o), a *= 360;
        var e, f, g, h, i;
        a = a % 360 / 60, i = c * b, h = i * (1 - z(a % 2 - 1)), e = f = g = c - i, a = ~~a, e += [i, h, 0, 0, h, i][a], f += [h, i, i, h, 0, 0][a], g += [0, 0, h, i, i, h][a];
        return br(e, f, g, d)
    }, a.hsl2rgb = function (a, b, c, d) {
        this.is(a, "object") && "h" in a && "s" in a && "l" in a && (c = a.l, b = a.s, a = a.h);
        if (a > 1 || b > 1 || c > 1) a /= 360, b /= 100, c /= 100;
        a *= 360;
        var e, f, g, h, i;
        a = a % 360 / 60, i = 2 * b * (c < .5 ? c : 1 - c), h = i * (1 - z(a % 2 - 1)), e = f = g = c - i / 2, a = ~~a, e += [i, h, 0, 0, h, i][a], f += [h, i, i, h, 0, 0][a], g += [0, 0, h, i, i, h][a];
        return br(e, f, g, d)
    }, a.rgb2hsb = function (a, b, c) {
        c = bq(a, b, c), a = c[0], b = c[1], c = c[2];
        var d, e, f, g;
        f = x(a, b, c), g = f - y(a, b, c), d = g == 0 ? null : f == a ? (b - c) / g : f == b ? (c - a) / g + 2 : (a - b) / g + 4, d = (d + 360) % 6 * 60 / 360, e = g == 0 ? 0 : g / f;
        return {
            h: d,
            s: e,
            b: f,
            toString: bn
        }
    }, a.rgb2hsl = function (a, b, c) {
        c = bq(a, b, c), a = c[0], b = c[1], c = c[2];
        var d, e, f, g, h, i;
        g = x(a, b, c), h = y(a, b, c), i = g - h, d = i == 0 ? null : g == a ? (b - c) / i : g == b ? (c - a) / i + 2 : (a - b) / i + 4, d = (d + 360) % 6 * 60 / 360, f = (g + h) / 2, e = i == 0 ? 0 : f < .5 ? i / (2 * f) : i / (2 - 2 * f);
        return {
            h: d,
            s: e,
            l: f,
            toString: bo
        }
    }, a._path2string = function () {
        return this.join(",").replace(X, "$1")
    };
    var bu = a._preload = function (a, b) {
        var c = h.doc.createElement("img");
        c.style.cssText = "position:absolute;left:-9999em;top:-9999em", c.onload = function () {
            b.call(this), this.onload = null, h.doc.body.removeChild(this)
        }, c.onerror = function () {
            h.doc.body.removeChild(this)
        }, h.doc.body.appendChild(c), c.src = a
    };
    a.getRGB = bt(function (b) {
        if (!b || !! ((b = r(b)).indexOf("-") + 1)) return {
            r: -1,
            g: -1,
            b: -1,
            hex: "none",
            error: 1,
            toString: bv
        };
        if (b == "none") return {
            r: -1,
            g: -1,
            b: -1,
            hex: "none",
            toString: bv
        };
        !W[g](b.toLowerCase().substring(0, 2)) && b.charAt() != "#" && (b = bm(b));
        var c, d, e, f, h, i, j, k = b.match(L);
        if (k) {
            k[2] && (f = R(k[2].substring(5), 16), e = R(k[2].substring(3, 5), 16), d = R(k[2].substring(1, 3), 16)), k[3] && (f = R((i = k[3].charAt(3)) + i, 16), e = R((i = k[3].charAt(2)) + i, 16), d = R((i = k[3].charAt(1)) + i, 16)), k[4] && (j = k[4][s](V), d = Q(j[0]), j[0].slice(-1) == "%" && (d *= 2.55), e = Q(j[1]), j[1].slice(-1) == "%" && (e *= 2.55), f = Q(j[2]), j[2].slice(-1) == "%" && (f *= 2.55), k[1].toLowerCase().slice(0, 4) == "rgba" && (h = Q(j[3])), j[3] && j[3].slice(-1) == "%" && (h /= 100));
            if (k[5]) {
                j = k[5][s](V), d = Q(j[0]), j[0].slice(-1) == "%" && (d *= 2.55), e = Q(j[1]), j[1].slice(-1) == "%" && (e *= 2.55), f = Q(j[2]), j[2].slice(-1) == "%" && (f *= 2.55), (j[0].slice(-3) == "deg" || j[0].slice(-1) == "�") && (d /= 360), k[1].toLowerCase().slice(0, 4) == "hsba" && (h = Q(j[3])), j[3] && j[3].slice(-1) == "%" && (h /= 100);
                return a.hsb2rgb(d, e, f, h)
            }
            if (k[6]) {
                j = k[6][s](V), d = Q(j[0]), j[0].slice(-1) == "%" && (d *= 2.55), e = Q(j[1]), j[1].slice(-1) == "%" && (e *= 2.55), f = Q(j[2]), j[2].slice(-1) == "%" && (f *= 2.55), (j[0].slice(-3) == "deg" || j[0].slice(-1) == "�") && (d /= 360), k[1].toLowerCase().slice(0, 4) == "hsla" && (h = Q(j[3])), j[3] && j[3].slice(-1) == "%" && (h /= 100);
                return a.hsl2rgb(d, e, f, h)
            }
            k = {
                r: d,
                g: e,
                b: f,
                toString: bv
            }, k.hex = "#" + (16777216 | f | e << 8 | d << 16).toString(16).slice(1), a.is(h, "finite") && (k.opacity = h);
            return k
        }
        return {
            r: -1,
            g: -1,
            b: -1,
            hex: "none",
            error: 1,
            toString: bv
        }
    }, a), a.hsb = bt(function (b, c, d) {
        return a.hsb2rgb(b, c, d).hex
    }), a.hsl = bt(function (b, c, d) {
        return a.hsl2rgb(b, c, d).hex
    }), a.rgb = bt(function (a, b, c) {
        return "#" + (16777216 | c | b << 8 | a << 16).toString(16).slice(1)
    }), a.getColor = function (a) {
        var b = this.getColor.start = this.getColor.start || {
            h: 0,
            s: 1,
            b: a || .75
        }, c = this.hsb2rgb(b.h, b.s, b.b);
        b.h += .075, b.h > 1 && (b.h = 0, b.s -= .2, b.s <= 0 && (this.getColor.start = {
            h: 0,
            s: 1,
            b: b.b
        }));
        return c.hex
    }, a.getColor.reset = function () {
        delete this.start
    }, a.parsePathString = bt(function (b) {
        if (!b) return null;
        var c = {
            a: 7,
            c: 6,
            h: 1,
            l: 2,
            m: 2,
            r: 4,
            q: 4,
            s: 4,
            t: 2,
            v: 1,
            z: 0
        }, d = [];
        a.is(b, E) && a.is(b[0], E) && (d = by(b)), d.length || r(b).replace(Y, function (a, b, e) {
            var f = [],
                g = b.toLowerCase();
            e.replace($, function (a, b) {
                b && f.push(+b)
            }), g == "m" && f.length > 2 && (d.push([b][n](f.splice(0, 2))), g = "l", b = b == "m" ? "l" : "L");
            if (g == "r") d.push([b][n](f));
            else while (f.length >= c[g]) {
                d.push([b][n](f.splice(0, c[g])));
                if (!c[g]) break
            }
        }), d.toString = a._path2string;
        return d
    }), a.parseTransformString = bt(function (b) {
        if (!b) return null;
        var c = {
            r: 3,
            s: 4,
            t: 2,
            m: 6
        }, d = [];
        a.is(b, E) && a.is(b[0], E) && (d = by(b)), d.length || r(b).replace(Z, function (a, b, c) {
            var e = [],
                f = v.call(b);
            c.replace($, function (a, b) {
                b && e.push(+b)
            }), d.push([b][n](e))
        }), d.toString = a._path2string;
        return d
    }), a.findDotsAtSegment = function (a, b, c, d, e, f, g, h, i) {
        var j = 1 - i,
            k = A(j, 3),
            l = A(j, 2),
            m = i * i,
            n = m * i,
            o = k * a + l * 3 * i * c + j * 3 * i * i * e + n * g,
            p = k * b + l * 3 * i * d + j * 3 * i * i * f + n * h,
            q = a + 2 * i * (c - a) + m * (e - 2 * c + a),
            r = b + 2 * i * (d - b) + m * (f - 2 * d + b),
            s = c + 2 * i * (e - c) + m * (g - 2 * e + c),
            t = d + 2 * i * (f - d) + m * (h - 2 * f + d),
            u = j * a + i * c,
            v = j * b + i * d,
            x = j * e + i * g,
            y = j * f + i * h,
            z = 90 - w.atan2(q - s, r - t) * 180 / B;
        (q > s || r < t) && (z += 180);
        return {
            x: o,
            y: p,
            m: {
                x: q,
                y: r
            },
            n: {
                x: s,
                y: t
            },
            start: {
                x: u,
                y: v
            },
            end: {
                x: x,
                y: y
            },
            alpha: z
        }
    }, a._removedFactory = function (a) {
        return function () {
            throw new Error("Rapha�l: you are calling to method �" + a + "� of removed object")
        }
    };
    var bx = bt(function (a) {
        if (!a) return {
            x: 0,
            y: 0,
            width: 0,
            height: 0
        };
        a = bG(a);
        var b = 0,
            c = 0,
            d = [],
            e = [],
            f;
        for (var g = 0, h = a.length; g < h; g++) {
            f = a[g];
            if (f[0] == "M") b = f[1], c = f[2], d.push(b), e.push(c);
            else {
                var i = bF(b, c, f[1], f[2], f[3], f[4], f[5], f[6]);
                d = d[n](i.min.x, i.max.x), e = e[n](i.min.y, i.max.y), b = f[5], c = f[6]
            }
        }
        var j = y[m](0, d),
            k = y[m](0, e);
        return {
            x: j,
            y: k,
            width: x[m](0, d) - j,
            height: x[m](0, e) - k
        }
    }, null, function (a) {
        return {
            x: a.x,
            y: a.y,
            width: a.width,
            height: a.height
        }
    }),
        by = function (b) {
            var c = [];
            if (!a.is(b, E) || !a.is(b && b[0], E)) b = a.parsePathString(b);
            for (var d = 0, e = b.length; d < e; d++) {
                c[d] = [];
                for (var f = 0, g = b[d].length; f < g; f++) c[d][f] = b[d][f]
            }
            c.toString = a._path2string;
            return c
        }, bz = a._pathToRelative = bt(function (b) {
            if (!a.is(b, E) || !a.is(b && b[0], E)) b = a.parsePathString(b);
            var c = [],
                d = 0,
                e = 0,
                f = 0,
                g = 0,
                h = 0;
            b[0][0] == "M" && (d = b[0][1], e = b[0][2], f = d, g = e, h++, c.push(["M", d, e]));
            for (var i = h, j = b.length; i < j; i++) {
                var k = c[i] = [],
                    l = b[i];
                if (l[0] != v.call(l[0])) {
                    k[0] = v.call(l[0]);
                    switch (k[0]) {
                        case "a":
                            k[1] = l[1], k[2] = l[2], k[3] = l[3], k[4] = l[4], k[5] = l[5], k[6] = +(l[6] - d).toFixed(3), k[7] = +(l[7] - e).toFixed(3);
                            break;
                        case "v":
                            k[1] = +(l[1] - e).toFixed(3);
                            break;
                        case "m":
                            f = l[1], g = l[2];
                        default:
                            for (var m = 1, n = l.length; m < n; m++) k[m] = +(l[m] - (m % 2 ? d : e)).toFixed(3)
                    }
                } else {
                    k = c[i] = [], l[0] == "m" && (f = l[1] + d, g = l[2] + e);
                    for (var o = 0, p = l.length; o < p; o++) c[i][o] = l[o]
                }
                var q = c[i].length;
                switch (c[i][0]) {
                    case "z":
                        d = f, e = g;
                        break;
                    case "h":
                        d += +c[i][q - 1];
                        break;
                    case "v":
                        e += +c[i][q - 1];
                        break;
                    default:
                        d += +c[i][q - 2], e += +c[i][q - 1]
                }
            }
            c.toString = a._path2string;
            return c
        }, 0, by),
        bA = a._pathToAbsolute = bt(function (b) {
            if (!a.is(b, E) || !a.is(b && b[0], E)) b = a.parsePathString(b);
            if (!b || !b.length) return [["M", 0, 0]];
            var c = [],
                d = 0,
                e = 0,
                f = 0,
                g = 0,
                h = 0;
            b[0][0] == "M" && (d = +b[0][1], e = +b[0][2], f = d, g = e, h++, c[0] = ["M", d, e]);
            for (var i, j, k = h, l = b.length; k < l; k++) {
                c.push(i = []), j = b[k];
                if (j[0] != S.call(j[0])) {
                    i[0] = S.call(j[0]);
                    switch (i[0]) {
                        case "A":
                            i[1] = j[1], i[2] = j[2], i[3] = j[3], i[4] = j[4], i[5] = j[5], i[6] = +(j[6] + d), i[7] = +(j[7] + e);
                            break;
                        case "V":
                            i[1] = +j[1] + e;
                            break;
                        case "H":
                            i[1] = +j[1] + d;
                            break;
                        case "R":
                            var m = [d, e][n](j.slice(1));
                            for (var o = 2, p = m.length; o < p; o++) m[o] = +m[o] + d, m[++o] = +m[o] + e;
                            c.pop(), c = c[n](bw(m));
                            break;
                        case "M":
                            f = +j[1] + d, g = +j[2] + e;
                        default:
                            for (o = 1, p = j.length; o < p; o++) i[o] = +j[o] + (o % 2 ? d : e)
                    }
                } else if (j[0] == "R") m = [d, e][n](j.slice(1)), c.pop(), c = c[n](bw(m)), i = ["R"][n](j.slice(-2));
                else for (var q = 0, r = j.length; q < r; q++) i[q] = j[q];
                switch (i[0]) {
                    case "Z":
                        d = f, e = g;
                        break;
                    case "H":
                        d = i[1];
                        break;
                    case "V":
                        e = i[1];
                        break;
                    case "M":
                        f = i[i.length - 2], g = i[i.length - 1];
                    default:
                        d = i[i.length - 2], e = i[i.length - 1]
                }
            }
            c.toString = a._path2string;
            return c
        }, null, by),
        bB = function (a, b, c, d) {
            return [a, b, c, d, c, d]
        }, bC = function (a, b, c, d, e, f) {
            var g = 1 / 3,
                h = 2 / 3;
            return [g * a + h * c, g * b + h * d, g * e + h * c, g * f + h * d, e, f]
        }, bD = function (a, b, c, d, e, f, g, h, i, j) {
            var k = B * 120 / 180,
                l = B / 180 * (+e || 0),
                m = [],
                o, p = bt(function (a, b, c) {
                    var d = a * w.cos(c) - b * w.sin(c),
                        e = a * w.sin(c) + b * w.cos(c);
                    return {
                        x: d,
                        y: e
                    }
                });
            if (!j) {
                o = p(a, b, -l), a = o.x, b = o.y, o = p(h, i, -l), h = o.x, i = o.y;
                var q = w.cos(B / 180 * e),
                    r = w.sin(B / 180 * e),
                    t = (a - h) / 2,
                    u = (b - i) / 2,
                    v = t * t / (c * c) + u * u / (d * d);
                v > 1 && (v = w.sqrt(v), c = v * c, d = v * d);
                var x = c * c,
                    y = d * d,
                    A = (f == g ? -1 : 1) * w.sqrt(z((x * y - x * u * u - y * t * t) / (x * u * u + y * t * t))),
                    C = A * c * u / d + (a + h) / 2,
                    D = A * -d * t / c + (b + i) / 2,
                    E = w.asin(((b - D) / d).toFixed(9)),
                    F = w.asin(((i - D) / d).toFixed(9));
                E = a < C ? B - E : E, F = h < C ? B - F : F, E < 0 && (E = B * 2 + E), F < 0 && (F = B * 2 + F), g && E > F && (E = E - B * 2), !g && F > E && (F = F - B * 2)
            } else E = j[0], F = j[1], C = j[2], D = j[3];
            var G = F - E;
            if (z(G) > k) {
                var H = F,
                    I = h,
                    J = i;
                F = E + k * (g && F > E ? 1 : -1), h = C + c * w.cos(F), i = D + d * w.sin(F), m = bD(h, i, c, d, e, 0, g, I, J, [F, H, C, D])
            }
            G = F - E;
            var K = w.cos(E),
                L = w.sin(E),
                M = w.cos(F),
                N = w.sin(F),
                O = w.tan(G / 4),
                P = 4 / 3 * c * O,
                Q = 4 / 3 * d * O,
                R = [a, b],
                S = [a + P * L, b - Q * K],
                T = [h + P * N, i - Q * M],
                U = [h, i];
            S[0] = 2 * R[0] - S[0], S[1] = 2 * R[1] - S[1];
            if (j) return [S, T, U][n](m);
            m = [S, T, U][n](m).join()[s](",");
            var V = [];
            for (var W = 0, X = m.length; W < X; W++) V[W] = W % 2 ? p(m[W - 1], m[W], l).y : p(m[W], m[W + 1], l).x;
            return V
        }, bE = function (a, b, c, d, e, f, g, h, i) {
            var j = 1 - i;
            return {
                x: A(j, 3) * a + A(j, 2) * 3 * i * c + j * 3 * i * i * e + A(i, 3) * g,
                y: A(j, 3) * b + A(j, 2) * 3 * i * d + j * 3 * i * i * f + A(i, 3) * h
            }
        }, bF = bt(function (a, b, c, d, e, f, g, h) {
            var i = e - 2 * c + a - (g - 2 * e + c),
                j = 2 * (c - a) - 2 * (e - c),
                k = a - c,
                l = (-j + w.sqrt(j * j - 4 * i * k)) / 2 / i,
                n = (-j - w.sqrt(j * j - 4 * i * k)) / 2 / i,
                o = [b, h],
                p = [a, g],
                q;
            z(l) > "1e12" && (l = .5), z(n) > "1e12" && (n = .5), l > 0 && l < 1 && (q = bE(a, b, c, d, e, f, g, h, l), p.push(q.x), o.push(q.y)), n > 0 && n < 1 && (q = bE(a, b, c, d, e, f, g, h, n), p.push(q.x), o.push(q.y)), i = f - 2 * d + b - (h - 2 * f + d), j = 2 * (d - b) - 2 * (f - d), k = b - d, l = (-j + w.sqrt(j * j - 4 * i * k)) / 2 / i, n = (-j - w.sqrt(j * j - 4 * i * k)) / 2 / i, z(l) > "1e12" && (l = .5), z(n) > "1e12" && (n = .5), l > 0 && l < 1 && (q = bE(a, b, c, d, e, f, g, h, l), p.push(q.x), o.push(q.y)), n > 0 && n < 1 && (q = bE(a, b, c, d, e, f, g, h, n), p.push(q.x), o.push(q.y));
            return {
                min: {
                    x: y[m](0, p),
                    y: y[m](0, o)
                },
                max: {
                    x: x[m](0, p),
                    y: x[m](0, o)
                }
            }
        }),
        bG = a._path2curve = bt(function (a, b) {
            var c = bA(a),
                d = b && bA(b),
                e = {
                    x: 0,
                    y: 0,
                    bx: 0,
                    by: 0,
                    X: 0,
                    Y: 0,
                    qx: null,
                    qy: null
                }, f = {
                    x: 0,
                    y: 0,
                    bx: 0,
                    by: 0,
                    X: 0,
                    Y: 0,
                    qx: null,
                    qy: null
                }, g = function (a, b) {
                    var c, d;
                    if (!a) return ["C", b.x, b.y, b.x, b.y, b.x, b.y];
                    !(a[0] in {
                        T: 1,
                        Q: 1
                    }) && (b.qx = b.qy = null);
                    switch (a[0]) {
                        case "M":
                            b.X = a[1], b.Y = a[2];
                            break;
                        case "A":
                            a = ["C"][n](bD[m](0, [b.x, b.y][n](a.slice(1))));
                            break;
                        case "S":
                            c = b.x + (b.x - (b.bx || b.x)), d = b.y + (b.y - (b.by || b.y)), a = ["C", c, d][n](a.slice(1));
                            break;
                        case "T":
                            b.qx = b.x + (b.x - (b.qx || b.x)), b.qy = b.y + (b.y - (b.qy || b.y)), a = ["C"][n](bC(b.x, b.y, b.qx, b.qy, a[1], a[2]));
                            break;
                        case "Q":
                            b.qx = a[1], b.qy = a[2], a = ["C"][n](bC(b.x, b.y, a[1], a[2], a[3], a[4]));
                            break;
                        case "L":
                            a = ["C"][n](bB(b.x, b.y, a[1], a[2]));
                            break;
                        case "H":
                            a = ["C"][n](bB(b.x, b.y, a[1], b.y));
                            break;
                        case "V":
                            a = ["C"][n](bB(b.x, b.y, b.x, a[1]));
                            break;
                        case "Z":
                            a = ["C"][n](bB(b.x, b.y, b.X, b.Y))
                    }
                    return a
                }, h = function (a, b) {
                    if (a[b].length > 7) {
                        a[b].shift();
                        var e = a[b];
                        while (e.length) a.splice(b++, 0, ["C"][n](e.splice(0, 6)));
                        a.splice(b, 1), k = x(c.length, d && d.length || 0)
                    }
                }, i = function (a, b, e, f, g) {
                    a && b && a[g][0] == "M" && b[g][0] != "M" && (b.splice(g, 0, ["M", f.x, f.y]), e.bx = 0, e.by = 0, e.x = a[g][1], e.y = a[g][2], k = x(c.length, d && d.length || 0))
                };
            for (var j = 0, k = x(c.length, d && d.length || 0); j < k; j++) {
                c[j] = g(c[j], e), h(c, j), d && (d[j] = g(d[j], f)), d && h(d, j), i(c, d, e, f, j), i(d, c, f, e, j);
                var l = c[j],
                    o = d && d[j],
                    p = l.length,
                    q = d && o.length;
                e.x = l[p - 2], e.y = l[p - 1], e.bx = Q(l[p - 4]) || e.x, e.by = Q(l[p - 3]) || e.y, f.bx = d && (Q(o[q - 4]) || f.x), f.by = d && (Q(o[q - 3]) || f.y), f.x = d && o[q - 2], f.y = d && o[q - 1]
            }
            return d ? [c, d] : c
        }, null, by),
        bH = a._parseDots = bt(function (b) {
            var c = [];
            for (var d = 0, e = b.length; d < e; d++) {
                var f = {}, g = b[d].match(/^([^:]*):?([\d\.]*)/);
                f.color = a.getRGB(g[1]);
                if (f.color.error) return null;
                f.color = f.color.hex, g[2] && (f.offset = g[2] + "%"), c.push(f)
            }
            for (d = 1, e = c.length - 1; d < e; d++) if (!c[d].offset) {
                var h = Q(c[d - 1].offset || 0),
                    i = 0;
                for (var j = d + 1; j < e; j++) if (c[j].offset) {
                    i = c[j].offset;
                    break
                }
                i || (i = 100, j = e), i = Q(i);
                var k = (i - h) / (j - d + 1);
                for (; d < j; d++) h += k, c[d].offset = h + "%"
            }
            return c
        }),
        bI = a._tear = function (a, b) {
            a == b.top && (b.top = a.prev), a == b.bottom && (b.bottom = a.next), a.next && (a.next.prev = a.prev), a.prev && (a.prev.next = a.next)
        }, bJ = a._tofront = function (a, b) {
            b.top !== a && (bI(a, b), a.next = null, a.prev = b.top, b.top.next = a, b.top = a)
        }, bK = a._toback = function (a, b) {
            b.bottom !== a && (bI(a, b), a.next = b.bottom, a.prev = null, b.bottom.prev = a, b.bottom = a)
        }, bL = a._insertafter = function (a, b, c) {
            bI(a, c), b == c.top && (c.top = a), b.next && (b.next.prev = a), a.next = b.next, a.prev = b, b.next = a
        }, bM = a._insertbefore = function (a, b, c) {
            bI(a, c), b == c.bottom && (c.bottom = a), b.prev && (b.prev.next = a), a.prev = b.prev, b.prev = a, a.next = b
        }, bN = a._extractTransform = function (b, c) {
            if (c == null) return b._.transform;
            c = r(c).replace(/\.{3}|\u2026/g, b._.transform || p);
            var d = a.parseTransformString(c),
                e = 0,
                f = 0,
                g = 0,
                h = 1,
                i = 1,
                j = b._,
                k = new bQ;
            j.transform = d || [];
            if (d) for (var l = 0, m = d.length; l < m; l++) {
                var n = d[l],
                    o = n.length,
                    q = r(n[0]).toLowerCase(),
                    s = n[0] != q,
                    t = s ? k.invert() : 0,
                    u, v, w, x, y;
                q == "t" && o == 3 ? s ? (u = t.x(0, 0), v = t.y(0, 0), w = t.x(n[1], n[2]), x = t.y(n[1], n[2]), k.translate(w - u, x - v)) : k.translate(n[1], n[2]) : q == "r" ? o == 2 ? (y = y || b.getBBox(1), k.rotate(n[1], y.x + y.width / 2, y.y + y.height / 2), e += n[1]) : o == 4 && (s ? (w = t.x(n[2], n[3]), x = t.y(n[2], n[3]), k.rotate(n[1], w, x)) : k.rotate(n[1], n[2], n[3]), e += n[1]) : q == "s" ? o == 2 || o == 3 ? (y = y || b.getBBox(1), k.scale(n[1], n[o - 1], y.x + y.width / 2, y.y + y.height / 2), h *= n[1], i *= n[o - 1]) : o == 5 && (s ? (w = t.x(n[3], n[4]), x = t.y(n[3], n[4]), k.scale(n[1], n[2], w, x)) : k.scale(n[1], n[2], n[3], n[4]), h *= n[1], i *= n[2]) : q == "m" && o == 7 && k.add(n[1], n[2], n[3], n[4], n[5], n[6]), j.dirtyT = 1, b.matrix = k
            }
            b.matrix = k, j.sx = h, j.sy = i, j.deg = e, j.dx = f = k.e, j.dy = g = k.f, h == 1 && i == 1 && !e && j.bbox ? (j.bbox.x += +f, j.bbox.y += +g) : j.dirtyT = 1
        }, bO = function (a) {
            var b = a[0];
            switch (b.toLowerCase()) {
                case "t":
                    return [b, 0, 0];
                case "m":
                    return [b, 1, 0, 0, 1, 0, 0];
                case "r":
                    return a.length == 4 ? [b, 0, a[2], a[3]] : [b, 0];
                case "s":
                    return a.length == 5 ? [b, 1, 1, a[3], a[4]] : a.length == 3 ? [b, 1, 1] : [b, 1]
            }
        }, bP = a._equaliseTransform = function (b, c) {
            c = r(c).replace(/\.{3}|\u2026/g, b), b = a.parseTransformString(b) || [], c = a.parseTransformString(c) || [];
            var d = x(b.length, c.length),
                e = [],
                f = [],
                g = 0,
                h, i, j, k;
            for (; g < d; g++) {
                j = b[g] || bO(c[g]), k = c[g] || bO(j);
                if (j[0] != k[0] || j[0].toLowerCase() == "r" && (j[2] != k[2] || j[3] != k[3]) || j[0].toLowerCase() == "s" && (j[3] != k[3] || j[4] != k[4])) return;
                e[g] = [], f[g] = [];
                for (h = 0, i = x(j.length, k.length); h < i; h++) h in j && (e[g][h] = j[h]), h in k && (f[g][h] = k[h])
            }
            return {
                from: e,
                to: f
            }
        };
    a._getContainer = function (b, c, d, e) {
        var f;
        f = e == null && !a.is(b, "object") ? h.doc.getElementById(b) : b;
        if (f != null) {
            if (f.tagName) return c == null ? {
                container: f,
                width: f.style.pixelWidth || f.offsetWidth,
                height: f.style.pixelHeight || f.offsetHeight
            } : {
                container: f,
                width: c,
                height: d
            };
            return {
                container: 1,
                x: b,
                y: c,
                width: d,
                height: e
            }
        }
    }, a.pathToRelative = bz, a._engine = {}, a.path2curve = bG, a.matrix = function (a, b, c, d, e, f) {
        return new bQ(a, b, c, d, e, f)
    },
    function (b) {
        function d(a) {
            var b = w.sqrt(c(a));
            a[0] && (a[0] /= b), a[1] && (a[1] /= b)
        }
        function c(a) {
            return a[0] * a[0] + a[1] * a[1]
        }
        b.add = function (a, b, c, d, e, f) {
            var g = [
                [],
                [],
                []
            ],
                h = [
                    [this.a, this.c, this.e],
                    [this.b, this.d, this.f],
                    [0, 0, 1]
                ],
                i = [
                    [a, c, e],
                    [b, d, f],
                    [0, 0, 1]
                ],
                j, k, l, m;
            a && a instanceof bQ && (i = [
                [a.a, a.c, a.e],
                [a.b, a.d, a.f],
                [0, 0, 1]
            ]);
            for (j = 0; j < 3; j++) for (k = 0; k < 3; k++) {
                m = 0;
                for (l = 0; l < 3; l++) m += h[j][l] * i[l][k];
                g[j][k] = m
            }
            this.a = g[0][0], this.b = g[1][0], this.c = g[0][1], this.d = g[1][1], this.e = g[0][2], this.f = g[1][2]
        }, b.invert = function () {
            var a = this,
                b = a.a * a.d - a.b * a.c;
            return new bQ(a.d / b, -a.b / b, -a.c / b, a.a / b, (a.c * a.f - a.d * a.e) / b, (a.b * a.e - a.a * a.f) / b)
        }, b.clone = function () {
            return new bQ(this.a, this.b, this.c, this.d, this.e, this.f)
        }, b.translate = function (a, b) {
            this.add(1, 0, 0, 1, a, b)
        }, b.scale = function (a, b, c, d) {
            b == null && (b = a), (c || d) && this.add(1, 0, 0, 1, c, d), this.add(a, 0, 0, b, 0, 0), (c || d) && this.add(1, 0, 0, 1, -c, -d)
        }, b.rotate = function (b, c, d) {
            b = a.rad(b), c = c || 0, d = d || 0;
            var e = +w.cos(b).toFixed(9),
                f = +w.sin(b).toFixed(9);
            this.add(e, f, -f, e, c, d), this.add(1, 0, 0, 1, -c, -d)
        }, b.x = function (a, b) {
            return a * this.a + b * this.c + this.e
        }, b.y = function (a, b) {
            return a * this.b + b * this.d + this.f
        }, b.get = function (a) {
            return +this[r.fromCharCode(97 + a)].toFixed(4)
        }, b.toString = function () {
            return a.svg ? "matrix(" + [this.get(0), this.get(1), this.get(2), this.get(3), this.get(4), this.get(5)].join() + ")" : [this.get(0), this.get(2), this.get(1), this.get(3), 0, 0].join()
        }, b.toFilter = function () {
            return "progid:DXImageTransform.Microsoft.Matrix(M11=" + this.get(0) + ", M12=" + this.get(2) + ", M21=" + this.get(1) + ", M22=" + this.get(3) + ", Dx=" + this.get(4) + ", Dy=" + this.get(5) + ", sizingmethod='auto expand')"
        }, b.offset = function () {
            return [this.e.toFixed(4), this.f.toFixed(4)]
        }, b.split = function () {
            var b = {};
            b.dx = this.e, b.dy = this.f;
            var e = [
                [this.a, this.c],
                [this.b, this.d]
            ];
            b.scalex = w.sqrt(c(e[0])), d(e[0]), b.shear = e[0][0] * e[1][0] + e[0][1] * e[1][1], e[1] = [e[1][0] - e[0][0] * b.shear, e[1][1] - e[0][1] * b.shear], b.scaley = w.sqrt(c(e[1])), d(e[1]), b.shear /= b.scaley;
            var f = -e[0][1],
                g = e[1][1];
            g < 0 ? (b.rotate = a.deg(w.acos(g)), f < 0 && (b.rotate = 360 - b.rotate)) : b.rotate = a.deg(w.asin(f)), b.isSimple = !+b.shear.toFixed(9) && (b.scalex.toFixed(9) == b.scaley.toFixed(9) || !b.rotate), b.isSuperSimple = !+b.shear.toFixed(9) && b.scalex.toFixed(9) == b.scaley.toFixed(9) && !b.rotate, b.noRotation = !+b.shear.toFixed(9) && !b.rotate;
            return b
        }, b.toTransformString = function (a) {
            var b = a || this[s]();
            if (b.isSimple) {
                b.scalex = +b.scalex.toFixed(4), b.scaley = +b.scaley.toFixed(4), b.rotate = +b.rotate.toFixed(4);
                return (b.dx && b.dy ? "t" + [b.dx, b.dy] : p) + (b.scalex != 1 || b.scaley != 1 ? "s" + [b.scalex, b.scaley, 0, 0] : p) + (b.rotate ? "r" + [b.rotate, 0, 0] : p)
            }
            return "m" + [this.get(0), this.get(1), this.get(2), this.get(3), this.get(4), this.get(5)]
        }
    }(bQ.prototype);
    var bR = navigator.userAgent.match(/Version\/(.*?)\s/) || navigator.userAgent.match(/Chrome\/(\d+)/);
    navigator.vendor == "Apple Computer, Inc." && (bR && bR[1] < 4 || navigator.platform.slice(0, 2) == "iP") || navigator.vendor == "Google Inc." && bR && bR[1] < 8 ? k.safari = function () {
        var a = this.rect(-99, -99, this.width + 99, this.height + 99).attr({
            stroke: "none"
        });
        setTimeout(function () {
            a.remove()
        })
    } : k.safari = bd;
    var bS = function () {
        this.returnValue = !1
    }, bT = function () {
        return this.originalEvent.preventDefault()
    }, bU = function () {
        this.cancelBubble = !0
    }, bV = function () {
        return this.originalEvent.stopPropagation()
    }, bW = function () {
        if (h.doc.addEventListener) return function (a, b, c, d) {
            var e = o && u[b] ? u[b] : b,
                f = function (e) {
                    var f = h.doc.documentElement.scrollTop || h.doc.body.scrollTop,
                        i = h.doc.documentElement.scrollLeft || h.doc.body.scrollLeft,
                        j = e.clientX + i,
                        k = e.clientY + f;
                    if (o && u[g](b)) for (var l = 0, m = e.targetTouches && e.targetTouches.length; l < m; l++) if (e.targetTouches[l].target == a) {
                        var n = e;
                        e = e.targetTouches[l], e.originalEvent = n, e.preventDefault = bT, e.stopPropagation = bV;
                        break
                    }
                    return c.call(d, e, j, k)
                };
            a.addEventListener(e, f, !1);
            return function () {
                a.removeEventListener(e, f, !1);
                return !0
            }
        };
        if (h.doc.attachEvent) return function (a, b, c, d) {
            var e = function (a) {
                a = a || h.win.event;
                var b = h.doc.documentElement.scrollTop || h.doc.body.scrollTop,
                    e = h.doc.documentElement.scrollLeft || h.doc.body.scrollLeft,
                    f = a.clientX + e,
                    g = a.clientY + b;
                a.preventDefault = a.preventDefault || bS, a.stopPropagation = a.stopPropagation || bU;
                return c.call(d, a, f, g)
            };
            a.attachEvent("on" + b, e);
            var f = function () {
                a.detachEvent("on" + b, e);
                return !0
            };
            return f
        }
    }(),
        bX = [],
        bY = function (a) {
            var b = a.clientX,
                c = a.clientY,
                d = h.doc.documentElement.scrollTop || h.doc.body.scrollTop,
                e = h.doc.documentElement.scrollLeft || h.doc.body.scrollLeft,
                f, g = bX.length;
            while (g--) {
                f = bX[g];
                if (o) {
                    var i = a.touches.length,
                        j;
                    while (i--) {
                        j = a.touches[i];
                        if (j.identifier == f.el._drag.id) {
                            b = j.clientX, c = j.clientY, (a.originalEvent ? a.originalEvent : a).preventDefault();
                            break
                        }
                    }
                } else a.preventDefault();
                var k = f.el.node,
                    l, m = k.nextSibling,
                    n = k.parentNode,
                    p = k.style.display;
                h.win.opera && n.removeChild(k), k.style.display = "none", l = f.el.paper.getElementByPoint(b, c), k.style.display = p, h.win.opera && (m ? n.insertBefore(k, m) : n.appendChild(k)), l && eve("drag.over." + f.el.id, f.el, l), b += e, c += d, eve("drag.move." + f.el.id, f.move_scope || f.el, b - f.el._drag.x, c - f.el._drag.y, b, c, a)
            }
        }, bZ = function (b) {
            a.unmousemove(bY).unmouseup(bZ);
            var c = bX.length,
                d;
            while (c--) d = bX[c], d.el._drag = {}, eve("drag.end." + d.el.id, d.end_scope || d.start_scope || d.move_scope || d.el, b);
            bX = []
        }, b$ = a.el = {};
    for (var b_ = t.length; b_--;)(function (b) {
        a[b] = b$[b] = function (c, d) {
            a.is(c, "function") && (this.events = this.events || [], this.events.push({
                name: b,
                f: c,
                unbind: bW(this.shape || this.node || h.doc, b, c, d || this)
            }));
            return this
        }, a["un" + b] = b$["un" + b] = function (a) {
            var c = this.events,
                d = c.length;
            while (d--) if (c[d].name == b && c[d].f == a) {
                c[d].unbind(), c.splice(d, 1), !c.length && delete this.events;
                return this
            }
            return this
        }
    })(t[b_]);
    b$.data = function (b, c) {
        var d = ba[this.id] = ba[this.id] || {};
        if (arguments.length == 1) {
            if (a.is(b, "object")) {
                for (var e in b) b[g](e) && this.data(e, b[e]);
                return this
            }
            eve("data.get." + this.id, this, d[b], b);
            return d[b]
        }
        d[b] = c, eve("data.set." + this.id, this, c, b);
        return this
    }, b$.removeData = function (a) {
        a == null ? ba[this.id] = {} : ba[this.id] && delete ba[this.id][a];
        return this
    }, b$.hover = function (a, b, c, d) {
        return this.mouseover(a, c).mouseout(b, d || c)
    }, b$.unhover = function (a, b) {
        return this.unmouseover(a).unmouseout(b)
    };
    var ca = [];
    b$.drag = function (b, c, d, e, f, g) {
        function i(i) {
            (i.originalEvent || i).preventDefault();
            var j = h.doc.documentElement.scrollTop || h.doc.body.scrollTop,
                k = h.doc.documentElement.scrollLeft || h.doc.body.scrollLeft;
            this._drag.x = i.clientX + k, this._drag.y = i.clientY + j, this._drag.id = i.identifier, !bX.length && a.mousemove(bY).mouseup(bZ), bX.push({
                el: this,
                move_scope: e,
                start_scope: f,
                end_scope: g
            }), c && eve.on("drag.start." + this.id, c), b && eve.on("drag.move." + this.id, b), d && eve.on("drag.end." + this.id, d), eve("drag.start." + this.id, f || e || this, i.clientX + k, i.clientY + j, i)
        }
        this._drag = {}, ca.push({
            el: this,
            start: i
        }), this.mousedown(i);
        return this
    }, b$.onDragOver = function (a) {
        a ? eve.on("drag.over." + this.id, a) : eve.unbind("drag.over." + this.id)
    }, b$.undrag = function () {
        var b = ca.length;
        while (b--) ca[b].el == this && (this.unmousedown(ca[b].start), ca.splice(b, 1), eve.unbind("drag.*." + this.id));
        !ca.length && a.unmousemove(bY).unmouseup(bZ)
    }, k.circle = function (b, c, d) {
        var e = a._engine.circle(this, b || 0, c || 0, d || 0);
        this.__set__ && this.__set__.push(e);
        return e
    }, k.rect = function (b, c, d, e, f) {
        var g = a._engine.rect(this, b || 0, c || 0, d || 0, e || 0, f || 0);
        this.__set__ && this.__set__.push(g);
        return g
    }, k.ellipse = function (b, c, d, e) {
        var f = a._engine.ellipse(this, b || 0, c || 0, d || 0, e || 0);
        this.__set__ && this.__set__.push(f);
        return f
    }, k.path = function (b) {
        b && !a.is(b, D) && !a.is(b[0], E) && (b += p);
        var c = a._engine.path(a.format[m](a, arguments), this);
        this.__set__ && this.__set__.push(c);
        return c
    }, k.image = function (b, c, d, e, f) {
        var g = a._engine.image(this, b || "about:blank", c || 0, d || 0, e || 0, f || 0);
        this.__set__ && this.__set__.push(g);
        return g
    }, k.text = function (b, c, d) {
        var e = a._engine.text(this, b || 0, c || 0, r(d));
        this.__set__ && this.__set__.push(e);
        return e
    }, k.set = function (b) {
        !a.is(b, "array") && (b = Array.prototype.splice.call(arguments, 0, arguments.length));
        var c = new cs(b);
        this.__set__ && this.__set__.push(c);
        return c
    }, k.setStart = function (a) {
        this.__set__ = a || this.set()
    }, k.setFinish = function (a) {
        var b = this.__set__;
        delete this.__set__;
        return b
    }, k.setSize = function (b, c) {
        return a._engine.setSize.call(this, b, c)
    }, k.setViewBox = function (b, c, d, e, f) {
        return a._engine.setViewBox.call(this, b, c, d, e, f)
    }, k.top = k.bottom = null, k.raphael = a;
    var cb = function (a) {
        var b = a.getBoundingClientRect(),
            c = a.ownerDocument,
            d = c.body,
            e = c.documentElement,
            f = e.clientTop || d.clientTop || 0,
            g = e.clientLeft || d.clientLeft || 0,
            i = b.top + (h.win.pageYOffset || e.scrollTop || d.scrollTop) - f,
            j = b.left + (h.win.pageXOffset || e.scrollLeft || d.scrollLeft) - g;
        return {
            y: i,
            x: j
        }
    };
    k.getElementByPoint = function (a, b) {
        var c = this,
            d = c.canvas,
            e = h.doc.elementFromPoint(a, b);
        if (h.win.opera && e.tagName == "svg") {
            var f = cb(d),
                g = d.createSVGRect();
            g.x = a - f.x, g.y = b - f.y, g.width = g.height = 1;
            var i = d.getIntersectionList(g, null);
            i.length && (e = i[i.length - 1])
        }
        if (!e) return null;
        while (e.parentNode && e != d.parentNode && !e.raphael) e = e.parentNode;
        e == c.canvas.parentNode && (e = d), e = e && e.raphael ? c.getById(e.raphaelid) : null;
        return e
    }, k.getById = function (a) {
        var b = this.bottom;
        while (b) {
            if (b.id == a) return b;
            b = b.next
        }
        return null
    }, k.forEach = function (a, b) {
        var c = this.bottom;
        while (c) {
            if (a.call(b, c) === !1) return this;
            c = c.next
        }
        return this
    }, b$.getBBox = function (a) {
        if (this.removed) return {};
        var b = this._;
        if (a) {
            if (b.dirty || !b.bboxwt) this.realPath = bh[this.type](this), b.bboxwt = bx(this.realPath), b.bboxwt.toString = cd, b.dirty = 0;
            return b.bboxwt
        }
        if (b.dirty || b.dirtyT || !b.bbox) {
            if (b.dirty || !this.realPath) b.bboxwt = 0, this.realPath = bh[this.type](this);
            b.bbox = bx(bi(this.realPath, this.matrix)), b.bbox.toString = cd, b.dirty = b.dirtyT = 0
        }
        return b.bbox
    }, b$.clone = function () {
        if (this.removed) return null;
        var a = this.paper[this.type]().attr(this.attr());
        this.__set__ && this.__set__.push(a);
        return a
    }, b$.glow = function (a) {
        if (this.type == "text") return null;
        a = a || {};
        var b = {
            width: (a.width || 10) + (+this.attr("stroke-width") || 1),
            fill: a.fill || !1,
            opacity: a.opacity || .5,
            offsetx: a.offsetx || 0,
            offsety: a.offsety || 0,
            color: a.color || "#000"
        }, c = b.width / 2,
            d = this.paper,
            e = d.set(),
            f = this.realPath || bh[this.type](this);
        f = this.matrix ? bi(f, this.matrix) : f;
        for (var g = 1; g < c + 1; g++) e.push(d.path(f).attr({
            stroke: b.color,
            fill: b.fill ? b.color : "none",
            "stroke-linejoin": "round",
            "stroke-linecap": "round",
            "stroke-width": +(b.width / c * g).toFixed(3),
            opacity: +(b.opacity / c).toFixed(3)
        }));
        return e.insertBefore(this).translate(b.offsetx, b.offsety)
    };
    var ce = {}, cf = function (b, c, d, e, f, g, h, i, j) {
        var k = 0,
            l = 100,
            m = [b, c, d, e, f, g, h, i].join(),
            n = ce[m],
            o, p;
        !n && (ce[m] = n = {
            data: []
        }), n.timer && clearTimeout(n.timer), n.timer = setTimeout(function () {
            delete ce[m]
        }, 2e3);
        if (j != null && !n.precision) {
            var q = cf(b, c, d, e, f, g, h, i);
            n.precision = ~~q * 10, n.data = []
        }
        l = n.precision || l;
        for (var r = 0; r < l + 1; r++) {
            n.data[r * l] ? p = n.data[r * l] : (p = a.findDotsAtSegment(b, c, d, e, f, g, h, i, r / l), n.data[r * l] = p), r && (k += A(A(o.x - p.x, 2) + A(o.y - p.y, 2), .5));
            if (j != null && k >= j) return p;
            o = p
        }
        if (j == null) return k
    }, cg = function (b, c) {
        return function (d, e, f) {
            d = bG(d);
            var g, h, i, j, k = "",
                l = {}, m, n = 0;
            for (var o = 0, p = d.length; o < p; o++) {
                i = d[o];
                if (i[0] == "M") g = +i[1], h = +i[2];
                else {
                    j = cf(g, h, i[1], i[2], i[3], i[4], i[5], i[6]);
                    if (n + j > e) {
                        if (c && !l.start) {
                            m = cf(g, h, i[1], i[2], i[3], i[4], i[5], i[6], e - n), k += ["C" + m.start.x, m.start.y, m.m.x, m.m.y, m.x, m.y];
                            if (f) return k;
                            l.start = k, k = ["M" + m.x, m.y + "C" + m.n.x, m.n.y, m.end.x, m.end.y, i[5], i[6]].join(), n += j, g = +i[5], h = +i[6];
                            continue
                        }
                        if (!b && !c) {
                            m = cf(g, h, i[1], i[2], i[3], i[4], i[5], i[6], e - n);
                            return {
                                x: m.x,
                                y: m.y,
                                alpha: m.alpha
                            }
                        }
                    }
                    n += j, g = +i[5], h = +i[6]
                }
                k += i.shift() + i
            }
            l.end = k, m = b ? n : c ? l : a.findDotsAtSegment(g, h, i[0], i[1], i[2], i[3], i[4], i[5], 1), m.alpha && (m = {
                x: m.x,
                y: m.y,
                alpha: m.alpha
            });
            return m
        }
    }, ch = cg(1),
        ci = cg(),
        cj = cg(0, 1);
    a.getTotalLength = ch, a.getPointAtLength = ci, a.getSubpath = function (a, b, c) {
        if (this.getTotalLength(a) - c < 1e-6) return cj(a, b).end;
        var d = cj(a, c, 1);
        return b ? cj(d, b).end : d
    }, b$.getTotalLength = function () {
        if (this.type == "path") {
            if (this.node.getTotalLength) return this.node.getTotalLength();
            return ch(this.attrs.path)
        }
    }, b$.getPointAtLength = function (a) {
        if (this.type == "path") return ci(this.attrs.path, a)
    }, b$.getSubpath = function (b, c) {
        if (this.type == "path") return a.getSubpath(this.attrs.path, b, c)
    };
    var ck = a.easing_formulas = {
        linear: function (a) {
            return a
        },
        "<": function (a) {
            return A(a, 1.7)
        },
        ">": function (a) {
            return A(a, .48)
        },
        "<>": function (a) {
            var b = .48 - a / 1.04,
                c = w.sqrt(.1734 + b * b),
                d = c - b,
                e = A(z(d), 1 / 3) * (d < 0 ? -1 : 1),
                f = -c - b,
                g = A(z(f), 1 / 3) * (f < 0 ? -1 : 1),
                h = e + g + .5;
            return (1 - h) * 3 * h * h + h * h * h
        },
        backIn: function (a) {
            var b = 1.70158;
            return a * a * ((b + 1) * a - b)
        },
        backOut: function (a) {
            a = a - 1;
            var b = 1.70158;
            return a * a * ((b + 1) * a + b) + 1
        },
        elastic: function (a) {
            if (a == !! a) return a;
            return A(2, -10 * a) * w.sin((a - .075) * 2 * B / .3) + 1
        },
        bounce: function (a) {
            var b = 7.5625,
                c = 2.75,
                d;
            a < 1 / c ? d = b * a * a : a < 2 / c ? (a -= 1.5 / c, d = b * a * a + .75) : a < 2.5 / c ? (a -= 2.25 / c, d = b * a * a + .9375) : (a -= 2.625 / c, d = b * a * a + .984375);
            return d
        }
    };
    ck.easeIn = ck["ease-in"] = ck["<"], ck.easeOut = ck["ease-out"] = ck[">"], ck.easeInOut = ck["ease-in-out"] = ck["<>"], ck["back-in"] = ck.backIn, ck["back-out"] = ck.backOut;
    var cl = [],
        cm = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame || function (a) {
            setTimeout(a, 16)
        }, cn = function () {
            var b = +(new Date),
                c = 0;
            for (; c < cl.length; c++) {
                var d = cl[c];
                if (d.el.removed || d.paused) continue;
                var e = b - d.start,
                    f = d.ms,
                    h = d.easing,
                    i = d.from,
                    j = d.diff,
                    k = d.to,
                    l = d.t,
                    m = d.el,
                    o = {}, p, r = {}, s;
                d.initstatus ? (e = (d.initstatus * d.anim.top - d.prev) / (d.percent - d.prev) * f, d.status = d.initstatus, delete d.initstatus, d.stop && cl.splice(c--, 1)) : d.status = (d.prev + (d.percent - d.prev) * (e / f)) / d.anim.top;
                if (e < 0) continue;
                if (e < f) {
                    var t = h(e / f);
                    for (var u in i) if (i[g](u)) {
                        switch (U[u]) {
                            case C:
                                p = +i[u] + t * f * j[u];
                                break;
                            case "colour":
                                p = "rgb(" + [co(O(i[u].r + t * f * j[u].r)), co(O(i[u].g + t * f * j[u].g)), co(O(i[u].b + t * f * j[u].b))].join(",") + ")";
                                break;
                            case "path":
                                p = [];
                                for (var v = 0, w = i[u].length; v < w; v++) {
                                    p[v] = [i[u][v][0]];
                                    for (var x = 1, y = i[u][v].length; x < y; x++) p[v][x] = +i[u][v][x] + t * f * j[u][v][x];
                                    p[v] = p[v].join(q)
                                }
                                p = p.join(q);
                                break;
                            case "transform":
                                if (j[u].real) {
                                    p = [];
                                    for (v = 0, w = i[u].length; v < w; v++) {
                                        p[v] = [i[u][v][0]];
                                        for (x = 1, y = i[u][v].length; x < y; x++) p[v][x] = i[u][v][x] + t * f * j[u][v][x]
                                    }
                                } else {
                                    var z = function (a) {
                                        return +i[u][a] + t * f * j[u][a]
                                    };
                                    p = [
                                        ["m", z(0), z(1), z(2), z(3), z(4), z(5)]
                                    ]
                                }
                                break;
                            case "csv":
                                if (u == "clip-rect") {
                                    p = [], v = 4;
                                    while (v--) p[v] = +i[u][v] + t * f * j[u][v]
                                }
                                break;
                            default:
                                var A = [][n](i[u]);
                                p = [], v = m.paper.customAttributes[u].length;
                                while (v--) p[v] = +A[v] + t * f * j[u][v]
                        }
                        o[u] = p
                    }
                    m.attr(o),
                    function (a, b, c) {
                        setTimeout(function () {
                            eve("anim.frame." + a, b, c)
                        })
                    }(m.id, m, d.anim)
                } else {
                    (function (b, c, d) {
                        setTimeout(function () {
                            eve("anim.frame." + c.id, c, d), eve("anim.finish." + c.id, c, d), a.is(b, "function") && b.call(c)
                        })
                    })(d.callback, m, d.anim), m.attr(k), cl.splice(c--, 1);
                    if (d.repeat > 1 && !d.next) {
                        for (s in k) k[g](s) && (r[s] = d.totalOrigin[s]);
                        d.el.attr(r), cr(d.anim, d.el, d.anim.percents[0], null, d.totalOrigin, d.repeat - 1)
                    }
                    d.next && !d.stop && cr(d.anim, d.el, d.next, null, d.totalOrigin, d.repeat)
                }
            }
            a.svg && m && m.paper && m.paper.safari(), cl.length && cm(cn)
        }, co = function (a) {
            return a > 255 ? 255 : a < 0 ? 0 : a
        };
    b$.animateWith = function (b, c, d, e, f, g) {
        var h = d ? a.animation(d, e, f, g) : c,
            i = b.status(c);
        return this.animate(h).status(h, i * c.ms / h.ms)
    }, b$.onAnimation = function (a) {
        a ? eve.on("anim.frame." + this.id, a) : eve.unbind("anim.frame." + this.id);
        return this
    }, cq.prototype.delay = function (a) {
        var b = new cq(this.anim, this.ms);
        b.times = this.times, b.del = +a || 0;
        return b
    }, cq.prototype.repeat = function (a) {
        var b = new cq(this.anim, this.ms);
        b.del = this.del, b.times = w.floor(x(a, 0)) || 1;
        return b
    }, a.animation = function (b, c, d, e) {
        if (b instanceof cq) return b;
        if (a.is(d, "function") || !d) e = e || d || null, d = null;
        b = Object(b), c = +c || 0;
        var f = {}, h, i;
        for (i in b) b[g](i) && Q(i) != i && Q(i) + "%" != i && (h = !0, f[i] = b[i]);
        if (!h) return new cq(b, c);
        d && (f.easing = d), e && (f.callback = e);
        return new cq({
            100: f
        }, c)
    }, b$.animate = function (b, c, d, e) {
        var f = this;
        if (f.removed) {
            e && e.call(f);
            return f
        }
        var g = b instanceof cq ? b : a.animation(b, c, d, e);
        cr(g, f, g.percents[0], null, f.attr());
        return f
    }, b$.setTime = function (a, b) {
        a && b != null && this.status(a, y(b, a.ms) / a.ms);
        return this
    }, b$.status = function (a, b) {
        var c = [],
            d = 0,
            e, f;
        if (b != null) {
            cr(a, this, -1, y(b, 1));
            return this
        }
        e = cl.length;
        for (; d < e; d++) {
            f = cl[d];
            if (f.el.id == this.id && (!a || f.anim == a)) {
                if (a) return f.status;
                c.push({
                    anim: f.anim,
                    status: f.status
                })
            }
        }
        if (a) return 0;
        return c
    }, b$.pause = function (a) {
        for (var b = 0; b < cl.length; b++) cl[b].el.id == this.id && (!a || cl[b].anim == a) && eve("anim.pause." + this.id, this, cl[b].anim) !== !1 && (cl[b].paused = !0);
        return this
    }, b$.resume = function (a) {
        for (var b = 0; b < cl.length; b++) if (cl[b].el.id == this.id && (!a || cl[b].anim == a)) {
            var c = cl[b];
            eve("anim.resume." + this.id, this, c.anim) !== !1 && (delete c.paused, this.status(c.anim, c.status))
        }
        return this
    }, b$.stop = function (a) {
        for (var b = 0; b < cl.length; b++) cl[b].el.id == this.id && (!a || cl[b].anim == a) && eve("anim.stop." + this.id, this, cl[b].anim) !== !1 && cl.splice(b--, 1);
        return this
    }, b$.toString = function () {
        return "Rapha�l�s object"
    };
    var cs = function (a) {
        this.items = [], this.length = 0, this.type = "set";
        if (a) for (var b = 0, c = a.length; b < c; b++) a[b] && (a[b].constructor == b$.constructor || a[b].constructor == cs) && (this[this.items.length] = this.items[this.items.length] = a[b], this.length++)
    }, ct = cs.prototype;
    ct.push = function () {
        var a, b;
        for (var c = 0, d = arguments.length; c < d; c++) a = arguments[c], a && (a.constructor == b$.constructor || a.constructor == cs) && (b = this.items.length, this[b] = this.items[b] = a, this.length++);
        return this
    }, ct.pop = function () {
        this.length && delete this[this.length--];
        return this.items.pop()
    }, ct.forEach = function (a, b) {
        for (var c = 0, d = this.items.length; c < d; c++) if (a.call(b, this.items[c], c) === !1) return this;
        return this
    };
    for (var cu in b$) b$[g](cu) && (ct[cu] = function (a) {
        return function () {
            var b = arguments;
            return this.forEach(function (c) {
                c[a][m](c, b)
            })
        }
    }(cu));
    ct.attr = function (b, c) {
        if (b && a.is(b, E) && a.is(b[0], "object")) for (var d = 0, e = b.length; d < e; d++) this.items[d].attr(b[d]);
        else for (var f = 0, g = this.items.length; f < g; f++) this.items[f].attr(b, c);
        return this
    }, ct.clear = function () {
        while (this.length) this.pop()
    }, ct.splice = function (a, b, c) {
        a = a < 0 ? x(this.length + a, 0) : a, b = x(0, y(this.length - a, b));
        var d = [],
            e = [],
            f = [],
            g;
        for (g = 2; g < arguments.length; g++) f.push(arguments[g]);
        for (g = 0; g < b; g++) e.push(this[a + g]);
        for (; g < this.length - a; g++) d.push(this[a + g]);
        var h = f.length;
        for (g = 0; g < h + d.length; g++) this.items[a + g] = this[a + g] = g < h ? f[g] : d[g - h];
        g = this.items.length = this.length -= b - h;
        while (this[g]) delete this[g++];
        return new cs(e)
    }, ct.exclude = function (a) {
        for (var b = 0, c = this.length; b < c; b++) if (this[b] == a) {
            this.splice(b, 1);
            return !0
        }
    }, ct.animate = function (b, c, d, e) {
        (a.is(d, "function") || !d) && (e = d || null);
        var f = this.items.length,
            g = f,
            h, i = this,
            j;
        if (!f) return this;
        e && (j = function () {
            !--f && e.call(i)
        }), d = a.is(d, D) ? d : j;
        var k = a.animation(b, c, d, j);
        h = this.items[--g].animate(k);
        while (g--) this.items[g] && !this.items[g].removed && this.items[g].animateWith(h, k);
        return this
    }, ct.insertAfter = function (a) {
        var b = this.items.length;
        while (b--) this.items[b].insertAfter(a);
        return this
    }, ct.getBBox = function () {
        var a = [],
            b = [],
            c = [],
            d = [];
        for (var e = this.items.length; e--;) if (!this.items[e].removed) {
            var f = this.items[e].getBBox();
            a.push(f.x), b.push(f.y), c.push(f.x + f.width), d.push(f.y + f.height)
        }
        a = y[m](0, a), b = y[m](0, b);
        return {
            x: a,
            y: b,
            width: x[m](0, c) - a,
            height: x[m](0, d) - b
        }
    }, ct.clone = function (a) {
        a = new cs;
        for (var b = 0, c = this.items.length; b < c; b++) a.push(this.items[b].clone());
        return a
    }, ct.toString = function () {
        return "Rapha�l�s set"
    }, a.registerFont = function (a) {
        if (!a.face) return a;
        this.fonts = this.fonts || {};
        var b = {
            w: a.w,
            face: {},
            glyphs: {}
        }, c = a.face["font-family"];
        for (var d in a.face) a.face[g](d) && (b.face[d] = a.face[d]);
        this.fonts[c] ? this.fonts[c].push(b) : this.fonts[c] = [b];
        if (!a.svg) {
            b.face["units-per-em"] = R(a.face["units-per-em"], 10);
            for (var e in a.glyphs) if (a.glyphs[g](e)) {
                var f = a.glyphs[e];
                b.glyphs[e] = {
                    w: f.w,
                    k: {},
                    d: f.d && "M" + f.d.replace(/[mlcxtrv]/g, function (a) {
                        return {
                            l: "L",
                            c: "C",
                            x: "z",
                            t: "m",
                            r: "l",
                            v: "c"
                        }[a] || "M"
                    }) + "z"
                };
                if (f.k) for (var h in f.k) f[g](h) && (b.glyphs[e].k[h] = f.k[h])
            }
        }
        return a
    }, k.getFont = function (b, c, d, e) {
        e = e || "normal", d = d || "normal", c = +c || {
            normal: 400,
            bold: 700,
            lighter: 300,
            bolder: 800
        }[c] || 400;
        if ( !! a.fonts) {
            var f = a.fonts[b];
            if (!f) {
                var h = new RegExp("(^|\\s)" + b.replace(/[^\w\d\s+!~.:_-]/g, p) + "(\\s|$)", "i");
                for (var i in a.fonts) if (a.fonts[g](i) && h.test(i)) {
                    f = a.fonts[i];
                    break
                }
            }
            var j;
            if (f) for (var k = 0, l = f.length; k < l; k++) {
                j = f[k];
                if (j.face["font-weight"] == c && (j.face["font-style"] == d || !j.face["font-style"]) && j.face["font-stretch"] == e) break
            }
            return j
        }
    }, k.print = function (b, d, e, f, g, h, i) {
        h = h || "middle", i = x(y(i || 0, 1), -1);
        var j = this.set(),
            k = r(e)[s](p),
            l = 0,
            m = p,
            n;
        a.is(f, e) && (f = this.getFont(f));
        if (f) {
            n = (g || 16) / f.face["units-per-em"];
            var o = f.face.bbox[s](c),
                q = +o[0],
                t = +o[1] + (h == "baseline" ? o[3] - o[1] + +f.face.descent : (o[3] - o[1]) / 2);
            for (var u = 0, v = k.length; u < v; u++) {
                var w = u && f.glyphs[k[u - 1]] || {}, z = f.glyphs[k[u]];
                l += u ? (w.w || f.w) + (w.k && w.k[k[u]] || 0) + f.w * i : 0, z && z.d && j.push(this.path(z.d).attr({
                    fill: "#000",
                    stroke: "none",
                    transform: [
                        ["t", l * n, 0]
                    ]
                }))
            }
            j.transform(["...s", n, n, q, t, "t", (b - q) / n, (d - t) / n])
        }
        return j
    }, k.add = function (b) {
        if (a.is(b, "array")) {
            var c = this.set(),
                e = 0,
                f = b.length,
                h;
            for (; e < f; e++) h = b[e] || {}, d[g](h.type) && c.push(this[h.type]().attr(h))
        }
        return c
    }, a.format = function (b, c) {
        var d = a.is(c, E) ? [0][n](c) : arguments;
        b && a.is(b, D) && d.length - 1 && (b = b.replace(e, function (a, b) {
            return d[++b] == null ? p : d[b]
        }));
        return b || p
    }, a.fullfill = function () {
        var a = /\{([^\}]+)\}/g,
            b = /(?:(?:^|\.)(.+?)(?=\[|\.|$|\()|\[('|")(.+?)\2\])(\(\))?/g,
            c = function (a, c, d) {
                var e = d;
                c.replace(b, function (a, b, c, d, f) {
                    b = b || d, e && (b in e && (e = e[b]), typeof e == "function" && f && (e = e()))
                }), e = (e == null || e == d ? a : e) + "";
                return e
            };
        return function (b, d) {
            return String(b).replace(a, function (a, b) {
                return c(a, b, d)
            })
        }
    }(), a.ninja = function () {
        i.was ? h.win.Raphael = i.is : delete Raphael;
        return a
    }, a.st = ct,
    function (b, c, d) {
        function e() {
            /in/.test(b.readyState) ? setTimeout(e, 9) : a.eve("DOMload")
        }
        b.readyState == null && b.addEventListener && (b.addEventListener(c, d = function () {
            b.removeEventListener(c, d, !1), b.readyState = "complete"
        }, !1), b.readyState = "loading"), e()
    }(document, "DOMContentLoaded"), i.was ? h.win.Raphael = a : Raphael = a, eve.on("DOMload", function () {
        b = !0
    })
}(), window.Raphael.svg && function (a) {
    var b = "hasOwnProperty",
        c = String,
        d = parseFloat,
        e = parseInt,
        f = Math,
        g = f.max,
        h = f.abs,
        i = f.pow,
        j = /[, ]+/,
        k = a.eve,
        l = "",
        m = " ",
        n = "http://www.w3.org/1999/xlink",
        o = {
            block: "M5,0 0,2.5 5,5z",
            classic: "M5,0 0,2.5 5,5 3.5,3 3.5,2z",
            diamond: "M2.5,0 5,2.5 2.5,5 0,2.5z",
            open: "M6,1 1,3.5 6,6",
            oval: "M2.5,0A2.5,2.5,0,0,1,2.5,5 2.5,2.5,0,0,1,2.5,0z"
        }, p = {};
    a.toString = function () {
        return "Your browser supports SVG.\nYou are running Rapha�l " + this.version
    };
    var q = function (d, e) {
        if (e) {
            typeof d == "string" && (d = q(d));
            for (var f in e) e[b](f) && (f.substring(0, 6) == "xlink:" ? d.setAttributeNS(n, f.substring(6), c(e[f])) : d.setAttribute(f, c(e[f])))
        } else d = a._g.doc.createElementNS("http://www.w3.org/2000/svg", d), d.style && (d.style.webkitTapHighlightColor = "rgba(0,0,0,0)");
        return d
    }, r = function (b, e) {
        var j = "linear",
            k = b.id + e,
            m = .5,
            n = .5,
            o = b.node,
            p = b.paper,
            r = o.style,
            s = a._g.doc.getElementById(k);
        if (!s) {
            e = c(e).replace(a._radial_gradient, function (a, b, c) {
                j = "radial";
                if (b && c) {
                    m = d(b), n = d(c);
                    var e = (n > .5) * 2 - 1;
                    i(m - .5, 2) + i(n - .5, 2) > .25 && (n = f.sqrt(.25 - i(m - .5, 2)) * e + .5) && n != .5 && (n = n.toFixed(5) - 1e-5 * e)
                }
                return l
            }), e = e.split(/\s*\-\s*/);
            if (j == "linear") {
                var t = e.shift();
                t = -d(t);
                if (isNaN(t)) return null;
                var u = [0, 0, f.cos(a.rad(t)), f.sin(a.rad(t))],
                    v = 1 / (g(h(u[2]), h(u[3])) || 1);
                u[2] *= v, u[3] *= v, u[2] < 0 && (u[0] = -u[2], u[2] = 0), u[3] < 0 && (u[1] = -u[3], u[3] = 0)
            }
            var w = a._parseDots(e);
            if (!w) return null;
            k = k.replace(/[\(\)\s,\xb0#]/g, "_"), b.gradient && k != b.gradient.id && (p.defs.removeChild(b.gradient), delete b.gradient);
            if (!b.gradient) {
                s = q(j + "Gradient", {
                    id: k
                }), b.gradient = s, q(s, j == "radial" ? {
                    fx: m,
                    fy: n
                } : {
                    x1: u[0],
                    y1: u[1],
                    x2: u[2],
                    y2: u[3],
                    gradientTransform: b.matrix.invert()
                }), p.defs.appendChild(s);
                for (var x = 0, y = w.length; x < y; x++) s.appendChild(q("stop", {
                    offset: w[x].offset ? w[x].offset : x ? "100%" : "0%",
                    "stop-color": w[x].color || "#fff"
                }))
            }
        }
        q(o, {
            fill: "url(#" + k + ")",
            opacity: 1,
            "fill-opacity": 1
        }), r.fill = l, r.opacity = 1, r.fillOpacity = 1;
        return 1
    }, s = function (a) {
        var b = a.getBBox(1);
        q(a.pattern, {
            patternTransform: a.matrix.invert() + " translate(" + b.x + "," + b.y + ")"
        })
    }, t = function (d, e, f) {
        if (d.type == "path") {
            var g = c(e).toLowerCase().split("-"),
                h = d.paper,
                i = f ? "end" : "start",
                j = d.node,
                k = d.attrs,
                l = k["stroke-width"],
                n = g.length,
                r = "classic",
                s, t, u, v, w, x = 3,
                y = 3,
                z = 5;
            while (n--) switch (g[n]) {
                case "block":
                case "classic":
                case "oval":
                case "diamond":
                case "open":
                case "none":
                    r = g[n];
                    break;
                case "wide":
                    y = 5;
                    break;
                case "narrow":
                    y = 2;
                    break;
                case "long":
                    x = 5;
                    break;
                case "short":
                    x = 2
            }
            r == "open" ? (x += 2, y += 2, z += 2, u = 1, v = f ? 4 : 1, w = {
                fill: "none",
                stroke: k.stroke
            }) : (v = u = x / 2, w = {
                fill: k.stroke,
                stroke: "none"
            }), d._.arrows ? f ? (d._.arrows.endPath && p[d._.arrows.endPath]--, d._.arrows.endMarker && p[d._.arrows.endMarker]--) : (d._.arrows.startPath && p[d._.arrows.startPath]--, d._.arrows.startMarker && p[d._.arrows.startMarker]--) : d._.arrows = {};
            if (r != "none") {
                var A = "raphael-marker-" + r,
                    B = "raphael-marker-" + i + r + x + y;
                a._g.doc.getElementById(A) ? p[A]++ : (h.defs.appendChild(q(q("path"), {
                    "stroke-linecap": "round",
                    d: o[r],
                    id: A
                })), p[A] = 1);
                var C = a._g.doc.getElementById(B),
                    D;
                C ? (p[B]++, D = C.getElementsByTagName("use")[0]) : (C = q(q("marker"), {
                    id: B,
                    markerHeight: y,
                    markerWidth: x,
                    orient: "auto",
                    refX: v,
                    refY: y / 2
                }), D = q(q("use"), {
                    "xlink:href": "#" + A,
                    transform: (f ? " rotate(180 " + x / 2 + " " + y / 2 + ") " : m) + "scale(" + x / z + "," + y / z + ")",
                    "stroke-width": 1 / ((x / z + y / z) / 2)
                }), C.appendChild(D), h.defs.appendChild(C), p[B] = 1), q(D, w);
                var E = u * (r != "diamond" && r != "oval");
                f ? (s = d._.arrows.startdx * l || 0, t = a.getTotalLength(k.path) - E * l) : (s = E * l, t = a.getTotalLength(k.path) - (d._.arrows.enddx * l || 0)), w = {}, w["marker-" + i] = "url(#" + B + ")";
                if (t || s) w.d = Raphael.getSubpath(k.path, s, t);
                q(j, w), d._.arrows[i + "Path"] = A, d._.arrows[i + "Marker"] = B, d._.arrows[i + "dx"] = E, d._.arrows[i + "Type"] = r, d._.arrows[i + "String"] = e
            } else f ? (s = d._.arrows.startdx * l || 0, t = a.getTotalLength(k.path) - s) : (s = 0, t = a.getTotalLength(k.path) - (d._.arrows.enddx * l || 0)), d._.arrows[i + "Path"] && q(j, {
                d: Raphael.getSubpath(k.path, s, t)
            }), delete d._.arrows[i + "Path"], delete d._.arrows[i + "Marker"], delete d._.arrows[i + "dx"], delete d._.arrows[i + "Type"], delete d._.arrows[i + "String"];
            for (w in p) if (p[b](w) && !p[w]) {
                var F = a._g.doc.getElementById(w);
                F && F.parentNode.removeChild(F)
            }
        }
    }, u = {
        "": [0],
        none: [0],
        "-": [3, 1],
        ".": [1, 1],
        "-.": [3, 1, 1, 1],
        "-..": [3, 1, 1, 1, 1, 1],
        ". ": [1, 3],
        "- ": [4, 3],
        "--": [8, 3],
        "- .": [4, 3, 1, 3],
        "--.": [8, 3, 1, 3],
        "--..": [8, 3, 1, 3, 1, 3]
    }, v = function (a, b, d) {
        b = u[c(b).toLowerCase()];
        if (b) {
            var e = a.attrs["stroke-width"] || "1",
                f = {
                    round: e,
                    square: e,
                    butt: 0
                }[a.attrs["stroke-linecap"] || d["stroke-linecap"]] || 0,
                g = [],
                h = b.length;
            while (h--) g[h] = b[h] * e + (h % 2 ? 1 : -1) * f;
            q(a.node, {
                "stroke-dasharray": g.join(",")
            })
        }
    }, w = function (d, f) {
        var i = d.node,
            k = d.attrs,
            m = i.style.visibility;
        i.style.visibility = "hidden";
        for (var o in f) if (f[b](o)) {
            if (!a._availableAttrs[b](o)) continue;
            var p = f[o];
            k[o] = p;
            switch (o) {
                case "blur":
                    d.blur(p);
                    break;
                case "href":
                case "title":
                case "target":
                    var u = i.parentNode;
                    if (u.tagName.toLowerCase() != "a") {
                        var w = q("a");
                        u.insertBefore(w, i), w.appendChild(i), u = w
                    }
                    o == "target" && p == "blank" ? u.setAttributeNS(n, "show", "new") : u.setAttributeNS(n, o, p);
                    break;
                case "cursor":
                    i.style.cursor = p;
                    break;
                case "transform":
                    d.transform(p);
                    break;
                case "arrow-start":
                    t(d, p);
                    break;
                case "arrow-end":
                    t(d, p, 1);
                    break;
                case "clip-rect":
                    var x = c(p).split(j);
                    if (x.length == 4) {
                        d.clip && d.clip.parentNode.parentNode.removeChild(d.clip.parentNode);
                        var z = q("clipPath"),
                            A = q("rect");
                        z.id = a.createUUID(), q(A, {
                            x: x[0],
                            y: x[1],
                            width: x[2],
                            height: x[3]
                        }), z.appendChild(A), d.paper.defs.appendChild(z), q(i, {
                            "clip-path": "url(#" + z.id + ")"
                        }), d.clip = A
                    }
                    if (!p) {
                        var B = i.getAttribute("clip-path");
                        if (B) {
                            var C = a._g.doc.getElementById(B.replace(/(^url\(#|\)$)/g, l));
                            C && C.parentNode.removeChild(C), q(i, {
                                "clip-path": l
                            }), delete d.clip
                        }
                    }
                    break;
                case "path":
                    d.type == "path" && (q(i, {
                        d: p ? k.path = a._pathToAbsolute(p) : "M0,0"
                    }), d._.dirty = 1, d._.arrows && ("startString" in d._.arrows && t(d, d._.arrows.startString), "endString" in d._.arrows && t(d, d._.arrows.endString, 1)));
                    break;
                case "width":
                    i.setAttribute(o, p), d._.dirty = 1;
                    if (k.fx) o = "x", p = k.x;
                    else break;
                case "x":
                    k.fx && (p = -k.x - (k.width || 0));
                case "rx":
                    if (o == "rx" && d.type == "rect") break;
                case "cx":
                    i.setAttribute(o, p), d.pattern && s(d), d._.dirty = 1;
                    break;
                case "height":
                    i.setAttribute(o, p), d._.dirty = 1;
                    if (k.fy) o = "y", p = k.y;
                    else break;
                case "y":
                    k.fy && (p = -k.y - (k.height || 0));
                case "ry":
                    if (o == "ry" && d.type == "rect") break;
                case "cy":
                    i.setAttribute(o, p), d.pattern && s(d), d._.dirty = 1;
                    break;
                case "r":
                    d.type == "rect" ? q(i, {
                        rx: p,
                        ry: p
                    }) : i.setAttribute(o, p), d._.dirty = 1;
                    break;
                case "src":
                    d.type == "image" && i.setAttributeNS(n, "href", p);
                    break;
                case "stroke-width":
                    if (d._.sx != 1 || d._.sy != 1) p /= g(h(d._.sx), h(d._.sy)) || 1;
                    d.paper._vbSize && (p *= d.paper._vbSize), i.setAttribute(o, p), k["stroke-dasharray"] && v(d, k["stroke-dasharray"], f), d._.arrows && ("startString" in d._.arrows && t(d, d._.arrows.startString), "endString" in d._.arrows && t(d, d._.arrows.endString, 1));
                    break;
                case "stroke-dasharray":
                    v(d, p, f);
                    break;
                case "fill":
                    var D = c(p).match(a._ISURL);
                    if (D) {
                        z = q("pattern");
                        var F = q("image");
                        z.id = a.createUUID(), q(z, {
                            x: 0,
                            y: 0,
                            patternUnits: "userSpaceOnUse",
                            height: 1,
                            width: 1
                        }), q(F, {
                            x: 0,
                            y: 0,
                            "xlink:href": D[1]
                        }), z.appendChild(F),
                        function (b) {
                            a._preload(D[1], function () {
                                var a = this.offsetWidth,
                                    c = this.offsetHeight;
                                q(b, {
                                    width: a,
                                    height: c
                                }), q(F, {
                                    width: a,
                                    height: c
                                }), d.paper.safari()
                            })
                        }(z), d.paper.defs.appendChild(z), i.style.fill = "url(#" + z.id + ")", q(i, {
                            fill: "url(#" + z.id + ")"
                        }), d.pattern = z, d.pattern && s(d);
                        break
                    }
                    var G = a.getRGB(p);
                    if (!G.error) delete f.gradient, delete k.gradient, !a.is(k.opacity, "undefined") && a.is(f.opacity, "undefined") && q(i, {
                        opacity: k.opacity
                    }), !a.is(k["fill-opacity"], "undefined") && a.is(f["fill-opacity"], "undefined") && q(i, {
                        "fill-opacity": k["fill-opacity"]
                    });
                    else if ((d.type == "circle" || d.type == "ellipse" || c(p).charAt() != "r") && r(d, p)) {
                        if ("opacity" in k || "fill-opacity" in k) {
                            var H = a._g.doc.getElementById(i.getAttribute("fill").replace(/^url\(#|\)$/g, l));
                            if (H) {
                                var I = H.getElementsByTagName("stop");
                                q(I[I.length - 1], {
                                    "stop-opacity": ("opacity" in k ? k.opacity : 1) * ("fill-opacity" in k ? k["fill-opacity"] : 1)
                                })
                            }
                        }
                        k.gradient = p, k.fill = "none";
                        break
                    }
                    G[b]("opacity") && q(i, {
                        "fill-opacity": G.opacity > 1 ? G.opacity / 100 : G.opacity
                    });
                case "stroke":
                    G = a.getRGB(p), i.setAttribute(o, G.hex), o == "stroke" && G[b]("opacity") && q(i, {
                        "stroke-opacity": G.opacity > 1 ? G.opacity / 100 : G.opacity
                    }), o == "stroke" && d._.arrows && ("startString" in d._.arrows && t(d, d._.arrows.startString), "endString" in d._.arrows && t(d, d._.arrows.endString, 1));
                    break;
                case "gradient":
                    (d.type == "circle" || d.type == "ellipse" || c(p).charAt() != "r") && r(d, p);
                    break;
                case "opacity":
                    k.gradient && !k[b]("stroke-opacity") && q(i, {
                        "stroke-opacity": p > 1 ? p / 100 : p
                    });
                case "fill-opacity":
                    if (k.gradient) {
                        H = a._g.doc.getElementById(i.getAttribute("fill").replace(/^url\(#|\)$/g, l)), H && (I = H.getElementsByTagName("stop"), q(I[I.length - 1], {
                            "stop-opacity": p
                        }));
                        break
                    };
                default:
                    o == "font-size" && (p = e(p, 10) + "px");
                    var J = o.replace(/(\-.)/g, function (a) {
                        return a.substring(1).toUpperCase()
                    });
                    i.style[J] = p, d._.dirty = 1, i.setAttribute(o, p)
            }
        }
        y(d, f), i.style.visibility = m
    }, x = 1.2,
        y = function (d, f) {
            if (d.type == "text" && !! (f[b]("text") || f[b]("font") || f[b]("font-size") || f[b]("x") || f[b]("y"))) {
                var g = d.attrs,
                    h = d.node,
                    i = h.firstChild ? e(a._g.doc.defaultView.getComputedStyle(h.firstChild, l).getPropertyValue("font-size"), 10) : 10;
                if (f[b]("text")) {
                    g.text = f.text;
                    while (h.firstChild) h.removeChild(h.firstChild);
                    var j = c(f.text).split("\n"),
                        k = [],
                        m;
                    for (var n = 0, o = j.length; n < o; n++) m = q("tspan"), n && q(m, {
                        dy: i * x,
                        x: g.x
                    }), m.appendChild(a._g.doc.createTextNode(j[n])), h.appendChild(m), k[n] = m
                } else {
                    k = h.getElementsByTagName("tspan");
                    for (n = 0, o = k.length; n < o; n++) n ? q(k[n], {
                        dy: i * x,
                        x: g.x
                    }) : q(k[0], {
                        dy: 0
                    })
                }
                q(h, {
                    x: g.x,
                    y: g.y
                }), d._.dirty = 1;
                var p = d._getBBox(),
                    r = g.y - (p.y + p.height / 2);
                r && a.is(r, "finite") && q(k[0], {
                    dy: r
                })
            }
        }, z = function (b, c) {
            var d = 0,
                e = 0;
            this[0] = this.node = b, b.raphael = !0, this.id = a._oid++, b.raphaelid = this.id, this.matrix = a.matrix(), this.realPath = null, this.paper = c, this.attrs = this.attrs || {}, this._ = {
                transform: [],
                sx: 1,
                sy: 1,
                deg: 0,
                dx: 0,
                dy: 0,
                dirty: 1
            }, !c.bottom && (c.bottom = this), this.prev = c.top, c.top && (c.top.next = this), c.top = this, this.next = null
        }, A = a.el;
    z.prototype = A, A.constructor = z, a._engine.path = function (a, b) {
        var c = q("path");
        b.canvas && b.canvas.appendChild(c);
        var d = new z(c, b);
        d.type = "path", w(d, {
            fill: "none",
            stroke: "#000",
            path: a
        });
        return d
    }, A.rotate = function (a, b, e) {
        if (this.removed) return this;
        a = c(a).split(j), a.length - 1 && (b = d(a[1]), e = d(a[2])), a = d(a[0]), e == null && (b = e);
        if (b == null || e == null) {
            var f = this.getBBox(1);
            b = f.x + f.width / 2, e = f.y + f.height / 2
        }
        this.transform(this._.transform.concat([
            ["r", a, b, e]
        ]));
        return this
    }, A.scale = function (a, b, e, f) {
        if (this.removed) return this;
        a = c(a).split(j), a.length - 1 && (b = d(a[1]), e = d(a[2]), f = d(a[3])), a = d(a[0]), b == null && (b = a), f == null && (e = f);
        if (e == null || f == null) var g = this.getBBox(1);
        e = e == null ? g.x + g.width / 2 : e, f = f == null ? g.y + g.height / 2 : f, this.transform(this._.transform.concat([
            ["s", a, b, e, f]
        ]));
        return this
    }, A.translate = function (a, b) {
        if (this.removed) return this;
        a = c(a).split(j), a.length - 1 && (b = d(a[1])), a = d(a[0]) || 0, b = +b || 0, this.transform(this._.transform.concat([
            ["t", a, b]
        ]));
        return this
    }, A.transform = function (c) {
        var d = this._;
        if (c == null) return d.transform;
        a._extractTransform(this, c), this.clip && q(this.clip, {
            transform: this.matrix.invert()
        }), this.pattern && s(this), this.node && q(this.node, {
            transform: this.matrix
        });
        if (d.sx != 1 || d.sy != 1) {
            var e = this.attrs[b]("stroke-width") ? this.attrs["stroke-width"] : 1;
            this.attr({
                "stroke-width": e
            })
        }
        return this
    }, A.hide = function () {
        !this.removed && this.paper.safari(this.node.style.display = "none");
        return this
    }, A.show = function () {
        !this.removed && this.paper.safari(this.node.style.display = "");
        return this
    }, A.remove = function () {
        if (!this.removed) {
            var b = this.paper;
            b.__set__ && b.__set__.exclude(this), k.unbind("*.*." + this.id), this.gradient && b.defs.removeChild(this.gradient), a._tear(this, b), this.node.parentNode.removeChild(this.node);
            for (var c in this) this[c] = typeof this[c] == "function" ? a._removedFactory(c) : null;
            this.removed = !0
        }
    }, A._getBBox = function () {
        if (this.node.style.display == "none") {
            this.show();
            var a = !0
        }
        var b = {};
        try {
            b = this.node.getBBox()
        } catch (c) {} finally {
            b = b || {}
        }
        a && this.hide();
        return b
    }, A.attr = function (c, d) {
        if (this.removed) return this;
        if (c == null) {
            var e = {};
            for (var f in this.attrs) this.attrs[b](f) && (e[f] = this.attrs[f]);
            e.gradient && e.fill == "none" && (e.fill = e.gradient) && delete e.gradient, e.transform = this._.transform;
            return e
        }
        if (d == null && a.is(c, "string")) {
            if (c == "fill" && this.attrs.fill == "none" && this.attrs.gradient) return this.attrs.gradient;
            if (c == "transform") return this._.transform;
            var g = c.split(j),
                h = {};
            for (var i = 0, l = g.length; i < l; i++) c = g[i], c in this.attrs ? h[c] = this.attrs[c] : a.is(this.paper.customAttributes[c], "function") ? h[c] = this.paper.customAttributes[c].def : h[c] = a._availableAttrs[c];
            return l - 1 ? h : h[g[0]]
        }
        if (d == null && a.is(c, "array")) {
            h = {};
            for (i = 0, l = c.length; i < l; i++) h[c[i]] = this.attr(c[i]);
            return h
        }
        if (d != null) {
            var m = {};
            m[c] = d
        } else c != null && a.is(c, "object") && (m = c);
        for (var n in m) k("attr." + n + "." + this.id, this, m[n]);
        for (n in this.paper.customAttributes) if (this.paper.customAttributes[b](n) && m[b](n) && a.is(this.paper.customAttributes[n], "function")) {
            var o = this.paper.customAttributes[n].apply(this, [].concat(m[n]));
            this.attrs[n] = m[n];
            for (var p in o) o[b](p) && (m[p] = o[p])
        }
        w(this, m);
        return this
    }, A.toFront = function () {
        if (this.removed) return this;
        this.node.parentNode.tagName.toLowerCase() == "a" ? this.node.parentNode.parentNode.appendChild(this.node.parentNode) : this.node.parentNode.appendChild(this.node);
        var b = this.paper;
        b.top != this && a._tofront(this, b);
        return this
    }, A.toBack = function () {
        if (this.removed) return this;
        var b = this.node.parentNode;
        b.tagName.toLowerCase() == "a" ? b.parentNode.insertBefore(this.node.parentNode, this.node.parentNode.parentNode.firstChild) : b.firstChild != this.node && b.insertBefore(this.node, this.node.parentNode.firstChild), a._toback(this, this.paper);
        var c = this.paper;
        return this
    }, A.insertAfter = function (b) {
        if (this.removed) return this;
        var c = b.node || b[b.length - 1].node;
        c.nextSibling ? c.parentNode.insertBefore(this.node, c.nextSibling) : c.parentNode.appendChild(this.node), a._insertafter(this, b, this.paper);
        return this
    }, A.insertBefore = function (b) {
        if (this.removed) return this;
        var c = b.node || b[0].node;
        c.parentNode.insertBefore(this.node, c), a._insertbefore(this, b, this.paper);
        return this
    }, A.blur = function (b) {
        var c = this;
        if (+b !== 0) {
            var d = q("filter"),
                e = q("feGaussianBlur");
            c.attrs.blur = b, d.id = a.createUUID(), q(e, {
                stdDeviation: +b || 1.5
            }), d.appendChild(e), c.paper.defs.appendChild(d), c._blur = d, q(c.node, {
                filter: "url(#" + d.id + ")"
            })
        } else c._blur && (c._blur.parentNode.removeChild(c._blur), delete c._blur, delete c.attrs.blur), c.node.removeAttribute("filter")
    }, a._engine.circle = function (a, b, c, d) {
        var e = q("circle");
        a.canvas && a.canvas.appendChild(e);
        var f = new z(e, a);
        f.attrs = {
            cx: b,
            cy: c,
            r: d,
            fill: "none",
            stroke: "#000"
        }, f.type = "circle", q(e, f.attrs);
        return f
    }, a._engine.rect = function (a, b, c, d, e, f) {
        var g = q("rect");
        a.canvas && a.canvas.appendChild(g);
        var h = new z(g, a);
        h.attrs = {
            x: b,
            y: c,
            width: d,
            height: e,
            r: f || 0,
            rx: f || 0,
            ry: f || 0,
            fill: "none",
            stroke: "#000"
        }, h.type = "rect", q(g, h.attrs);
        return h
    }, a._engine.ellipse = function (a, b, c, d, e) {
        var f = q("ellipse");
        a.canvas && a.canvas.appendChild(f);
        var g = new z(f, a);
        g.attrs = {
            cx: b,
            cy: c,
            rx: d,
            ry: e,
            fill: "none",
            stroke: "#000"
        }, g.type = "ellipse", q(f, g.attrs);
        return g
    }, a._engine.image = function (a, b, c, d, e, f) {
        var g = q("image");
        q(g, {
            x: c,
            y: d,
            width: e,
            height: f,
            preserveAspectRatio: "none"
        }), g.setAttributeNS(n, "href", b), a.canvas && a.canvas.appendChild(g);
        var h = new z(g, a);
        h.attrs = {
            x: c,
            y: d,
            width: e,
            height: f,
            src: b
        }, h.type = "image";
        return h
    }, a._engine.text = function (b, c, d, e) {
        var f = q("text");
        b.canvas && b.canvas.appendChild(f);
        var g = new z(f, b);
        g.attrs = {
            x: c,
            y: d,
            "text-anchor": "middle",
            text: e,
            font: a._availableAttrs.font,
            stroke: "none",
            fill: "#000"
        }, g.type = "text", w(g, g.attrs);
        return g
    }, a._engine.setSize = function (a, b) {
        this.width = a || this.width, this.height = b || this.height, this.canvas.setAttribute("width", this.width), this.canvas.setAttribute("height", this.height), this._viewBox && this.setViewBox.apply(this, this._viewBox);
        return this
    }, a._engine.create = function () {
        var b = a._getContainer.apply(0, arguments),
            c = b && b.container,
            d = b.x,
            e = b.y,
            f = b.width,
            g = b.height;
        if (!c) throw new Error("SVG container not found.");
        var h = q("svg"),
            i = "overflow:hidden;",
            j;
        d = d || 0, e = e || 0, f = f || 512, g = g || 342, q(h, {
            height: g,
            version: 1.1,
            width: f,
            xmlns: "http://www.w3.org/2000/svg"
        }), c == 1 ? (h.style.cssText = i + "position:absolute;left:" + d + "px;top:" + e + "px", a._g.doc.body.appendChild(h), j = 1) : (h.style.cssText = i + "position:relative", c.firstChild ? c.insertBefore(h, c.firstChild) : c.appendChild(h)), c = new a._Paper, c.width = f, c.height = g, c.canvas = h, c.clear(), c._left = c._top = 0, j && (c.renderfix = function () {}), c.renderfix();
        return c
    }, a._engine.setViewBox = function (a, b, c, d, e) {
        k("setViewBox", this, this._viewBox, [a, b, c, d, e]);
        var f = g(c / this.width, d / this.height),
            h = this.top,
            i = e ? "meet" : "xMinYMin",
            j, l;
        a == null ? (this._vbSize && (f = 1), delete this._vbSize, j = "0 0 " + this.width + m + this.height) : (this._vbSize = f, j = a + m + b + m + c + m + d), q(this.canvas, {
            viewBox: j,
            preserveAspectRatio: i
        });
        while (f && h) l = "stroke-width" in h.attrs ? h.attrs["stroke-width"] : 1, h.attr({
            "stroke-width": l
        }), h._.dirty = 1, h._.dirtyT = 1, h = h.prev;
        this._viewBox = [a, b, c, d, !! e];
        return this
    }, a.prototype.renderfix = function () {
        var a = this.canvas,
            b = a.style,
            c;
        try {
            c = a.getScreenCTM() || a.createSVGMatrix()
        } catch (d) {
            c = a.createSVGMatrix()
        }
        var e = -c.e % 1,
            f = -c.f % 1;
        if (e || f) e && (this._left = (this._left + e) % 1, b.left = this._left + "px"), f && (this._top = (this._top + f) % 1, b.top = this._top + "px")
    }, a.prototype.clear = function () {
        a.eve("clear", this);
        var b = this.canvas;
        while (b.firstChild) b.removeChild(b.firstChild);
        this.bottom = this.top = null, (this.desc = q("desc")).appendChild(a._g.doc.createTextNode("Created with Rapha�l " + a.version)), b.appendChild(this.desc), b.appendChild(this.defs = q("defs"))
    }, a.prototype.remove = function () {
        k("remove", this), this.canvas.parentNode && this.canvas.parentNode.removeChild(this.canvas);
        for (var b in this) this[b] = typeof this[b] == "function" ? a._removedFactory(b) : null
    };
    var B = a.st;
    for (var C in A) A[b](C) && !B[b](C) && (B[C] = function (a) {
        return function () {
            var b = arguments;
            return this.forEach(function (c) {
                c[a].apply(c, b)
            })
        }
    }(C))
}(window.Raphael), window.Raphael.vml && function (a) {
    var b = "hasOwnProperty",
        c = String,
        d = parseFloat,
        e = Math,
        f = e.round,
        g = e.max,
        h = e.min,
        i = e.abs,
        j = "fill",
        k = /[, ]+/,
        l = a.eve,
        m = " progid:DXImageTransform.Microsoft",
        n = " ",
        o = "",
        p = {
            M: "m",
            L: "l",
            C: "c",
            Z: "x",
            m: "t",
            l: "r",
            c: "v",
            z: "x"
        }, q = /([clmz]),?([^clmz]*)/gi,
        r = / progid:\S+Blur\([^\)]+\)/g,
        s = /-?[^,\s-]+/g,
        t = "position:absolute;left:0;top:0;width:1px;height:1px",
        u = 21600,
        v = {
            path: 1,
            rect: 1,
            image: 1
        }, w = {
            circle: 1,
            ellipse: 1
        }, x = function (b) {
            var d = /[ahqstv]/ig,
                e = a._pathToAbsolute;
            c(b).match(d) && (e = a._path2curve), d = /[clmz]/g;
            if (e == a._pathToAbsolute && !c(b).match(d)) {
                var g = c(b).replace(q, function (a, b, c) {
                    var d = [],
                        e = b.toLowerCase() == "m",
                        g = p[b];
                    c.replace(s, function (a) {
                        e && d.length == 2 && (g += d + p[b == "m" ? "l" : "L"], d = []), d.push(f(a * u))
                    });
                    return g + d
                });
                return g
            }
            var h = e(b),
                i, j;
            g = [];
            for (var k = 0, l = h.length; k < l; k++) {
                i = h[k], j = h[k][0].toLowerCase(), j == "z" && (j = "x");
                for (var m = 1, r = i.length; m < r; m++) j += f(i[m] * u) + (m != r - 1 ? "," : o);
                g.push(j)
            }
            return g.join(n)
        }, y = function (b, c, d) {
            var e = a.matrix();
            e.rotate(-b, .5, .5);
            return {
                dx: e.x(c, d),
                dy: e.y(c, d)
            }
        }, z = function (a, b, c, d, e, f) {
            var g = a._,
                h = a.matrix,
                k = g.fillpos,
                l = a.node,
                m = l.style,
                o = 1,
                p = "",
                q, r = u / b,
                s = u / c;
            m.visibility = "hidden";
            if ( !! b && !! c) {
                l.coordsize = i(r) + n + i(s), m.rotation = f * (b * c < 0 ? -1 : 1);
                if (f) {
                    var t = y(f, d, e);
                    d = t.dx, e = t.dy
                }
                b < 0 && (p += "x"), c < 0 && (p += " y") && (o = -1), m.flip = p, l.coordorigin = d * -r + n + e * -s;
                if (k || g.fillsize) {
                    var v = l.getElementsByTagName(j);
                    v = v && v[0], l.removeChild(v), k && (t = y(f, h.x(k[0], k[1]), h.y(k[0], k[1])), v.position = t.dx * o + n + t.dy * o), g.fillsize && (v.size = g.fillsize[0] * i(b) + n + g.fillsize[1] * i(c)), l.appendChild(v)
                }
                m.visibility = "visible"
            }
        };
    a.toString = function () {
        return "Your browser doesn�t support SVG. Falling down to VML.\nYou are running Rapha�l " + this.version
    };
    var A = function (a, b, d) {
        var e = c(b).toLowerCase().split("-"),
            f = d ? "end" : "start",
            g = e.length,
            h = "classic",
            i = "medium",
            j = "medium";
        while (g--) switch (e[g]) {
            case "block":
            case "classic":
            case "oval":
            case "diamond":
            case "open":
            case "none":
                h = e[g];
                break;
            case "wide":
            case "narrow":
                j = e[g];
                break;
            case "long":
            case "short":
                i = e[g]
        }
        var k = a.node.getElementsByTagName("stroke")[0];
        k[f + "arrow"] = h, k[f + "arrowlength"] = i, k[f + "arrowwidth"] = j
    }, B = function (e, i) {
        e.attrs = e.attrs || {};
        var l = e.node,
            m = e.attrs,
            p = l.style,
            q, r = v[e.type] && (i.x != m.x || i.y != m.y || i.width != m.width || i.height != m.height || i.cx != m.cx || i.cy != m.cy || i.rx != m.rx || i.ry != m.ry || i.r != m.r),
            s = w[e.type] && (m.cx != i.cx || m.cy != i.cy || m.r != i.r || m.rx != i.rx || m.ry != i.ry),
            t = e;
        for (var y in i) i[b](y) && (m[y] = i[y]);
        r && (m.path = a._getPath[e.type](e), e._.dirty = 1), i.href && (l.href = i.href), i.title && (l.title = i.title), i.target && (l.target = i.target), i.cursor && (p.cursor = i.cursor), "blur" in i && e.blur(i.blur);
        if (i.path && e.type == "path" || r) l.path = x(~c(m.path).toLowerCase().indexOf("r") ? a._pathToAbsolute(m.path) : m.path), e.type == "image" && (e._.fillpos = [m.x, m.y], e._.fillsize = [m.width, m.height], z(e, 1, 1, 0, 0, 0));
        "transform" in i && e.transform(i.transform);
        if (s) {
            var B = +m.cx,
                D = +m.cy,
                E = +m.rx || +m.r || 0,
                G = +m.ry || +m.r || 0;
            l.path = a.format("ar{0},{1},{2},{3},{4},{1},{4},{1}x", f((B - E) * u), f((D - G) * u), f((B + E) * u), f((D + G) * u), f(B * u))
        }
        if ("clip-rect" in i) {
            var H = c(i["clip-rect"]).split(k);
            if (H.length == 4) {
                H[2] = +H[2] + +H[0], H[3] = +H[3] + +H[1];
                var I = l.clipRect || a._g.doc.createElement("div"),
                    J = I.style;
                J.clip = a.format("rect({1}px {2}px {3}px {0}px)", H), l.clipRect || (J.position = "absolute", J.top = 0, J.left = 0, J.width = e.paper.width + "px", J.height = e.paper.height + "px", l.parentNode.insertBefore(I, l), I.appendChild(l), l.clipRect = I)
            }
            i["clip-rect"] || l.clipRect && (l.clipRect.style.clip = "auto")
        }
        if (e.textpath) {
            var K = e.textpath.style;
            i.font && (K.font = i.font), i["font-family"] && (K.fontFamily = '"' + i["font-family"].split(",")[0].replace(/^['"]+|['"]+$/g, o) + '"'), i["font-size"] && (K.fontSize = i["font-size"]), i["font-weight"] && (K.fontWeight = i["font-weight"]), i["font-style"] && (K.fontStyle = i["font-style"])
        }
        "arrow-start" in i && A(t, i["arrow-start"]), "arrow-end" in i && A(t, i["arrow-end"], 1);
        if (i.opacity != null || i["stroke-width"] != null || i.fill != null || i.src != null || i.stroke != null || i["stroke-width"] != null || i["stroke-opacity"] != null || i["fill-opacity"] != null || i["stroke-dasharray"] != null || i["stroke-miterlimit"] != null || i["stroke-linejoin"] != null || i["stroke-linecap"] != null) {
            var L = l.getElementsByTagName(j),
                M = !1;
            L = L && L[0], !L && (M = L = F(j)), e.type == "image" && i.src && (L.src = i.src), i.fill && (L.on = !0);
            if (L.on == null || i.fill == "none" || i.fill === null) L.on = !1;
            if (L.on && i.fill) {
                var N = c(i.fill).match(a._ISURL);
                if (N) {
                    L.parentNode == l && l.removeChild(L), L.rotate = !0, L.src = N[1], L.type = "tile";
                    var O = e.getBBox(1);
                    L.position = O.x + n + O.y, e._.fillpos = [O.x, O.y], a._preload(N[1], function () {
                        e._.fillsize = [this.offsetWidth, this.offsetHeight]
                    })
                } else L.color = a.getRGB(i.fill).hex, L.src = o, L.type = "solid", a.getRGB(i.fill).error && (t.type in {
                    circle: 1,
                    ellipse: 1
                } || c(i.fill).charAt() != "r") && C(t, i.fill, L) && (m.fill = "none", m.gradient = i.fill, L.rotate = !1)
            }
            if ("fill-opacity" in i || "opacity" in i) {
                var P = ((+m["fill-opacity"] + 1 || 2) - 1) * ((+m.opacity + 1 || 2) - 1) * ((+a.getRGB(i.fill).o + 1 || 2) - 1);
                P = h(g(P, 0), 1), L.opacity = P, L.src && (L.color = "none")
            }
            l.appendChild(L);
            var Q = l.getElementsByTagName("stroke") && l.getElementsByTagName("stroke")[0],
                T = !1;
            !Q && (T = Q = F("stroke"));
            if (i.stroke && i.stroke != "none" || i["stroke-width"] || i["stroke-opacity"] != null || i["stroke-dasharray"] || i["stroke-miterlimit"] || i["stroke-linejoin"] || i["stroke-linecap"]) Q.on = !0;
            (i.stroke == "none" || i.stroke === null || Q.on == null || i.stroke == 0 || i["stroke-width"] == 0) && (Q.on = !1);
            var U = a.getRGB(i.stroke);
            Q.on && i.stroke && (Q.color = U.hex), P = ((+m["stroke-opacity"] + 1 || 2) - 1) * ((+m.opacity + 1 || 2) - 1) * ((+U.o + 1 || 2) - 1);
            var V = (d(i["stroke-width"]) || 1) * .75;
            P = h(g(P, 0), 1), i["stroke-width"] == null && (V = m["stroke-width"]), i["stroke-width"] && (Q.weight = V), V && V < 1 && (P *= V) && (Q.weight = 1), Q.opacity = P, i["stroke-linejoin"] && (Q.joinstyle = i["stroke-linejoin"] || "miter"), Q.miterlimit = i["stroke-miterlimit"] || 8, i["stroke-linecap"] && (Q.endcap = i["stroke-linecap"] == "butt" ? "flat" : i["stroke-linecap"] == "square" ? "square" : "round");
            if (i["stroke-dasharray"]) {
                var W = {
                    "-": "shortdash",
                    ".": "shortdot",
                    "-.": "shortdashdot",
                    "-..": "shortdashdotdot",
                    ". ": "dot",
                    "- ": "dash",
                    "--": "longdash",
                    "- .": "dashdot",
                    "--.": "longdashdot",
                    "--..": "longdashdotdot"
                };
                Q.dashstyle = W[b](i["stroke-dasharray"]) ? W[i["stroke-dasharray"]] : o
            }
            T && l.appendChild(Q)
        }
        if (t.type == "text") {
            t.paper.canvas.style.display = o;
            var X = t.paper.span,
                Y = 100,
                Z = m.font && m.font.match(/\d+(?:\.\d*)?(?=px)/);
            p = X.style, m.font && (p.font = m.font), m["font-family"] && (p.fontFamily = m["font-family"]), m["font-weight"] && (p.fontWeight = m["font-weight"]), m["font-style"] && (p.fontStyle = m["font-style"]), Z = d(m["font-size"] || Z && Z[0]) || 10, p.fontSize = Z * Y + "px", t.textpath.string && (X.innerHTML = c(t.textpath.string).replace(/</g, "&#60;").replace(/&/g, "&#38;").replace(/\n/g, "<br>"));
            var $ = X.getBoundingClientRect();
            t.W = m.w = ($.right - $.left) / Y, t.H = m.h = ($.bottom - $.top) / Y, t.X = m.x, t.Y = m.y + t.H / 2, ("x" in i || "y" in i) && (t.path.v = a.format("m{0},{1}l{2},{1}", f(m.x * u), f(m.y * u), f(m.x * u) + 1));
            var _ = ["x", "y", "text", "font", "font-family", "font-weight", "font-style", "font-size"];
            for (var ba = 0, bb = _.length; ba < bb; ba++) if (_[ba] in i) {
                t._.dirty = 1;
                break
            }
            switch (m["text-anchor"]) {
                case "start":
                    t.textpath.style["v-text-align"] = "left", t.bbx = t.W / 2;
                    break;
                case "end":
                    t.textpath.style["v-text-align"] = "right", t.bbx = -t.W / 2;
                    break;
                default:
                    t.textpath.style["v-text-align"] = "center", t.bbx = 0
            }
            t.textpath.style["v-text-kern"] = !0
        }
    }, C = function (b, f, g) {
        b.attrs = b.attrs || {};
        var h = b.attrs,
            i = Math.pow,
            j, k, l = "linear",
            m = ".5 .5";
        b.attrs.gradient = f, f = c(f).replace(a._radial_gradient, function (a, b, c) {
            l = "radial", b && c && (b = d(b), c = d(c), i(b - .5, 2) + i(c - .5, 2) > .25 && (c = e.sqrt(.25 - i(b - .5, 2)) * ((c > .5) * 2 - 1) + .5), m = b + n + c);
            return o
        }), f = f.split(/\s*\-\s*/);
        if (l == "linear") {
            var p = f.shift();
            p = -d(p);
            if (isNaN(p)) return null
        }
        var q = a._parseDots(f);
        if (!q) return null;
        b = b.shape || b.node;
        if (q.length) {
            b.removeChild(g), g.on = !0, g.method = "none", g.color = q[0].color, g.color2 = q[q.length - 1].color;
            var r = [];
            for (var s = 0, t = q.length; s < t; s++) q[s].offset && r.push(q[s].offset + n + q[s].color);
            g.colors = r.length ? r.join() : "0% " + g.color, l == "radial" ? (g.type = "gradientTitle", g.focus = "100%", g.focussize = "0 0", g.focusposition = m, g.angle = 0) : (g.type = "gradient", g.angle = (270 - p) % 360), b.appendChild(g)
        }
        return 1
    }, D = function (b, c) {
        this[0] = this.node = b, b.raphael = !0, this.id = a._oid++, b.raphaelid = this.id, this.X = 0, this.Y = 0, this.attrs = {}, this.paper = c, this.matrix = a.matrix(), this._ = {
            transform: [],
            sx: 1,
            sy: 1,
            dx: 0,
            dy: 0,
            deg: 0,
            dirty: 1,
            dirtyT: 1
        }, !c.bottom && (c.bottom = this), this.prev = c.top, c.top && (c.top.next = this), c.top = this, this.next = null
    }, E = a.el;
    D.prototype = E, E.constructor = D, E.transform = function (b) {
        if (b == null) return this._.transform;
        var d = this.paper._viewBoxShift,
            e = d ? "s" + [d.scale, d.scale] + "-1-1t" + [d.dx, d.dy] : o,
            f;
        d && (f = b = c(b).replace(/\.{3}|\u2026/g, this._.transform || o)), a._extractTransform(this, e + b);
        var g = this.matrix.clone(),
            h = this.skew,
            i = this.node,
            j, k = ~c(this.attrs.fill).indexOf("-"),
            l = !c(this.attrs.fill).indexOf("url(");
        g.translate(-0.5, -0.5);
        if (l || k || this.type == "image") {
            h.matrix = "1 0 0 1", h.offset = "0 0", j = g.split();
            if (k && j.noRotation || !j.isSimple) {
                i.style.filter = g.toFilter();
                var m = this.getBBox(),
                    p = this.getBBox(1),
                    q = m.x - p.x,
                    r = m.y - p.y;
                i.coordorigin = q * -u + n + r * -u, z(this, 1, 1, q, r, 0)
            } else i.style.filter = o, z(this, j.scalex, j.scaley, j.dx, j.dy, j.rotate)
        } else i.style.filter = o, h.matrix = c(g), h.offset = g.offset();
        f && (this._.transform = f);
        return this
    }, E.rotate = function (a, b, e) {
        if (this.removed) return this;
        if (a != null) {
            a = c(a).split(k), a.length - 1 && (b = d(a[1]), e = d(a[2])), a = d(a[0]), e == null && (b = e);
            if (b == null || e == null) {
                var f = this.getBBox(1);
                b = f.x + f.width / 2, e = f.y + f.height / 2
            }
            this._.dirtyT = 1, this.transform(this._.transform.concat([
                ["r", a, b, e]
            ]));
            return this
        }
    }, E.translate = function (a, b) {
        if (this.removed) return this;
        a = c(a).split(k), a.length - 1 && (b = d(a[1])), a = d(a[0]) || 0, b = +b || 0, this._.bbox && (this._.bbox.x += a, this._.bbox.y += b), this.transform(this._.transform.concat([
            ["t", a, b]
        ]));
        return this
    }, E.scale = function (a, b, e, f) {
        if (this.removed) return this;
        a = c(a).split(k), a.length - 1 && (b = d(a[1]), e = d(a[2]), f = d(a[3]), isNaN(e) && (e = null), isNaN(f) && (f = null)), a = d(a[0]), b == null && (b = a), f == null && (e = f);
        if (e == null || f == null) var g = this.getBBox(1);
        e = e == null ? g.x + g.width / 2 : e, f = f == null ? g.y + g.height / 2 : f, this.transform(this._.transform.concat([
            ["s", a, b, e, f]
        ])), this._.dirtyT = 1;
        return this
    }, E.hide = function () {
        !this.removed && (this.node.style.display = "none");
        return this
    }, E.show = function () {
        !this.removed && (this.node.style.display = o);
        return this
    }, E._getBBox = function () {
        if (this.removed) return {};
        return {
            x: this.X + (this.bbx || 0) - this.W / 2,
            y: this.Y - this.H,
            width: this.W,
            height: this.H
        }
    }, E.remove = function () {
        if (!this.removed) {
            this.paper.__set__ && this.paper.__set__.exclude(this), a.eve.unbind("*.*." + this.id), a._tear(this, this.paper), this.node.parentNode.removeChild(this.node), this.shape && this.shape.parentNode.removeChild(this.shape);
            for (var b in this) this[b] = typeof this[b] == "function" ? a._removedFactory(b) : null;
            this.removed = !0
        }
    }, E.attr = function (c, d) {
        if (this.removed) return this;
        if (c == null) {
            var e = {};
            for (var f in this.attrs) this.attrs[b](f) && (e[f] = this.attrs[f]);
            e.gradient && e.fill == "none" && (e.fill = e.gradient) && delete e.gradient, e.transform = this._.transform;
            return e
        }
        if (d == null && a.is(c, "string")) {
            if (c == j && this.attrs.fill == "none" && this.attrs.gradient) return this.attrs.gradient;
            var g = c.split(k),
                h = {};
            for (var i = 0, m = g.length; i < m; i++) c = g[i], c in this.attrs ? h[c] = this.attrs[c] : a.is(this.paper.customAttributes[c], "function") ? h[c] = this.paper.customAttributes[c].def : h[c] = a._availableAttrs[c];
            return m - 1 ? h : h[g[0]]
        }
        if (this.attrs && d == null && a.is(c, "array")) {
            h = {};
            for (i = 0, m = c.length; i < m; i++) h[c[i]] = this.attr(c[i]);
            return h
        }
        var n;
        d != null && (n = {}, n[c] = d), d == null && a.is(c, "object") && (n = c);
        for (var o in n) l("attr." + o + "." + this.id, this, n[o]);
        if (n) {
            for (o in this.paper.customAttributes) if (this.paper.customAttributes[b](o) && n[b](o) && a.is(this.paper.customAttributes[o], "function")) {
                var p = this.paper.customAttributes[o].apply(this, [].concat(n[o]));
                this.attrs[o] = n[o];
                for (var q in p) p[b](q) && (n[q] = p[q])
            }
            n.text && this.type == "text" && (this.textpath.string = n.text), B(this, n)
        }
        return this
    }, E.toFront = function () {
        !this.removed && this.node.parentNode.appendChild(this.node), this.paper && this.paper.top != this && a._tofront(this, this.paper);
        return this
    }, E.toBack = function () {
        if (this.removed) return this;
        this.node.parentNode.firstChild != this.node && (this.node.parentNode.insertBefore(this.node, this.node.parentNode.firstChild), a._toback(this, this.paper));
        return this
    }, E.insertAfter = function (b) {
        if (this.removed) return this;
        b.constructor == a.st.constructor && (b = b[b.length - 1]), b.node.nextSibling ? b.node.parentNode.insertBefore(this.node, b.node.nextSibling) : b.node.parentNode.appendChild(this.node), a._insertafter(this, b, this.paper);
        return this
    }, E.insertBefore = function (b) {
        if (this.removed) return this;
        b.constructor == a.st.constructor && (b = b[0]), b.node.parentNode.insertBefore(this.node, b.node), a._insertbefore(this, b, this.paper);
        return this
    }, E.blur = function (b) {
        var c = this.node.runtimeStyle,
            d = c.filter;
        d = d.replace(r, o), +b !== 0 ? (this.attrs.blur = b, c.filter = d + n + m + ".Blur(pixelradius=" + (+b || 1.5) + ")", c.margin = a.format("-{0}px 0 0 -{0}px", f(+b || 1.5))) : (c.filter = d, c.margin = 0, delete this.attrs.blur)
    }, a._engine.path = function (a, b) {
        var c = F("shape");
        c.style.cssText = t, c.coordsize = u + n + u, c.coordorigin = b.coordorigin;
        var d = new D(c, b),
            e = {
                fill: "none",
                stroke: "#000"
            };
        a && (e.path = a), d.type = "path", d.path = [], d.Path = o, B(d, e), b.canvas.appendChild(c);
        var f = F("skew");
        f.on = !0, c.appendChild(f), d.skew = f, d.transform(o);
        return d
    }, a._engine.rect = function (b, c, d, e, f, g) {
        var h = a._rectPath(c, d, e, f, g),
            i = b.path(h),
            j = i.attrs;
        i.X = j.x = c, i.Y = j.y = d, i.W = j.width = e, i.H = j.height = f, j.r = g, j.path = h, i.type = "rect";
        return i
    }, a._engine.ellipse = function (a, b, c, d, e) {
        var f = a.path(),
            g = f.attrs;
        f.X = b - d, f.Y = c - e, f.W = d * 2, f.H = e * 2, f.type = "ellipse", B(f, {
            cx: b,
            cy: c,
            rx: d,
            ry: e
        });
        return f
    }, a._engine.circle = function (a, b, c, d) {
        var e = a.path(),
            f = e.attrs;
        e.X = b - d, e.Y = c - d, e.W = e.H = d * 2, e.type = "circle", B(e, {
            cx: b,
            cy: c,
            r: d
        });
        return e
    }, a._engine.image = function (b, c, d, e, f, g) {
        var h = a._rectPath(d, e, f, g),
            i = b.path(h).attr({
                stroke: "none"
            }),
            k = i.attrs,
            l = i.node,
            m = l.getElementsByTagName(j)[0];
        k.src = c, i.X = k.x = d, i.Y = k.y = e, i.W = k.width = f, i.H = k.height = g, k.path = h, i.type = "image", m.parentNode == l && l.removeChild(m), m.rotate = !0, m.src = c, m.type = "tile", i._.fillpos = [d, e], i._.fillsize = [f, g], l.appendChild(m), z(i, 1, 1, 0, 0, 0);
        return i
    }, a._engine.text = function (b, d, e, g) {
        var h = F("shape"),
            i = F("path"),
            j = F("textpath");
        d = d || 0, e = e || 0, g = g || "", i.v = a.format("m{0},{1}l{2},{1}", f(d * u), f(e * u), f(d * u) + 1), i.textpathok = !0, j.string = c(g), j.on = !0, h.style.cssText = t, h.coordsize = u + n + u, h.coordorigin = "0 0";
        var k = new D(h, b),
            l = {
                fill: "#000",
                stroke: "none",
                font: a._availableAttrs.font,
                text: g
            };
        k.shape = h, k.path = i, k.textpath = j, k.type = "text", k.attrs.text = c(g), k.attrs.x = d, k.attrs.y = e, k.attrs.w = 1, k.attrs.h = 1, B(k, l), h.appendChild(j), h.appendChild(i), b.canvas.appendChild(h);
        var m = F("skew");
        m.on = !0, h.appendChild(m), k.skew = m, k.transform(o);
        return k
    }, a._engine.setSize = function (b, c) {
        var d = this.canvas.style;
        this.width = b, this.height = c, b == +b && (b += "px"), c == +c && (c += "px"), d.width = b, d.height = c, d.clip = "rect(0 " + b + " " + c + " 0)", this._viewBox && a._engine.setViewBox.apply(this, this._viewBox);
        return this
    }, a._engine.setViewBox = function (b, c, d, e, f) {
        a.eve("setViewBox", this, this._viewBox, [b, c, d, e, f]);
        var h = this.width,
            i = this.height,
            j = 1 / g(d / h, e / i),
            k, l;
        f && (k = i / e, l = h / d, d * k < h && (b -= (h - d * k) / 2 / k), e * l < i && (c -= (i - e * l) / 2 / l)), this._viewBox = [b, c, d, e, !! f], this._viewBoxShift = {
            dx: -b,
            dy: -c,
            scale: j
        }, this.forEach(function (a) {
            a.transform("...")
        });
        return this
    };
    var F;
    a._engine.initWin = function (a) {
        var b = a.document;
        b.createStyleSheet().addRule(".rvml", "behavior:url(#default#VML)");
        try {
            !b.namespaces.rvml && b.namespaces.add("rvml", "urn:schemas-microsoft-com:vml"), F = function (a) {
                return b.createElement("<rvml:" + a + ' class="rvml">')
            }
        } catch (c) {
            F = function (a) {
                return b.createElement("<" + a + ' xmlns="urn:schemas-microsoft.com:vml" class="rvml">')
            }
        }
    }, a._engine.initWin(a._g.win), a._engine.create = function () {
        var b = a._getContainer.apply(0, arguments),
            c = b.container,
            d = b.height,
            e, f = b.width,
            g = b.x,
            h = b.y;
        if (!c) throw new Error("VML container not found.");
        var i = new a._Paper,
            j = i.canvas = a._g.doc.createElement("div"),
            k = j.style;
        g = g || 0, h = h || 0, f = f || 512, d = d || 342, i.width = f, i.height = d, f == +f && (f += "px"), d == +d && (d += "px"), i.coordsize = u * 1e3 + n + u * 1e3, i.coordorigin = "0 0", i.span = a._g.doc.createElement("span"), i.span.style.cssText = "position:absolute;left:-9999em;top:-9999em;padding:0;margin:0;line-height:1;", j.appendChild(i.span), k.cssText = a.format("top:0;left:0;width:{0};height:{1};display:inline-block;position:relative;clip:rect(0 {0} {1} 0);overflow:hidden", f, d), c == 1 ? (a._g.doc.body.appendChild(j), k.left = g + "px", k.top = h + "px", k.position = "absolute") : c.firstChild ? c.insertBefore(j, c.firstChild) : c.appendChild(j), i.renderfix = function () {};
        return i
    }, a.prototype.clear = function () {
        a.eve("clear", this), this.canvas.innerHTML = o, this.span = a._g.doc.createElement("span"), this.span.style.cssText = "position:absolute;left:-9999em;top:-9999em;padding:0;margin:0;line-height:1;display:inline;", this.canvas.appendChild(this.span), this.bottom = this.top = null
    }, a.prototype.remove = function () {
        a.eve("remove", this), this.canvas.parentNode.removeChild(this.canvas);
        for (var b in this) this[b] = typeof this[b] == "function" ? a._removedFactory(b) : null;
        return !0
    };
    var G = a.st;
    for (var H in E) E[b](H) && !G[b](H) && (G[H] = function (a) {
        return function () {
            var b = arguments;
            return this.forEach(function (c) {
                c[a].apply(c, b)
            })
        }
    }(H))
}(window.Raphael);
(function (a) {
    a.fn.extend({
        wijContent: function (a) {
            return this.each(function () {
                this.innerHTML = '<iframe frameborder="0" style="width: 100%; height: 100%;" src="' + a + '">"'
            })
        },
        wijAddVisibilityObserver: function (c, b) {
            return this.each(function () {
                a(this).addClass("wijmo-wijobserver-visibility");
                a(this).bind("wijmovisibilitychanged" + (b ? "." + b : ""), c)
            })
        },
        wijRemoveVisibilityObserver: function (b) {
            return this.each(function () {
                a(this).removeClass("wijmo-wijobserver-visibility");
                if (!b) a(this).unbind("wijmovisibilitychanged");
                else if (jQuery.isFunction(b)) a(this).unbind("wijmovisibilitychanged", b);
                else a(this).unbind("wijmovisibilitychanged." + b)
            })
        },
        wijTriggerVisibility: function () {
            return this.each(function () {
                var b = a(this);
                b.hasClass("wijmo-wijobserver-visibility") && b.trigger("wijmovisibilitychanged");
                b.find(".wijmo-wijobserver-visibility").trigger("wijmovisibilitychanged")
            })
        }
    });
    var b = function (a) {
        return isNaN(a) ? 0 : a
    };
    a.fn.leftBorderWidth = function () {
        var d = parseFloat(a(this).css("borderLeftWidth")),
            e = parseFloat(a(this).css("padding-left")),
            c = 0;
        if (a(this).css("margin-left") != "auto") c = parseFloat(a(this).css("margin-left"));
        return b(d) + b(e) + b(c)
    };
    a.fn.rightBorderWidth = function () {
        var d = parseFloat(a(this).css("borderRightWidth")),
            e = parseFloat(a(this).css("padding-right")),
            c = 0;
        if (a(this).css("margin-right") != "auto") c = parseFloat(a(this).css("margin-right"));
        return b(d) + b(e) + b(c)
    };
    a.fn.topBorderWidth = function () {
        var d = parseFloat(a(this).css("borderTopWidth")),
            e = parseFloat(a(this).css("padding-top")),
            c = 0;
        if (a(this).css("margin-top") != "auto") c = parseFloat(a(this).css("margin-top"));
        return b(d) + b(e) + b(c)
    };
    a.fn.bottomBorderWidth = function () {
        var d = parseFloat(a(this).css("borderBottomWidth")),
            e = parseFloat(a(this).css("padding-bottom")),
            c = 0;
        if (a(this).css("margin-bottom") != "auto") c = parseFloat(a(this).css("margin-bottom"));
        return b(d) + b(e) + b(c)
    };
    a.fn.borderSize = function () {
        var c = a(this).leftBorderWidth() + a(this).rightBorderWidth(),
            b = a(this).topBorderWidth() + a(this).bottomBorderWidth(),
            d = {
                width: c,
                height: b
            };
        return d
    };
    a.fn.setOutWidth = function (b) {
        var c = a(this).leftBorderWidth() + a(this).rightBorderWidth();
        a(this).width(b - c);
        return this
    };
    a.fn.setOutHeight = function (b) {
        var c = a(this).topBorderWidth() + a(this).bottomBorderWidth();
        a(this).height(b - c);
        return this
    };
    a.fn.getWidget = function () {
        var a = this.data("widgetName");
        return a && a != "" ? this.data(a) : null
    };
    a.fn.wijshow = function (c, e, g, f, d) {
        var b = c.animated || false,
            h = c.duration || 400,
            i = c.easing,
            j = c.option || {};
        f && a.isFunction(f) && f.call(this);
        if (b) {
            if (e && e[b]) {
                e[b](c, a.extend(g, {
                    complete: d
                }));
                return
            }
            if (a.effects) if (a.effects[b] || a.effects.effect && a.effects.effect[b]) {
                this.show(b, a.extend(j, {
                    easing: i
                }), h, d);
                return
            }
        }
        this.show();
        d && a.isFunction(d) && d.call(this)
    };
    a.fn.wijhide = function (c, e, g, f, d) {
        var b = c.animated || false,
            h = c.duration || 400,
            i = c.easing,
            j = c.option || {};
        f && a.isFunction(f) && f.call(this);
        if (b) {
            if (e && e[b]) {
                e[b](c, a.extend(g, {
                    complete: d
                }));
                return
            }
            if (a.effects) if (a.effects[b] || a.effects.effect && a.effects.effect[b]) {
                this.hide(b, a.extend(j, {
                    easing: i
                }), h, d);
                return
            }
        }
        this.hide();
        d && a.isFunction(d) && d.call(this)
    };
    var c = function () {};
    a.extend(c.prototype, {
        _UTFPunctuationsString: " ! \" # % & ' ( ) * , - . / : ; ? @ [ \\ ] { } \u00a1 \u00ab \u00ad \u00b7 \u00bb \u00bf \u037e \u0387 \u055a \u055b \u055c \u055d \u055e \u055f \u0589 \u058a \u05be \u05c0 \u05c3 \u05f3 \u05f4 \u060c \u061b \u061f \u066a \u066b \u066c \u066d \u06d4 \u0700 \u0701 \u0702 \u0703 \u0704 \u0705 \u0706 \u0707 \u0708 \u0709 \u070a \u070b \u070c \u070d \u0964 \u0965 \u0970 \u0df4 \u0e4f \u0e5a \u0e5b \u0f04 \u0f05 \u0f06 \u0f07 \u0f08 \u0f09 \u0f0a \u0f0b \u0f0c \u0f0d \u0f0e \u0f0f \u0f10 \u0f11 \u0f12 \u0f3a \u0f3b \u0f3c \u0f3d \u0f85 \u104a \u104b \u104c \u104d \u104e \u104f \u10fb \u1361 \u1362 \u1363 \u1364 \u1365 \u1366 \u1367 \u1368 \u166d \u166e \u169b \u169c \u16eb \u16ec \u16ed \u17d4 \u17d5 \u17d6 \u17d7 \u17d8 \u17d9 \u17da \u17dc \u1800 \u1801 \u1802 \u1803 \u1804 \u1805 \u1806 \u1807 \u1808 \u1809 \u180a \u2010 \u2011 \u2012 \u2013 \u2014 \u2015 \u2016 \u2017 \u2018 \u2019 \u201a \u201b \u201c \u201d \u201e \u201f \u2020 \u2021 \u2022 \u2023 \u2024 \u2025 \u2026 \u2027 \u2030 \u2031 \u2032 \u2033 \u2034 \u2035 \u2036 \u2037 \u2038 \u2039 \u203a \u203b \u203c \u203d \u203e \u2041 \u2042 \u2043 \u2045 \u2046 \u2048 \u2049 \u204a \u204b \u204c \u204d \u207d \u207e \u208d \u208e \u2329 \u232a \u3001 \u3002 \u3003 \u3008 \u3009 \u300a \u300b \u300c \u300d \u300e \u300f \u3010 \u3011 \u3014 \u3015 \u3016 \u3017 \u3018 \u3019 \u301a \u301b \u301c \u301d \u301e \u301f \u3030 \ufd3e \ufd3f \ufe30 \ufe31 \ufe32 \ufe35 \ufe36 \ufe37 \ufe38 \ufe39 \ufe3a \ufe3b \ufe3c \ufe3d \ufe3e \ufe3f \ufe40 \ufe41 \ufe42 \ufe43 \ufe44 \ufe49 \ufe4a \ufe4b \ufe4c \ufe50 \ufe51 \ufe52 \ufe54 \ufe55 \ufe56 \ufe57 \ufe58 \ufe59 \ufe5a \ufe5b \ufe5c \ufe5d \ufe5e \ufe5f \ufe60 \ufe61 \ufe63 \ufe68 \ufe6a \ufe6b \uff01 \uff02 \uff03 \uff05 \uff06 \uff07 \uff08 \uff09 \uff0a \uff0c \uff0d \uff0e \uff0f \uff1a \uff1b \uff1f \uff20 \uff3b \uff3c \uff3d \uff5b \uff5d \uff61 \uff62 \uff63 \uff64';this.UTFWhitespacesString_='\t \13 \f \37   \u00a0 \u1680 \u2000 \u2001 \u2002 \u2003 \u2004 \u2005 \u2006 \u2007 \u2008 \u2009 \u200a \u200b \u2028 \u202f \u3000",
        isDigit: function (b) {
            var a = b.charCodeAt(0);
            return a >= 48 && a < 58 || a >= 65296 && a < 65306
        },
        isLetter: function (a) {
            return !!(a + "").match(new RegExp("[A-Za-z\u00aa\u00b5\u00ba\u00c0-\u00d6\u00d8-\u00f6\u00f8-\u021f\u0222-\u0233\u0250-\u02ad\u02b0-\u02b8\u02bb-\u02c1\u02d0\u02d1\u02e0-\u02e4\u02ee\u037a\u0386\u0388-\u038a\u038c\u038e-\u03a1\u03a3-\u03ce\u03d0-\u03d7\u03da-\u03f3\u0400-\u0481\u048c-\u04c4\u04c7\u04c8\u04cb\u04cc\u04d0-\u04f5\u04f8\u04f9\u0531-\u0556\u0559\u0561-\u0587\u05d0-\u05ea\u05f0-\u05f2\u0621-\u063a\u0640-\u064a\u0671-\u06d3\u06d5\u06e5\u06e6\u06fa-\u06fc\u0710\u0712-\u072c\u0780-\u07a5\u0905-\u0939\u093d\u0950\u0958-\u0961\u0985-\u098c\u098f\u0990\u0993-\u09a8\u09aa-\u09b0\u09b2\u09b6-\u09b9\u09dc\u09dd\u09df-\u09e1\u09f0\u09f1\u0a05-\u0a0a\u0a0f\u0a10\u0a13-\u0a28\u0a2a-\u0a30\u0a32\u0a33\u0a35\u0a36\u0a38\u0a39\u0a59-\u0a5c\u0a5e\u0a72-\u0a74\u0a85-\u0a8b\u0a8d\u0a8f-\u0a91\u0a93-\u0aa8\u0aaa-\u0ab0\u0ab2\u0ab3\u0ab5-\u0ab9\u0abd\u0ad0\u0ae0\u0b05-\u0b0c\u0b0f\u0b10\u0b13-\u0b28\u0b2a-\u0b30\u0b32\u0b33\u0b36-\u0b39\u0b3d\u0b5c\u0b5d\u0b5f-\u0b61\u0b85-\u0b8a\u0b8e-\u0b90\u0b92-\u0b95\u0b99\u0b9a\u0b9c\u0b9e\u0b9f\u0ba3\u0ba4\u0ba8-\u0baa\u0bae-\u0bb5\u0bb7-\u0bb9\u0c05-\u0c0c\u0c0e-\u0c10\u0c12-\u0c28\u0c2a-\u0c33\u0c35-\u0c39\u0c60\u0c61\u0c85-\u0c8c\u0c8e-\u0c90\u0c92-\u0ca8\u0caa-\u0cb3\u0cb5-\u0cb9\u0cde\u0ce0\u0ce1\u0d05-\u0d0c\u0d0e-\u0d10\u0d12-\u0d28\u0d2a-\u0d39\u0d60\u0d61\u0d85-\u0d96\u0d9a-\u0db1\u0db3-\u0dbb\u0dbd\u0dc0-\u0dc6\u0e01-\u0e30\u0e32\u0e33\u0e40-\u0e46\u0e81\u0e82\u0e84\u0e87\u0e88\u0e8a\u0e8d\u0e94-\u0e97\u0e99-\u0e9f\u0ea1-\u0ea3\u0ea5\u0ea7\u0eaa\u0eab\u0ead-\u0eb0\u0eb2\u0eb3\u0ebd\u0ec0-\u0ec4\u0ec6\u0edc\u0edd\u0f00\u0f40-\u0f47\u0f49-\u0f6a\u0f88-\u0f8b\u1000-\u1021\u1023-\u1027\u1029\u102a\u1050-\u1055\u10a0-\u10c5\u10d0-\u10f6\u1100-\u1159\u115f-\u11a2\u11a8-\u11f9\u1200-\u1206\u1208-\u1246\u1248\u124a-\u124d\u1250-\u1256\u1258\u125a-\u125d\u1260-\u1286\u1288\u128a-\u128d\u1290-\u12ae\u12b0\u12b2-\u12b5\u12b8-\u12be\u12c0\u12c2-\u12c5\u12c8-\u12ce\u12d0-\u12d6\u12d8-\u12ee\u12f0-\u130e\u1310\u1312-\u1315\u1318-\u131e\u1320-\u1346\u1348-\u135a\u13a0-\u13f4\u1401-\u166c\u166f-\u1676\u1681-\u169a\u16a0-\u16ea\u1780-\u17b3\u1820-\u1877\u1880-\u18a8\u1e00-\u1e9b\u1ea0-\u1ef9\u1f00-\u1f15\u1f18-\u1f1d\u1f20-\u1f45\u1f48-\u1f4d\u1f50-\u1f57\u1f59\u1f5b\u1f5d\u1f5f-\u1f7d\u1f80-\u1fb4\u1fb6-\u1fbc\u1fbe\u1fc2-\u1fc4\u1fc6-\u1fcc\u1fd0-\u1fd3\u1fd6-\u1fdb\u1fe0-\u1fec\u1ff2-\u1ff4\u1ff6-\u1ffc\u207f\u2102\u2107\u210a-\u2113\u2115\u2119-\u211d\u2124\u2126\u2128\u212a-\u212d\u212f-\u2131\u2133-\u2139\u3005\u3006\u3031-\u3035\u3041-\u3094\u309d\u309e\u30a1-\u30fa\u30fc-\u30fe\u3105-\u312c\u3131-\u318e\u31a0-\u31b7\u3400-\u4db5\u4e00-\u9fa5\ua000-\ua48c\uac00-\ud7a3\uf900-\ufa2d\ufb00-\ufb06\ufb13-\ufb17\ufb1d\ufb1f-\ufb28\ufb2a-\ufb36\ufb38-\ufb3c\ufb3e\ufb40\ufb41\ufb43\ufb44\ufb46-\ufbb1\ufbd3-\ufd3d\ufd50-\ufd8f\ufd92-\ufdc7\ufdf0-\ufdfb\ufe70-\ufe72\ufe74\ufe76-\ufefc\uff21-\uff3a\uff41-\uff5a\uff66-\uffbe\uffc2-\uffc7\uffca-\uffcf\uffd2-\uffd7\uffda-\uffdc]"))
        },
        isLetterOrDigit: function (a) {
            return this.isLetter(a) || this.isDigit(a)
        },
        isSymbol: function (b) {
            var a = new RegExp("[$+<->^`|~\u00a2-\u00a9\u00ac\u00ae-\u00b1\u00b4\u00b6\u00b8\u00d7\u00f7\u02b9\u02ba\u02c2-\u02cf\u02d2-\u02df\u02e5-\u02ed\u0374\u0375\u0384\u0385\u0482\u06e9\u06fd\u06fe\u09f2\u09f3\u09fa\u0b70\u0e3f\u0f01-\u0f03\u0f13-\u0f17\u0f1a-\u0f1f\u0f34\u0f36\u0f38\u0fbe-\u0fc5\u0fc7-\u0fcc\u0fcf\u17db\u1fbd\u1fbf-\u1fc1\u1fcd-\u1fcf\u1fdd-\u1fdf\u1fed-\u1fef\u1ffd\u1ffe\u2044\u207a-\u207c\u208a-\u208c\u20a0-\u20af\u2100\u2101\u2103-\u2106\u2108\u2109\u2114\u2116-\u2118\u211e-\u2123\u2125\u2127\u2129\u212e\u2132\u213a\u2190-\u21f3\u2200-\u22f1\u2300-\u2328\u232b-\u237b\u237d-\u239a\u2400-\u2426\u2440-\u244a\u249c-\u24e9\u2500-\u2595\u25a0-\u25f7\u2600-\u2613\u2619-\u2671\u2701-\u2704\u2706-\u2709\u270c-\u2727\u2729-\u274b\u274d\u274f-\u2752\u2756\u2758-\u275e\u2761-\u2767\u2794\u2798-\u27af\u27b1-\u27be\u2800-\u28ff\u2e80-\u2e99\u2e9b-\u2ef3\u2f00-\u2fd5\u2ff0-\u2ffb\u3004\u3012\u3013\u3020\u3036\u3037\u303e\u303f\u309b\u309c\u3190\u3191\u3196-\u319f\u3200-\u321c\u322a-\u3243\u3260-\u327b\u327f\u328a-\u32b0\u32c0-\u32cb\u32d0-\u32fe\u3300-\u3376\u337b-\u33dd\u33e0-\u33fe\ua490-\ua4a1\ua4a4-\ua4b3\ua4b5-\ua4c0\ua4c2-\ua4c4\ua4c6\ufb29\ufe62\ufe64-\ufe66\ufe69\uff04\uff0b\uff1c-\uff1e\uff3e\uff40\uff5c\uff5e\uffe0-\uffe6\uffe8-\uffee\ufffc\ufffd]");
            return a.test(b + "")
        },
        isPunctuation: function (a) {
            return this._UTFPunctuationsString.indexOf(a) >= 0
        },
        isPrintableChar: function (a) {
            return !this.isLetterOrDigit(a) && !this.isPunctuation(a) && !this.isSymbol(a) ? a === " " : true
        },
        isAscii: function (a) {
            return a >= "!" && a <= "~"
        },
        isAsciiLetter: function (a) {
            return a >= "A" && a <= "Z" || a >= "a" && a <= "z"
        },
        isUpper: function (a) {
            return a.toUpperCase() === a
        },
        isLower: function (a) {
            return a.toLowerCase() === a
        },
        isAlphanumeric: function (a) {
            return !this.isLetter(a) ? this.isDigit(a) : true
        },
        isAciiAlphanumeric: function (a) {
            return (a < "0" || a > "9") && (a < "A" || a > "Z") ? a >= "a" ? a <= "z" : false : true
        },
        setChar: function (a, c, b) {
            return b >= a.length || b < 0 ? a : "" || a.substr(0, b) + c + a.substr(b + 1)
        }
    });
    var d = ["\n", "\r", '"', "@", "+", "'", "<", ">", "%", "{", "}"],
        e = ["!ESC!NN!", "!ESC!RR!", "!ESC!01!", "!ESC!02!", "!ESC!03!", "!ESC!04!", "!ESC!05!", "!ESC!06!", "!ESC!07!", "!ESC!08!", "!ESC!09!"],
        f = ["(\n)", "(\r)", '(")', "(@)", "(\\+)", "(')", "(\\<)", "(\\>)", "(%)", "(\\{)", "(\\})"];
    !a.wij && a.extend({
        wij: {
            charValidator: new c,
            encodeString: function (b) {
                for (var a = 0; a < d.lemgth; a++) {
                    var c = /c__escapeArr3[i]/g;
                    b = b.replace(c, e[a])
                }
                return b
            },
            decodeString: function (a) {
                if (a === "") return;
                for (var b = 0; b < e.length; b++) {
                    var c = /c__escapeArr2[i]/g;
                    a = a.replace(c, d[b])
                }
                return a
            }
        }
    })
})(jQuery);
__wijReadOptionEvents = function (c, b) {
    for (var a = 0; a < c.length; a++) b.options[c[a]] != null && b.element.bind(c[a], b.options[c[a]]);
    for (a in b.options) if (a.indexOf(" ") != -1) for (var e = a.split(" "), d = 0; d < e.length; d++) e[d].length > 0 && b.element.bind(e[d], b.options[a])
};

function wijmoASPNetParseOptionsReviewer(d, c) {
    var a, b = d[c],
        e;
    if (b) switch (typeof b) {
        case "string":
            a = /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*)?):(\d{3})Z$/.exec(b);
            if (a) {
                e = new Date(+a[1], +a[2] - 1, +a[3], +a[4], +a[5], +a[6], +a[7]);
                e.setFullYear(+a[1]);
                d[c] = e
            }
            break;
        case "object":
            if (b.needQuotes !== undefined && b.valueString !== undefined) if (!b.needQuotes) d[c] = eval(b.valueString);
            else d[c] = b.valueString;
            else for (c in b) wijmoASPNetParseOptionsReviewer(b, c)
    }
}
function wijmoASPNetParseOptions(a) {
    var b;
    if (!a) return a;
    for (b in a) wijmoASPNetParseOptionsReviewer(a, b);
    return a
};
(function (a) {
    "use strict";
    var g = "@wijtp@",
        b = "wijmo-wijtooltip",
        e = b + "-arrow-",
        c = parseFloat,
        i = window,
        d = document,
        j = Math,
        h = j.max,
        f = {};
    a.widget("wijmo.wijtooltip", {
        options: {
            content: "",
            title: "",
            closeBehavior: "auto",
            mouseTrailing: false,
            triggers: "hover",
            position: {
                my: "left bottom",
                at: "right top",
                offset: null
            },
            showCallout: true,
            animation: {
                animated: "fade",
                duration: 500,
                easing: null
            },
            showAnimation: {},
            hideAnimation: {},
            showDelay: 150,
            hideDelay: 150,
            calloutAnimation: {
                duration: 1e3,
                disabled: false,
                easing: null
            },
            calloutFilled: false,
            modal: false,
            group: null,
            ajaxCallback: null,
            showing: null,
            shown: null,
            hiding: null,
            hidden: null,
            cssClass: ""
        },
        _setOption: function (c, f) {
            var b = this,
                e = "_set_" + c,
                d = b.options[c];
            a.Widget.prototype._setOption.apply(b, arguments);
            if (a.isPlainObject(f)) b.options[c] = a.extend({}, d, f);
            b[e] && b[e](d)
        },
        _set_cssClass: function () {
            var c = this,
                d = c.options,
                b = d.cssClass,
                a = c._tooltip;
            if (!a) return;
            !a.hasClass(b) && a.addClass(b)
        },
        _set_content: function () {
            var a = this;
            if (a._isAjaxCallback) {
                a._callbacked = true;
                a.show();
                a._callbacked = false
            } else a._setText()
        },
        _create: function () {
            var c = this,
                e = c.options,
                h = c.element,
                j = h && h.attr("id"),
                d = "",
                f = "",
                i = e.group || g,
                b = a.wijmo.wijtooltip._getTooltip(i);
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            if (b) b.count++;
            else {
                b = c._createTooltip();
                b.count = 0;
                a.wijmo.wijtooltip._tooltips[i] = b
            }
            f = e.cssClass ? e.cssClass : "";
            !b.hasClass(f) && b.addClass(f);
            e.position.of = c.element;
            c._bindLiveEvents();
            c._tooltip = b;
            if (j !== "") {
                d = b.attr("aria-describedby");
                d = d === undefined ? "" : d + " ";
                b.attr("aria-describedby", d + j)
            }
        },
        destroy: function () {
            var b = this,
                c = b.element,
                d = b.options.group || g;
            c.unbind(".tooltip");
            c.attr("title", b._content);
            a.wijmo.wijtooltip._removeTooltip(d);
            a.Widget.prototype.destroy.apply(b)
        },
        widget: function () {
            return this._tooltip
        },
        show: function () {
            var c = this,
                b = c._tooltip,
                d = c.options;
            if (!b || d.disabled) return;
            if (b._showAnimationTimer) {
                clearTimeout(b._showAnimationTimer);
                b._showAnimationTimer = null
            }
            if (b._showAtAnimationTimer) {
                clearTimeout(b._showAtAnimationTimer);
                b._showAtAnimationTimer = null
            }
            if (b._hideAnimationTimer) {
                clearTimeout(b._hideAnimationTimer);
                b._hideAnimationTimer = null
            }
            b.stop(true, true);
            if (d.ajaxCallback && a.isFunction(d.ajaxCallback) && !c._callbacked) {
                c._isAjaxCallback = true;
                d.ajaxCallback.call(c.element);
                return
            }
            c._setText();
            b._showAnimationTimer = setTimeout(function () {
                f = b.offset();
                if (d.mouseTrailing) {
                    c._setCalloutCss();
                    return
                }
                c._setPosition();
                c._showTooltip()
            }, c.options.showDelay)
        },
        showAt: function (a) {
            var e = this,
                b = e._tooltip,
                n = b && b._callout,
                m = {}, k = 0,
                l = 0,
                o = {}, i, j, c, d, h, g;
            if (!b || !n) return;
            b.stop(true, true);
            if (b._showAtAnimationTimer) {
                clearTimeout(b._showAtAnimationTimer);
                b._showAtAnimationTimer = null
            }
            if (b._hideAnimationTimer) {
                clearTimeout(b._hideAnimationTimer);
                b._hideAnimationTimer = null
            }
            b._showAtAnimationTimer = setTimeout(function () {
                var p = b.is(":visible");
                e._setText();
                f = b.offset();
                b.offset({
                    left: 0,
                    top: 0
                }).show();
                m = n.position();
                k = m.left;
                l = m.top;
                j = e._getBorder(n);
                c = j.left || j.right;
                d = j.top || j.bottom;
                h = b.width();
                g = b.height();
                i = e._getCalloutShape();
                o = ({
                    rt: {
                        left: a.x - h - c,
                        top: a.y - l
                    },
                    rc: {
                        left: a.x - h - c,
                        top: a.y - g / 2
                    },
                    rb: {
                        left: a.x - h - c,
                        top: a.y - l - d
                    },
                    lt: {
                        left: a.x + c,
                        top: a.y - l
                    },
                    lc: {
                        left: a.x + c,
                        top: a.y - g / 2
                    },
                    lb: {
                        left: a.x + c,
                        top: a.y - l - d
                    },
                    tl: {
                        left: a.x - k,
                        top: a.y + d
                    },
                    tc: {
                        left: a.x - h / 2,
                        top: a.y + d
                    },
                    tr: {
                        left: a.x - k - c,
                        top: a.y + d
                    },
                    bl: {
                        left: a.x - k,
                        top: a.y - g - d
                    },
                    bc: {
                        left: a.x - h / 2,
                        top: a.y - g - d
                    },
                    br: {
                        left: a.x - k - c,
                        top: a.y - g - d
                    },
                    cc: {
                        left: a.x - h / 2,
                        top: a.y - g / 2
                    }
                })[i];
                i = e._flipTooltip(o, i, j);
                e._setUnfilledCallout(i);
                b.offset(o);
                !p && b.hide();
                e._calloutShape = i;
                e._showTooltip()
            }, e.options.showDelay)
        },
        hide: function () {
            var c = this,
                b = c._tooltip;
            if (!b) return;
            if (b._showAnimationTimer) {
                clearTimeout(b._showAnimationTimer);
                b._showAnimationTimer = null
            }
            if (b._showAtAnimationTimer) {
                clearTimeout(b._showAtAnimationTimer);
                b._showAtAnimationTimer = null
            }
            if (b._hideAnimationTimer) {
                clearTimeout(b._hideAnimationTimer);
                b._hideAnimationTimer = null
            }
            b._hideAnimationTimer = setTimeout(a.proxy(c._hideTooltip, c), c.options.hideDelay)
        },
        _createTooltip: function () {
            var j = this,
                d = "ui-corner-all",
                f = "ui-widget-content",
                k = "ui-state-default",
                l = "ui-widget-header",
                c = a("<div class = '" + b + " ui-widget " + f + " " + d + "'></div>"),
                g = a("<div class='" + b + "-container'></div>"),
                h = a("<div class='" + f + " " + b + "-pointer '><div class='" + b + "-pointer-inner'></div></div>"),
                i = a("<div class = '" + b + "-title " + l + " " + d + "'></title>"),
                e = a("<a href='#' class = '" + b + "-close " + k + " " + d + "'></a>");
            e.append(a("<span class = 'ui-icon ui-icon-close'></span>")).bind("click", a.proxy(j._onClickCloseBtn, j));
            c.append(i).append(e).append(g).append(h).css("position", "absolute").attr("role", "tooltip").appendTo("body").hide();
            c._container = g;
            c._callout = h;
            c._closeBtn = e;
            c._title = i;
            return c
        },
        _bindLiveEvents: function () {
            var b = this,
                d = b.options,
                c = b.element;
            if (b._content === undefined) {
                b._content = c.attr("title");
                c.attr("title", "")
            }
            c.unbind(".tooltip");
            d.mouseTrailing && c.bind("mousemove.tooltip", function (a) {
                if (d.disabled) return;
                var e = d.position.offset || "",
                    c = e.split(" ");
                if (c.length === 2) b.showAt({
                    x: a.pageX + parseInt(c[0], 10),
                    y: a.pageY + parseInt(c[1], 10)
                });
                else b.showAt({
                    x: a.pageX,
                    y: a.pageY
                })
            });
            switch (d.triggers) {
                case "hover":
                    c.bind("mouseover.tooltip", a.proxy(b.show, b)).bind("mouseout.tooltip", a.proxy(b._hideIfNeeded, b));
                    break;
                case "click":
                    c.bind("click.tooltip", a.proxy(b.show, b));
                    break;
                case "focus":
                    c.bind("focus.tooltip", a.proxy(b.show, b)).bind("blur.tooltip", a.proxy(b._hideIfNeeded, b));
                    break;
                case "rightClick":
                    c.bind("contextmenu.tooltip", function (a) {
                        b.show();
                        a.preventDefault()
                    })
            }
        },
        _hideIfNeeded: function () {
            var c = this,
                a = c.options,
                b = a.closeBehavior;
            if (b === "sticky" || a.modal || b === "none" || a.disabled) return;
            c.hide()
        },
        _flipTooltip: function (d, i, e) {
            var h = this,
                c = h._tooltip,
                j = {
                    width: c.width(),
                    height: c.height()
                }, b = h._flipCallout(d, j, i),
                a = b && b.flip,
                g, f;
            if (!c || !b || !a.h && !a.v) return b.calloutShape;
            g = c.width();
            f = c.height();
            if (a.h === "l") d.left -= g + e.right * 2 + 1;
            else if (a.h === "r") d.left += g + e.left * 2 + 1;
            else if (a.v === "t") d.top -= f + e.bottom * 2 + 1;
            else if (a.v === "b") d.top += f + e.top * 2 + 1;
            return b.calloutShape
        },
        _flipCallout: function (g, k, b) {
            var h = this,
                l = h.options,
                j = h._tooltip,
                c = {
                    h: false,
                    v: false
                }, f = a(i),
                d = (l.position.collision || "flip").split(" ");
            if (d.length === 1) d[1] = d[0];
            if (!j || d[0] !== "flip" && d[1] !== "flip") return {
                flip: c
            };
            if (d[0] === "flip") if (g.left < 0 || g.left + k.width > f.width() + f.scrollLeft()) c.h = true;
            if (d[0] === "flip") if (g.top < 0 || g.top + k.height > f.height() + f.scrollTop()) c.v = true;
            if (l.showCallout) {
                if (c.h) if (b.indexOf("l") > -1) {
                    b = b.replace(/l/, "r");
                    c.h = "l"
                } else if (b.indexOf("r") > -1) {
                    b = b.replace(/r/, "l");
                    c.h = "r"
                }
                if (c.v) if (b.indexOf("t") > -1) {
                    b = b.replace(/t/, "b");
                    c.v = "t"
                } else if (b.indexOf("b") > -1) {
                    b = b.replace(/b/, "t");
                    c.v = "b"
                }
                if (c.h || c.v) {
                    h._removeCalloutCss();
                    j.addClass(e + b)
                }
            }
            return {
                flip: c,
                calloutShape: b
            }
        },
        _set_position: function (b) {
            var a = this,
                d = a.options,
                c = d.position;
            if (d.showCallout) {
                (b.my !== c.my || b.at !== c.at) && a._setPosition();
                a._setCalloutOffset(true)
            }
            a._setText()
        },
        _set_showCallOut: function (d) {
            var c = this,
                b = c._tooltip,
                a = b && b._callout;
            if (!b || !a) return;
            if (d) {
                c._setCalloutCss();
                a.show()
            } else a.hide()
        },
        _set_closeBehavior: function () {
            var c = this,
                b = c._tooltip,
                a = b && b._closeBtn;
            a && a[c.options.closeBehavior === "sticky" ? "show" : "hide"]()
        },
        _set_triggers: function () {
            this._bindLiveEvents()
        },
        _set_mouseTrailing: function () {
            this._bindLiveEvents()
        },
        _getCalloutShape: function () {
            var g = this,
                e = g.options.position,
                f = function (b) {
                    return a.map(b, function (a) {
                        return a.substr(0, 1)
                    })
                }, c = f(e.my.split(" ")),
                d = f(e.at.split(" ")),
                b = [];
            if (c.length === 2) b = c;
            if (c[0] === d[0])(c[1] === "t" && d[1] === "b" || c[1] === "b" && d[1] === "t") && b.reverse();
            else d[0] === "c" && b.reverse();
            b[0] === "c" && b.reverse();
            return b.join("")
        },
        _setCalloutCss: function () {
            var a = this,
                f = a.options,
                d = a._tooltip,
                c = "",
                b = "";
            if (!f.showCallout) return;
            a._removeCalloutCss();
            b = a._getCalloutShape();
            c = e + b;
            d && d.addClass(c);
            return b
        },
        _removeCalloutCss: function () {
            var b = this._tooltip;
            b && a.each(["tl", "tc", "tr", "bl", "bc", "br", "rt", "rc", "rb", "lt", "lc", "lb", "cc"], function (d, c) {
                var a = e + c;
                if (b.hasClass(a)) {
                    b.removeClass(a);
                    return false
                }
            })
        },
        _getBorder: function (d) {
            var b = {};
            a.each(["top", "right", "left", "bottom"], function (e, a) {
                b[a] = c(d.css("border-" + a + "-width"))
            });
            return b
        },
        _setPosition: function () {
            var e = this,
                m = e.options,
                d = m.position,
                a = e._tooltip,
                p = a.is(":hidden"),
                f = e._setCalloutCss(),
                n = f ? f.split("") : null,
                b = [0, 0],
                h = "",
                g = a._callout,
                i, l, r, q, j, s = {
                    width: a.width(),
                    height: a.height()
                }, o, k;
            p && a.show();
            a.css({
                left: 0,
                top: 0
            });
            if (m.showCallout) {
                i = e._getBorder(g);
                r = c(g.css("left"));
                l = c(g.css("top"));
                q = c(g.css("right"));
                j = c(g.css("bottom"));
                switch (n[0]) {
                    case "l":
                        b[0] = i.right;
                        break;
                    case "r":
                        b[0] = -i.left;
                        break;
                    case "b":
                        b[1] = j;
                        break;
                    case "t":
                        b[1] = -l
                }
                switch (n[1]) {
                    case "t":
                        b[1] = -l;
                        break;
                    case "b":
                        b[1] = j;
                        break;
                    case "r":
                        b[0] = q;
                        break;
                    case "l":
                        b[0] = -r
                }
                h = b.join(" ")
            }
            a.position({
                my: d.my,
                at: d.at,
                of: d.of,
                offset: h,
                collision: "none none"
            });
            o = e._flipCallout(a.offset(), s, f);
            k = o.flip;
            if (k.h || k.v) {
                a.css({
                    left: 0,
                    top: 0
                });
                a.position({
                    my: d.my,
                    at: d.at,
                    of: d.of,
                    offset: h,
                    collision: d.collision
                })
            }
            m.showCallout && e._setUnfilledCallout(f);
            e._calloutShape = f;
            p && a.hide()
        },
        _setCalloutOffset: function (h) {
            var g = this,
                k = g.options,
                j = g._tooltip,
                d = j && j._callout,
                l = g._calloutShape,
                e = false,
                f = k.position.offset,
                c = "",
                b = [],
                i = k.calloutAnimation;
            if (!d) return;
            if (!f || f.length === 0) return;
            d.stop(true, true);
            a.each(["tr", "tc", "tl", "bl", "bc", "br"], function (b, a) {
                if (l === a) {
                    e = true;
                    return false
                }
            });
            if (f) {
                b = f.split(" ");
                if (b.length === 2) c = e ? b[0] : b[1];
                else if (b.length === 1) c = b[0]
            }
            if (b && b.length === 2 && b[0] === "none" && b[1] === "none") d.css("left", "").css("top", "");
            else if (c === "none") d.css(e ? "left" : "top", "");
            else if (c !== "") if (h && !h.disabled) d.animate(e ? {
                left: c
            } : {
                top: c
            }, i.duration, i.easing);
            else d.css(e ? "left" : "top", c)
        },
        _setUnfilledCallout: function (g) {
            var e = this,
                c = e._tooltip,
                d = c && c._callout,
                a = d && d.children(),
                f = g.split(""),
                b = c && c.css("background-color");
            if (!a) return;
            a.css({
                "border-left-color": "",
                "border-top-color": "",
                "border-bottom-color": "",
                "border-right-color": ""
            });
            if (!e.options.calloutFilled) switch (f[0]) {
                case "l":
                    a.css("border-right-color", b);
                    break;
                case "t":
                    a.css("border-bottom-color", b);
                    break;
                case "r":
                    a.css("border-left-color", b);
                    break;
                case "b":
                    a.css("border-top-color", b)
            }
        },
        _showTooltip: function () {
            var c = this,
                d = c.options,
                b = c._tooltip,
                e, g, j, h = b && b._closeBtn,
                i = b && b._callout;
            if (!b) return;
            if (c._trigger("showing", null, c) === false) return;
            h && h[d.closeBehavior === "sticky" ? "show" : "hide"]();
            i && i[d.showCallout ? "show" : "hide"]();
            c._showModalLayer();
            b.css("z-index", 99999);
            if (a.fn.wijshow) {
                g = {
                    show: true,
                    context: b
                };
                e = a.extend({}, d.animation, d.showAnimation);
                if (b.is(":visible")) {
                    j = b.offset();
                    b.offset(f);
                    a.extend(g, {
                        pos: j
                    });
                    e.animated = "tooltipSlide"
                }
                b.wijshow(e, a.wijmo.wijtooltip.animations, g, null, function () {
                    c._trigger("shown")
                })
            } else {
                b.show();
                c._trigger("shown")
            }
            c._setCalloutOffset(false)
        },
        _hideTooltip: function () {
            var b = this,
                e = b.options,
                c = b._tooltip,
                f = a.extend({}, e.animation, e.hideAnimation),
                d;
            if (!c) return;
            if (b._trigger("hiding", null, b) === false) return;
            b._hideModalLayer();
            if (a.fn.wijhide) {
                d = {
                    show: false,
                    context: c
                };
                c.wijhide(f, a.wijmo.wijtooltip.animations, d, null, function () {
                    b._trigger("hidden");
                    c.css("z-index", "")
                })
            } else {
                c.hide();
                b._trigger("hidden");
                c.css("z-index", "")
            }
        },
        _getContent: function (b) {
            var c = {
                data: ""
            }, d;
            if (a.isFunction(b)) {
                d = b.call(this.element, c);
                return c.data !== "" ? c.data : d
            } else if (window[b] && a.isFunction(window[b])) {
                d = window[b].call(this.element, c);
                return c.data !== "" ? c.data : d
            }
            return b
        },
        _setText: function () {
            var b = this,
                f = b.options,
                c = b._tooltip,
                a = "",
                d = "",
                e = c && c._title;
            if (!c) return;
            a = b._getContent(f.content);
            a = a === "" ? b._content : a;
            c._container.html(a);
            d = b._getContent(f.title);
            if (d !== "") e.html(d).show();
            else e.hide()
        },
        _showModalLayer: function () {
            var b = this,
                c = null;
            if (b.options.modal) {
                c = a("<div>").addClass("ui-widget-overlay").css("z-index", 99e3).width(b._getDocSize("Width")).height(b._getDocSize("Height")).appendTo("body");
                a(window).bind("resize.wijtooltip", function () {
                    c.width(b._getDocSize("Width")).height(b._getDocSize("Height"))
                });
                b._tooltip._modalLayer = c
            }
        },
        _hideModalLayer: function () {
            var c = this,
                b = c._tooltip._modalLayer;
            if (b) {
                b.css("z-index", "").remove();
                a(window).unbind("resize.wijtooltip")
            }
        },
        _getDocSize: function (b) {
            var c, e, g = "documentElement",
                f = "body";
            if (a.browser.msie && a.browser.version < 9) {
                c = h(d[g]["scroll" + b], d[f]["scroll" + b]);
                e = h(d[g]["offset" + b], d[f]["offset" + b]);
                return c < e ? a(i)[b.toLowerCase()]() + "px" : c + "px"
            } else return a(d)[b.toLowerCase()]() + "px"
        },
        _onClickCloseBtn: function (a) {
            this.hide();
            a.preventDefault()
        }
    });
    a.extend(a.wijmo.wijtooltip, {
        animations: {
            fade: function (b, c) {
                b = a.extend({
                    duration: 300,
                    easing: "swing"
                }, b, c);
                b.context.stop(true, true).animate(b.show ? {
                    opacity: "show"
                } : {
                    opacity: "hide"
                }, b)
            },
            tooltipSlide: function (b, c) {
                b = a.extend({
                    duration: 300,
                    easing: "swing"
                }, b, c);
                b.context.stop(true, true).animate({
                    left: b.pos.left,
                    top: b.pos.top
                }, b)
            }
        },
        _tooltips: {},
        _getTooltip: function (b) {
            return a.wijmo.wijtooltip._tooltips[b]
        },
        _removeTooltip: function (c) {
            var b = a.wijmo.wijtooltip._tooltips[c];
            if (b) {
                b.count--;
                if (b.count <= 0) {
                    b.remove();
                    a.wijmo.wijtooltip._tooltips[c] = null
                }
            }
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    a.widget("wijmo.wijslider", a.ui.slider, {
        options: {
            buttonMouseOver: null,
            buttonMouseOut: null,
            buttonMouseDown: null,
            buttonMouseUp: null,
            buttonClick: null,
            dragFill: true,
            minRange: 0
        },
        _setOption: function (d, c) {
            var b = this;
            a.ui.slider.prototype._setOption.apply(b, arguments);
            this.options[d] = c;
            if (d === "disabled") b._handleDisabledOption(c, b.element.parent());
            else d === "range" && b._setRangeOption(c);
            return this
        },
        _setRangeOption: function (d) {
            var c = this,
                b = c.options;
            if (d) {
                if (d === true) {
                    if (!b.values) b.values = [c._valueMin(), c._valueMin()];
                    if (b.values.length && b.values.length !== 2) b.values = [b.values[0], b.values[0]]
                }
                c.range = a("<div></div>").appendTo(c.element).addClass("ui-slider-range ui-widget-header" + (b.range === "min" || b.range === "max" ? " ui-slider-range-" + b.range : ""))
            } else c.range.remove();
            c._refreshValue()
        },
        _create: function () {
            var b = this,
                c = b.element,
                d = b.options,
                i, l, e, g, h, n, m, f, j, k, o;
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            b._oriStyle = c.attr("style");
            if (c.is(":input")) {
                if (d.orientation === "horizontal") i = a("<div></div>").width(c.width()).appendTo(document.body);
                else i = a("<div></div>").height(c.height()).appendTo(document.body);
                l = c.val();
                if (l !== "") try {
                    e = l.split(";");
                    h = e.length;
                    if (h > 0) {
                        for (g = 0; g < h; g++) e[g] = parseInt(e[g], 10);
                        if (h === 1) d.value = e[0];
                        else d.values = e
                    }
                } catch (q) {}
                c.data(b.widgetName, i.wijslider(d)).after(a(document.body).children("div:last")).hide();
                if (d.disabledState) {
                    var p = d.disabled;
                    b.disable();
                    d.disabled = p
                }
                return
            }
            a.ui.slider.prototype._create.apply(b, arguments);
            c.data("originalStyle", c.attr("style"));
            c.data("originalContent", c.html());
            n = c.width();
            m = c.height();
            f = a("<div></div>");
            if (d.orientation === "horizontal") f.addClass("wijmo-wijslider-horizontal");
            else f.addClass("wijmo-wijslider-vertical");
            f.width(n).height(m);
            j = a('<a class="wijmo-wijslider-decbutton"><span></span></a>');
            k = a('<a class="wijmo-wijslider-incbutton"><span></span></a>');
            c.wrap(f).before(j).after(k);
            b._container = c.parent();
            b._attachClass();
            o = c.find(".ui-slider-handle");
            b._adjustSliderLayout(j, k, o);
            if (d.disabledState) {
                var p = d.disabled;
                b.disable();
                d.disabled = p
            }
            b.element.is(":hidden") && b.element.wijAddVisibilityObserver && b.element.wijAddVisibilityObserver(function () {
                b._refresh();
                b.element.wijRemoveVisibilityObserver && b.element.wijRemoveVisibilityObserver()
            }, "wijslider");
            b._bindEvents()
        },
        _handleDisabledOption: function (b, c) {
            var a = this;
            if (b) {
                if (!a.disabledDiv) a.disabledDiv = a._createDisabledDiv(c);
                a.disabledDiv.appendTo("body")
            } else if (a.disabledDiv) {
                a.disabledDiv.remove();
                a.disabledDiv = null
            }
        },
        _createDisabledDiv: function (d) {
            var g = this,
                b = d ? d : g.element,
                c = b.offset(),
                f = b.outerWidth(),
                e = b.outerHeight();
            return a("<div></div>").addClass("ui-disabled").css({
                "z-index": "99999",
                position: "absolute",
                width: f,
                height: e,
                left: c.left,
                top: c.top
            })
        },
        refresh: function () {
            var b = this.element.data("wijslider"),
                a = this.element.data("wijmoWijslider");
            this.destroy();
            this.element.data("wijslider", b);
            this.element.data("wijmoWijslider", a);
            this._create()
        },
        _refresh: function () {
            var a = this,
                c, b, d;
            b = a._container.find(".wijmo-wijslider-decbutton");
            c = a._container.find(".wijmo-wijslider-incbutton");
            d = a._container.find(".ui-slider-handle");
            a._adjustSliderLayout(b, c, d);
            a._refreshValue()
        },
        _adjustSliderLayout: function (e, f, q) {
            var h = this,
                g = h.element,
                r = h.options,
                b, a, d, c, j, i, l, k, o, p, m, n;
            b = h._container.width();
            a = h._container.height();
            d = e.outerWidth();
            c = e.outerHeight();
            j = f.outerWidth();
            i = f.outerHeight();
            l = q.outerWidth();
            k = q.outerHeight();
            if (r.orientation === "horizontal") {
                o = a / 2 - c / 2;
                e.css("top", o).css("left", 0);
                p = a / 2 - i / 2;
                f.css("top", p).css("right", 0);
                g.css("left", d + l / 2 - 1).css("top", a / 2 - g.outerHeight() / 2).width(b - d - j - l - 2)
            } else {
                m = b / 2 - d / 2;
                e.css("left", m).css("top", 0);
                n = b / 2 - j / 2;
                f.css("left", n).css("bottom", 0);
                g.css("left", b / 2 - g.outerWidth() / 2).css("top", c + k / 2 + 1).height(a - c - i - k - 2)
            }
        },
        destroy: function () {
            var b = this,
                c, d;
            c = this._getDecreBtn();
            d = this._getIncreBtn();
            c.unbind("." + b.widgetName);
            d.unbind("." + b.widgetName);
            a.ui.slider.prototype.destroy.apply(this, arguments);
            a("a", b.element.parent()).remove();
            b.element.unbind("." + b.widgetName);
            b.element.unwrap();
            if (b._oriStyle === undefined) b.element.removeAttr("style");
            else b.element.attr("style", b._oriStyle);
            b.element.removeData(b.widgetName).removeData("originalStyle").removeData("originalContent");
            if (b.disabledDiv) {
                b.disabledDiv.remove();
                b.disabledDiv = null
            }
        },
        _slide: function (i, f, e) {
            var g = this,
                h = g.options,
                c = h.minRange,
                d = e,
                b;
            if (h.range) {
                b = g.values();
                if (f === 0 && b[1] - c < e) d = b[1] - c;
                else if (f === 1 && b[0] + c > e) d = b[0] + c
            }
            a.ui.slider.prototype._slide.call(g, i, f, d)
        },
        _getDecreBtn: function () {
            return this.element.parent().find(".wijmo-wijslider-decbutton")
        },
        _getIncreBtn: function () {
            return this.element.parent().find(".wijmo-wijslider-incbutton")
        },
        _attachClass: function () {
            this._getDecreBtn().addClass("ui-corner-all ui-state-default").attr("role", "button");
            this._getIncreBtn().addClass("ui-corner-all ui-state-default").attr("role", "button");
            this.element.parent().attr("role", "slider").attr("aria-valuemin", this.options.min).attr("aria-valuenow", "0").attr("aria-valuemax", this.options.max);
            if (this.options.orientation === "horizontal") {
                this.element.parent().addClass("wijmo-wijslider-horizontal");
                this._getDecreBtn().find("> span").addClass("ui-icon ui-icon-triangle-1-w");
                this._getIncreBtn().find("> span").addClass("ui-icon ui-icon-triangle-1-e")
            } else {
                this.element.parent().addClass("wijmo-wijslider-vertical");
                this._getDecreBtn().find("> span").addClass("ui-icon ui-icon-triangle-1-n");
                this._getIncreBtn().find("> span").addClass("ui-icon ui-icon-triangle-1-s")
            }
        },
        _bindEvents: function () {
            var a = this,
                b, c;
            b = this._getDecreBtn();
            c = this._getIncreBtn();
            b.bind("click." + a.widgetName, a, a._decreBtnClick);
            c.bind("click." + a.widgetName, a, a._increBtnClick);
            b.bind("mouseover." + a.widgetName, a, a._decreBtnMouseOver);
            b.bind("mouseout." + a.widgetName, a, a._decreBtnMouseOut);
            b.bind("mousedown." + a.widgetName, a, a._decreBtnMouseDown);
            b.bind("mouseup." + a.widgetName, a, a._decreBtnMouseUp);
            c.bind("mouseover." + a.widgetName, a, a._increBtnMouseOver);
            c.bind("mouseout." + a.widgetName, a, a._increBtnMouseOut);
            c.bind("mousedown." + a.widgetName, a, a._increBtnMouseDown);
            c.bind("mouseup." + a.widgetName, a, a._increBtnMouseUp)
        },
        _decreBtnMouseOver: function (d) {
            var a = d.data,
                c, b;
            if (a.options.disabledState || a.options.disabled) return;
            c = {
                buttonType: "decreButton"
            };
            a._trigger("buttonMouseOver", d, c);
            b = a._getDecreBtn();
            b.addClass("ui-state-hover")
        },
        _increBtnMouseOver: function (d) {
            var a = d.data,
                c, b;
            if (a.options.disabledState || a.options.disabled) return;
            c = {
                buttonType: "increButton"
            };
            a._trigger("buttonMouseOver", d, c);
            b = a._getIncreBtn();
            b.addClass("ui-state-hover")
        },
        _decreBtnMouseOut: function (d) {
            var a = d.data,
                c, b;
            if (a.options.disabledState || a.options.disabled) return;
            c = {
                buttonType: "decreButton"
            };
            a._trigger("buttonMouseOut", d, c);
            b = a._getDecreBtn();
            b.removeClass("ui-state-hover ui-state-active")
        },
        _increBtnMouseOut: function (d) {
            var a = d.data,
                c, b;
            if (a.options.disabledState || a.options.disabled) return;
            c = {
                buttonType: "increButton"
            };
            a._trigger("buttonMouseOut", d, c);
            b = a._getIncreBtn();
            b.removeClass("ui-state-hover ui-state-active")
        },
        _decreBtnMouseDown: function (e) {
            var b = e.data,
                d, c;
            if (b.options.disabledState || b.options.disabled) return;
            d = {
                buttonType: "decreButton"
            };
            b._trigger("buttonMouseDown", e, d);
            c = b._getDecreBtn();
            c.addClass("ui-state-active");
            a(document).bind("mouseup." + b.widgetName, {
                self: b,
                ele: c
            }, b._documentMouseUp);
            if (b._intervalID !== null) {
                window.clearInterval(b._intervalID);
                b._intervalID = null
            }
            b._intervalID = window.setInterval(function () {
                b._decreBtnHandle(b)
            }, 200)
        },
        _documentMouseUp: function (c) {
            var b = c.data.self,
                d = c.data.ele;
            if (b.options.disabledState || b.options.disabled) return;
            d.removeClass("ui-state-active");
            if (b._intervalID !== null) {
                window.clearInterval(b._intervalID);
                b._intervalID = null
            }
            a(document).unbind("mouseup." + b.widgetName, b._documentMouseUp)
        },
        _intervalID: null,
        _increBtnMouseDown: function (e) {
            var b = e.data,
                d, c;
            if (b.options.disabledState || b.options.disabled) return;
            d = {
                buttonType: "increButton"
            };
            b._trigger("buttonMouseDown", e, d);
            c = b._getIncreBtn();
            c.addClass("ui-state-active");
            a(document).bind("mouseup." + b.widgetName, {
                self: b,
                ele: c
            }, b._documentMouseUp);
            if (b._intervalID !== null) {
                window.clearInterval(b._intervalID);
                b._intervalID = null
            }
            b._intervalID = window.setInterval(function () {
                b._increBtnHandle(b)
            }, 200)
        },
        _decreBtnMouseUp: function (d) {
            var a = d.data,
                c, b;
            if (a.options.disabledState || a.options.disabled) return;
            c = {
                buttonType: "decreButton"
            };
            a._trigger("buttonMouseUp", d, c);
            b = a._getDecreBtn();
            b.removeClass("ui-state-active");
            window.clearInterval(a._intervalID)
        },
        _increBtnMouseUp: function (d) {
            var a = d.data,
                c, b;
            if (a.options.disabledState || a.options.disabled) return;
            c = {
                buttonType: "increButton"
            };
            a._trigger("buttonMouseUp", d, c);
            b = a._getIncreBtn();
            b.removeClass("ui-state-active");
            window.clearInterval(a._intervalID)
        },
        _decreBtnHandle: function (a) {
            if (a.options.orientation === "horizontal") a._decre();
            else a._incre()
        },
        _decreBtnClick: function (c) {
            var a = c.data,
                b;
            if (a.options.disabledState || a.options.disabled) return;
            a._mouseSliding = false;
            a._decreBtnHandle(a);
            b = {
                buttonType: "decreButton",
                value: a.value()
            };
            a._trigger("buttonClick", c, b)
        },
        _increBtnHandle: function (a) {
            if (a.options.orientation === "horizontal") a._incre();
            else a._decre()
        },
        _increBtnClick: function (c) {
            var a = c.data,
                b;
            if (a.options.disabledState || a.options.disabled) return;
            a._mouseSliding = false;
            a._increBtnHandle(a);
            b = {
                buttonType: "increButton",
                value: a.value()
            };
            a._trigger("buttonClick", c, b)
        },
        _decre: function () {
            var a = this.value();
            if (!this.options.range && !this.options.values) {
                a = this.value();
                if (a <= this.options.min) this.value(this.options.min);
                else this.value(a - this.options.step)
            } else {
                a = this.values(0);
                if (a <= this.options.min) this.values(0, this.options.min);
                else this.values(0, a - this.options.step)
            }
            this.element.parent().attr("aria-valuenow", this.value())
        },
        _incre: function () {
            var a = this.value();
            if (!this.options.range && !this.options.values) {
                a = this.value();
                if (a >= this.options.max) this.value(this.options.max);
                else this.value(a + this.options.step)
            } else {
                a = this.values(1);
                if (a >= this.options.max) this.values(1, this.options.max);
                else this.values(1, a + this.options.step)
            }
            this.element.parent().attr("aria-valuenow", this.value())
        },
        _mouseInit: function () {
            var b = this;
            if (this.options.dragFill && this.options.range) {
                this._preventClickEvent = false;
                this.element.bind("click." + b.widgetName, function () {
                    if (b._dragFillStart > 0) b._dragFillStart = 0;
                    else a.ui.slider.prototype._mouseCapture.apply(b, arguments)
                })
            }
            a.ui.mouse.prototype._mouseInit.apply(this, arguments)
        },
        _mouseCapture: function (b) {
            this.element.parent().attr("aria-valuenow", this.value());
            if (this.options.dragFill) if (b.target.className === "ui-slider-range ui-widget-header") {
                this.elementSize = {
                    width: this.element.outerWidth(),
                    height: this.element.outerHeight()
                };
                this.elementOffset = this.element.offset();
                return true
            } else try {
                return a.ui.slider.prototype._mouseCapture.apply(this, arguments)
            } catch (c) {} else try {
                return a.ui.slider.prototype._mouseCapture.apply(this, arguments)
            } catch (c) {}
        },
        _dragFillTarget: false,
        _dragFillStart: 0,
        _rangeValue: 0,
        _oldValue1: 0,
        _oldValue2: 0,
        _oldX: 0,
        _oldY: 0,
        _mouseStart: function (a) {
            if (this.options.dragFill) {
                if (a.target) if (a.target.className === "ui-slider-range ui-widget-header") {
                    this._dragFillTarget = true;
                    this._rangeValue = this.values(1) - this.values(0);
                    this._oldValue1 = this.values(0);
                    this._oldValue2 = this.values(1);
                    this._oldX = a.pageX;
                    this._oldY = a.pageY;
                    return true
                }
                this._dragFillTarget = false
            }
            return true
        },
        _mouseDrag: function (f) {
            var d, c, e, b, g, h;
            if (this.options.dragFill) {
                d = f.pageX - this._oldX;
                c = this.element.outerWidth();
                if (this.options.orientation === "vertical") {
                    c = this.element.outerHeight();
                    d = -(f.pageY - this._oldY)
                }
                e = (this.options.max - this.options.min) / c * d;
                if (this._dragFillTarget) {
                    if (this.options.orientation === "vertical") a(document.documentElement).css("cursor", "s-resize");
                    else a(document.documentElement).css("cursor", "w-resize");
                    if (this._dragFillStart > 0) {
                        b = this._rangeValue;
                        this.values(0, this._oldValue1 + e);
                        this.values(1, this._oldValue1 + e + b);
                        g = this.values(0);
                        h = this.values(1);
                        g + b > this.options.max && this.values(0, this.options.max - b);
                        h - b < this.options.min && this.values(1, this.options.min + b)
                    }
                    this._dragFillStart++;
                    return false
                } else return a.ui.slider.prototype._mouseDrag.apply(this, arguments)
            } else return a.ui.slider.prototype._mouseDrag.apply(this, arguments)
        },
        _mouseStop: function () {
            var b = a.ui.slider.prototype._mouseStop.apply(this, arguments);
            if (this.options.dragFill) {
                a(document.documentElement).css("cursor", "default");
                window.setTimeout(function () {
                    this._dragFillTarget = false;
                    this._dragFillStart = 0
                }, 500)
            }
            return b
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    var j = "wijmo-wijsplitter-",
        t = j + "wrapper",
        m = j + "horizontal",
        n = j + "vertical",
        c = j + "h-",
        b = j + "v-",
        o = "-content",
        d = {
            panel1: {
                n: "panel1",
                content: "panel1" + o
            },
            panel2: {
                n: "panel2",
                content: "panel2" + o
            }
        }, v = "bar",
        s = "expander",
        r = "ui-widget-header",
        g = "ui-widget-content",
        q = "ui-state-default",
        h = "ui-state-hover",
        l = "ui-state-active",
        e = "ui-corner-",
        u = "ui-icon",
        k = "ui-icon-triangle-1-",
        i = "collapsed",
        f = "expanded",
        p = "resize-helper";
    a.widget("wijmo.wijsplitter", {
        options: {
            sizing: null,
            sized: null,
            expand: null,
            collapse: null,
            expanded: null,
            collapsed: null,
            barZIndex: -1,
            showExpander: true,
            splitterDistance: 100,
            orientation: "vertical",
            fullSplit: false,
            resizeSettings: {
                animationOptions: {
                    duration: 100,
                    easing: "swing",
                    disabled: false
                },
                ghost: false
            },
            panel1: {
                minSize: 1,
                collapsed: false,
                scrollBars: "auto"
            },
            panel2: {
                minSize: 1,
                collapsed: false,
                scrollBars: "auto"
            },
            collapsingPanel: "panel1"
        },
        _setOption: function (c, d) {
            var b = this,
                f = b.options,
                e, g = a.extend({}, f[c]);
            if (c === "fullSplit") b._setFullSplit(d);
            else if (a.isPlainObject(f[c])) {
                if (c === "panel1" && d.collapsed !== undefined) b._setPanel1Collapsed(d.collapsed);
                else c === "panel2" && d.collapsed !== undefined && b._setPanel2Collapsed(d.collapsed);
                f[c] = a.extend(true, f[c], d);
                return
            }
            a.Widget.prototype._setOption.apply(b, arguments);
            if (g !== d) if (c === "orientation") b.refresh();
            else if (c === "collapsingPanel") b.refresh();
            else if (c === "fullSplit") b.refresh(true, false);
            else if (c === "splitterDistance") {
                b.refresh(false, false);
                b._trigger("sized")
            } else if (c === "showExpander") {
                e = b._fields.expander;
                e && e.length && e.css("display", d ? "" : "none")
            }
            c === "disabled" && b._handleDisabledOption(d, b.element)
        },
        _create: function () {
            var b = this,
                d = b.element,
                c = b.options;
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            b._fields = {
                width: d.width(),
                height: d.height()
            };
            c.fullSplit && b._setFullSplit(true);
            b._splitterify();
            b._updateElementsCss();
            b._updateElements();
            b._bindEvents();
            b._initResizer();
            c.disabled && b.disable();
            b.element.wijAddVisibilityObserver && b.element.wijAddVisibilityObserver(function () {
                if (c.fullSplit) {
                    b._updateElements();
                    b._initResizer()
                }
            }, "wijsplitter");
            b._trigger("load", null, b)
        },
        _handleDisabledOption: function (b, c) {
            var a = this;
            if (b) {
                if (!a.disabledDiv) a.disabledDiv = a._createDisabledDiv(c);
                a.disabledDiv.appendTo("body")
            } else if (a.disabledDiv) {
                a.disabledDiv.remove();
                a.disabledDiv = null
            }
        },
        _createDisabledDiv: function (d) {
            var h = this,
                b = d ? d : h.element,
                c = b.offset(),
                g = b.outerWidth(),
                f = b.outerHeight(),
                e = {
                    "z-index": "99999",
                    position: "absolute",
                    width: g,
                    height: f,
                    left: c.left,
                    top: c.top
                };
            a.browser.msie && a.extend(e, {
                "background-color": "#fff",
                opacity: .1
            });
            return a("<div></div>").addClass("ui-disabled").css(e)
        },
        destroy: function () {
            var e = this,
                j = e.element,
                d = e._fields,
                s = d.wrapper,
                r = d.expander,
                t = d.bar,
                f = d.panel1,
                q = d.panel2,
                p = d.originalStyle,
                k = e.widgetName,
                h = d.oriPnl1Content,
                i = d.oriPnl2Content,
                l = d.oriPnl1ContentStyle,
                o = d.oriPnl2ContentStyle;
            f && f.n.is(":ui-resizable") && f.n.resizable("destroy");
            if (h) {
                h.removeClass(b + f.contentCss + " " + c + f.contentCss + " " + g);
                if (l === undefined) h.removeAttr("style");
                else h.attr("style", l);
                h.appendTo(j)
            }
            if (i) {
                i.removeClass(b + q.contentCss + " " + c + q.contentCss + " " + g);
                if (o === undefined) i.removeAttr("style");
                else i.attr("style", o);
                i.appendTo(j)
            }
            f.n.unbind("." + k);
            r.unbind("." + k);
            t.unbind("." + k);
            a(window).unbind("." + k);
            s.remove();
            j.removeClass(n + " " + m);
            if (p === undefined) j.removeAttr("style");
            else j.attr("style", p);
            if (e.disabledDiv) {
                e.disabledDiv.remove();
                e.disabledDiv = null
            }
            e._fields = null
        },
        refresh: function (e, d) {
            var a = this,
                c = a._fields,
                b = c.panel1;
            if (c._isResizing) return;
            (d || d === undefined) && a._updateElementsCss();
            a._updateElements();
            if (e || e === undefined) {
                b && b.n.is(":ui-resizable") && b.n.resizable("destroy");
                a._initResizer()
            }
        },
        _splitterify: function () {
            var i = this,
                f = i.element,
                k = i.options,
                b = i._fields,
                e, g, h, j, c = {
                    n: null,
                    content: f.find(">div:eq(0)")
                }, d = {
                    n: null,
                    content: f.find(">div:eq(1)")
                };
            b.originalStyle = f.attr("style");
            e = a("<div></div>").appendTo(f);
            c.n = a("<div></div>").appendTo(e);
            if (c.content.length === 0) c.content = a("<div></div>");
            else {
                b.oriPnl1Content = c.content;
                b.oriPnl1ContentStyle = c.content.attr("style")
            }
            c.content.appendTo(c.n);
            g = a("<div></div>").appendTo(e);
            k.barZIndex !== -1 && g.css("z-index", k.barZIndex);
            h = a("<div></div>").appendTo(g).attr("role", "button");
            j = a("<span></span>").appendTo(h);
            d.n = a("<div></div>").appendTo(e);
            if (d.content.length === 0) d.content = a("<div></div>");
            else {
                b.oriPnl2Content = d.content;
                b.oriPnl2ContentStyle = d.content.attr("style")
            }
            d.content.appendTo(d.n);
            b.wrapper = e;
            b.panel1 = c;
            b.panel2 = d;
            b.bar = g;
            b.expander = h;
            b.icon = j
        },
        _updateElementsCss: function () {
            var j = this,
                p = j.element,
                l = j.options,
                f = l.orientation === "vertical",
                i = j._fields,
                w = i.wrapper,
                a = l.collapsingPanel,
                h = l.collapsingPanel === "panel1" ? "panel2" : "panel1",
                y = i.bar,
                o = i.expander,
                x = i.icon;
            p.removeClass(n + " " + m).addClass(f ? n : m);
            w.attr("class", t);
            i[a].n.removeClass(b + d[a].n + " " + c + d[a].n).addClass((f ? b : c) + d[a].n);
            i[a].content.removeClass(b + d[a].content + " " + c + d[a].content + " " + g).addClass((f ? b : c) + d[a].content + " " + g);
            y.attr("class", (f ? b : c) + v + " " + r).css("width", "").css("height", "");
            o.attr("class", e + (f ? "bl " + b : "tr " + c) + s + " " + q).css("left", "").css("top", "");
            x.attr("class", u + " " + k + (f ? "w" : "n"));
            i[h].n.removeClass(b + d[h].n + " " + c + d[h].n).addClass((f ? b : c) + d[h].n);
            i[h].content.removeClass(b + d[h].content + " " + c + d[h].content + " " + g).addClass((f ? b : c) + d[h].content + " " + g);
            j._updateExpanderCss()
        },
        _updateExpanderCss: function () {
            var t = this,
                a = t.options,
                s = t._fields,
                j = s.expander,
                l = s.icon,
                g = a.orientation === "vertical",
                d = a.collapsingPanel !== "panel1",
                h = g ? b : c,
                m = (["bl", "tr", "tr", "bl"])[g * 2 + d],
                n = (["br", "tl"])[+d],
                q = (["s", "n", "e", "w"])[g * 2 + d],
                o = (["tr", "bl", "bl", "tr"])[g * 2 + d],
                p = (["tl", "br"])[+d],
                r = (["n", "s", "w", "e"])[g * 2 + d];
            j.removeClass(h + a.collapsingPanel + "-" + f + " " + h + a.collapsingPanel + "-" + i + " " + e + m + " " + e + n + " " + e + o + " " + e + p);
            l.removeClass(k + q + " " + k + r);
            if (a.panel1.collapsed || a.panel2.collapsed) {
                j.addClass(e + m + " " + e + n + " " + h + a.collapsingPanel + "-" + i);
                l.addClass(k + q)
            } else {
                j.addClass(e + o + " " + e + p + " " + h + a.collapsingPanel + "-" + f);
                l.addClass(k + r)
            }
        },
        _updateElements: function () {
            var n = this,
                p = n.element,
                h = n.options,
                d = h.splitterDistance,
                k = h.collapsingPanel,
                r = h.collapsingPanel === "panel1" ? "panel2" : "panel1",
                a = n._fields,
                q = a.wrapper,
                s = a.panel1,
                t = a.panel2,
                o = a.bar,
                g = a.expander,
                j = p.width(),
                e = p.height(),
                m, l;
            q.height(e);
            n._setPanelsScrollMode();
            if (h.orientation === "vertical") {
                m = o.outerWidth(true);
                if (d > j - m) d = j - m;
                q.width(j * 2);
                if (h.panel1.collapsed) {
                    k === "panel1" && g.addClass(b + "panel1-" + i);
                    a.panel1.n.css("display", "none");
                    a.panel2.n.css("display", "");
                    d = 0
                } else {
                    k === "panel1" && g.addClass(b + "panel1-" + f);
                    a.panel1.n.css("display", "");
                    a.panel2.n.css("display", h.panel2.collapsed ? "none" : "")
                }
                if (h.panel2.collapsed) {
                    k === "panel2" && g.addClass(b + "panel2-" + i);
                    a.panel2.n.css("display", "none");
                    d = k === "panel1" ? j - m : j
                } else {
                    k === "panel2" && g.addClass(b + "panel2-" + f);
                    a.panel2.n.css("display", "")
                }!h.panel1.collapsed && !h.panel2.collapsed && g.addClass(b + h.collapsingPanel + "-" + f);
                if (k === "panel1") {
                    a.panel1.n.height(e).width(d);
                    a.panel2.n.height(e).width(j - d - m)
                } else {
                    a.panel1.n.height(e).width(d - m);
                    a.panel2.n.height(e).width(j - d);
                    a.panel2.content.width(j - d)
                }
                a.panel1.content.outerHeight(e, true);
                o.outerHeight(e, true);
                a.panel2.content.outerHeight(e, true);
                g.css("cursor", "pointer").css("top", e / 2 - g.outerHeight(true) / 2)
            } else {
                l = o.outerHeight(true);
                if (d > e - l) d = e - l;
                if (h.panel1.collapsed) {
                    k === "panel1" && g.addClass(c + "panel1-" + i);
                    a.panel1.n.css("display", "none");
                    a.panel2.n.css("display", "");
                    d = 0
                } else {
                    k === "panel1" && g.addClass(c + "panel1-" + f);
                    a.panel1.n.css("display", "");
                    a.panel2.n.css("display", h.panel2.collapsed ? "none" : "")
                }
                if (h.panel2.collapsed) {
                    k === "panel2" && g.addClass(c + "panel2-" + i);
                    a.panel2.n.css("display", "none");
                    d = k === "panel1" ? e - l : e
                } else {
                    k === "panel2" && g.addClass(c + "panel2-" + f);
                    a.panel2.n.css("display", "")
                }
                if (k === "panel1") {
                    a.panel1.n.width(j).height(d);
                    a.panel2.n.width(j).height(e - d - l);
                    a.panel1.content.outerHeight(d, true);
                    a.panel2.content.outerHeight(e - d - l, true)
                } else {
                    a.panel1.n.width(j).height(d - l);
                    a.panel2.n.width(j).height(e - d);
                    a.panel1.content.outerHeight(d - l, true);
                    a.panel2.content.outerHeight(e - d, true)
                }
                g.css("cursor", "pointer").css("left", j / 2 - g.outerWidth(true) / 2)
            }
            g.css("display", h.showExpander ? "" : "none")
        },
        _setFullSplit: function (b) {
            var c = this,
                a = c._fields,
                e = b ? "100%" : a.width,
                d = b ? "100%" : a.height;
            c.element.css("width", e).css("height", d)
        },
        _setPanel1Collapsed: function (d, g) {
            var b = this,
                c = b.options,
                f = c.panel1.collapsed,
                e = a(".ui-resizable-handle", b.element);
            if (f === d) return;
            if (c.collapsingPanel === "panel1") if (!b._trigger(f ? "expand" : "collapse", g, null)) return;
            c.panel1.collapsed = d;
            if (d) {
                c.panel2.collapsed = false;
                c.collapsingPanel === "panel2" && e.hide()
            } else e.show();
            b._updateElements();
            b._updateExpanderCss();
            c.collapsingPanel === "panel1" && b._trigger(d ? "collapsed" : "expanded", g, null)
        },
        _setPanel2Collapsed: function (d, g) {
            var b = this,
                c = b.options,
                f = c.panel2.collapsed,
                e = a(".ui-resizable-handle", b.element);
            if (f === d) return;
            if (c.collapsingPanel === "panel2") if (!b._trigger(f ? "expand" : "collapse", g, null)) return;
            c.panel2.collapsed = d;
            if (d) {
                c.panel1.collapsed = false;
                c.collapsingPanel === "panel1" && e.hide()
            } else e.show();
            b._updateElements();
            b._updateExpanderCss();
            c.collapsingPanel === "panel2" && b._trigger(d ? "collapsed" : "expanded", g, null)
        },
        _bindEvents: function () {
            var b = this,
                c = b.options,
                g = b._fields,
                f = g.bar,
                e = g.expander,
                d = b.widgetName;
            e.bind("mouseover." + d, function () {
                if (c.disabled) return;
                e.addClass(h)
            }).bind("mouseout." + d, function () {
                if (c.disabled) return;
                e.removeClass(h).removeClass(l)
            }).bind("mousedown." + d, function () {
                if (c.disabled) return;
                e.addClass(l)
            }).bind("mouseup." + d, function (a) {
                if (c.disabled) return;
                e.removeClass(l);
                if (c.collapsingPanel === "panel1") b._setPanel1Collapsed(!c.panel1.collapsed, a);
                else b._setPanel2Collapsed(!c.panel2.collapsed, a)
            });
            f.bind("mouseover." + d, function () {
                if (c.disabled) return;
                f.addClass(h)
            }).bind("mouseout." + d, function () {
                if (c.disabled) return;
                f.removeClass(h)
            });
            g.panel1.n.bind("animating." + d, function (a) {
                if (c.disabled) return;
                b._adjustLayout(b);
                b._trigger("sizing", a, null)
            }).bind("animated." + d, function (a) {
                if (c.disabled) return;
                b._adjustLayout(b);
                b._trigger("sized", a, null)
            });
            a(".ui-resizable-handle", b.element).live("mouseover." + d, function () {
                if (c.disabled) return;
                f.addClass(h)
            }).live("mouseout." + d, function () {
                if (c.disabled) return;
                f.removeClass(h)
            });
            a(window).bind("resize." + d, function () {
                if (c.disabled) return;
                if (c.fullSplit && b.element.is(":visible")) {
                    b._updateElements();
                    b._initResizer()
                }
            })
        },
        _initResizer: function () {
            var m = this,
                h = m.element,
                d = m.options,
                e = m._fields,
                u = e.bar,
                n = d.collapsingPanel,
                l = d.collapsingPanel === "panel1" ? "panel2" : "panel1",
                k = d.resizeSettings,
                g = k.animationOptions,
                o = g.disabled ? 0 : g.duration,
                w = h.width(),
                v = h.height(),
                r, t, j, q, s, i, f;
            if (d.orientation === "vertical") {
                r = u.outerWidth(true);
                t = w - r - d[l].minSize;
                j = d[n].minSize;
                if (j < 2) j = 2;
                e.panel1.n.resizable({
                    wijanimate: true,
                    minWidth: j,
                    maxWidth: t,
                    handles: "e",
                    helper: b + p,
                    animateDuration: o,
                    animateEasing: g.easing,
                    ghost: k.ghost,
                    start: function () {
                        e._isResizing = true
                    },
                    stop: function () {
                        e._isResizing = false
                    }
                })
            } else {
                q = u.outerHeight(true);
                s = v - q - d[l].minSize;
                i = d[n].minSize;
                if (i < 2) i = 2;
                e.panel1.n.resizable({
                    wijanimate: true,
                    minHeight: i,
                    maxHeight: s,
                    handles: "s",
                    helper: c + p,
                    animateDuration: o,
                    animateEasing: g.easing,
                    ghost: k.ghost,
                    start: function () {
                        e._isResizing = true
                    },
                    stop: function () {
                        e._isResizing = false
                    }
                })
            }
            f = a(".ui-resizable-handle", h);
            if (d[l].collapsed) f.hide();
            else f.show();
            if (a.browser.msie && a.browser.version < 7) d.orientation === "vertical" && f.height(h.height())
        },
        _adjustLayout: function (a) {
            var b = a.options,
                e = a._fields,
                d = e.panel1,
                c = b.orientation === "vertical" ? d.n.width() : d.n.height();
            if (b.splitterDistance === c) return;
            b.splitterDistance = c;
            a._updateElements()
        },
        _setPanelsScrollMode: function () {
            var d = this,
                c = d._fields,
                e = d.options,
                b = [e.panel1.scrollBars, e.panel2.scrollBars];
            a.each([c.panel1, c.panel2], function (a, c) {
                if (b[a] === "auto") c.content.css("overflow", "auto");
                else if (b[a] === "both") c.content.css("overflow", "scroll");
                else if (b[a] === "none") c.content.css("overflow", "hidden");
                else if (b[a] === "horizontal") c.content.css("overflow-x", "scroll").css("overflow-y", "hidden");
                else b[a] === "vertical" && c.content.css("overflow-x", "hidden").css("overflow-y", "scroll")
            })
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    a.ui.plugin.add("resizable", "wijanimate", {
        stop: function (l) {
            var b = a(this).data("resizable"),
                i = b.options,
                c = b.element,
                d = b._proportionallyResizeElements,
                h = d.length && /textarea/i.test(d[0].nodeName),
                j = h && a.ui.hasScroll(d[0], "left") ? 0 : b.sizeDiff.height,
                k = h ? 0 : b.sizeDiff.width,
                g, e, f;
            c.css("width", b.originalSize.width).css("height", b.originalSize.height);
            g = {
                width: b.size.width - k,
                height: b.size.height - j
            };
            e = parseInt(c.css("left"), 10) + (b.position.left - b.originalPosition.left) || null;
            f = parseInt(c.css("top"), 10) + (b.position.top - b.originalPosition.top) || null;
            c.animate(a.extend(g, f && e ? {
                top: f,
                left: e
            } : {}), {
                duration: i.animateDuration,
                easing: i.animateEasing,
                step: function () {
                    var e = {
                        width: parseInt(c.css("width"), 10),
                        height: parseInt(c.css("height"), 10),
                        top: parseInt(c.css("top"), 10),
                        left: parseInt(c.css("left"), 10)
                    };
                    d && d.length && a(d[0]).css({
                        width: e.width,
                        height: e.height
                    });
                    b._updateCache(e);
                    b._propagate("resize", l);
                    c.trigger("animating")
                },
                complete: function () {
                    c.trigger("animated")
                }
            })
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    var b = "wijmo-wijprogressbar",
        j = "ui-progressbar",
        i = j + "-label",
        c = b + "-lb-",
        d = "ui-corner-",
        g = d + "left",
        f = d + "right",
        h = d + "top",
        e = d + "bottom";
    a.widget("wijmo.wijprogressbar", a.ui.progressbar, {
        options: {
            labelAlign: "center",
            maxValue: 100,
            minValue: 0,
            fillDirection: "east",
            labelFormatString: "{1}%",
            toolTipFormatString: "{1}%",
            indicatorIncrement: 1,
            indicatorImage: "",
            animationDelay: 0,
            animationOptions: {
                disabled: false,
                easing: null,
                duration: 500
            },
            progressChanging: null,
            beforeProgressChanging: null,
            progressChanged: null
        },
        _setOption: function (c, d) {
            var b = this,
                e = b.options,
                f;
            switch (c) {
                case "value":
                    e[c] = parseInt(d, 10);
                    b._refreshValue();
                    return;
                case "maxValue":
                    e.max = d;
                case "minValue":
                    f = parseInt(d, 10);
                    e[c] = f;
                    b[c === "maxValue" ? "max" : "min"] = f;
                    b._refreshValue(true);
                    return;
                case "labelFormatString":
                case "toolTipFormatString":
                    e[c] = d;
                    b._refreshValue(true);
                    return;
                case "fillDirection":
                case "labelAlign":
                case "indicatorImage":
                    e[c] = d;
                    b._updateElementsCss();
                    return
            }
            a.Widget.prototype._setOption.apply(b, arguments);
            c === "disabled" && b._handleDisabledOption(d, b.element)
        },
        _create: function () {
            var c = this,
                d = c.options,
                e = c.element;
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            c.directions = {
                east: "left",
                west: "right",
                north: "bottom",
                south: "top"
            };
            c.min = d.minValue;
            c.max = d.max = d.maxValue;
            e.addClass(b);
            a.ui.progressbar.prototype._create.apply(c, arguments);
            c.label = a("<span>").addClass(i).appendTo(e);
            c._updateElementsCss();
            c._isInit = true;
            d.disabled && c.disable();
            c._refreshValue()
        },
        _handleDisabledOption: function (b, c) {
            var a = this;
            if (b) {
                if (!a.disabledDiv) a.disabledDiv = a._createDisabledDiv(c);
                a.disabledDiv.appendTo("body")
            } else if (a.disabledDiv) {
                a.disabledDiv.remove();
                a.disabledDiv = null
            }
        },
        _createDisabledDiv: function (d) {
            var h = this,
                b = d ? d : h.element,
                c = b.offset(),
                g = b.outerWidth(),
                f = b.outerHeight(),
                e = {
                    "z-index": "99999",
                    position: "absolute",
                    width: g,
                    height: f,
                    left: c.left,
                    top: c.top
                };
            a.browser.msie && a.extend(e, {
                "background-color": "#fff",
                opacity: .1
            });
            return a("<div></div>").addClass("ui-disabled").css(e)
        },
        _triggerEvent: function (a, c, b) {
            return this._trigger(a, null, {
                oldValue: c,
                newValue: b
            }) === false
        },
        _refreshValue: function (j) {
            var b = this,
                e = b.options,
                g = e.animationOptions,
                h = e.indicatorIncrement,
                i = b.element,
                d, c, f;
            if (!b._isInit) return;
            f = i.attr("aria-valuenow");
            d = b.value();
            c = (d - b.min) / (b.max - b.min) * 100;
            if (b._triggerEvent("beforeProgressChanging", f, d)) return;
            if (!g.disabled && g.duration > 0) setTimeout(function () {
                a.wijmo.wijprogressbar.animations.progress({
                    content: b.valueDiv,
                    complete: function () {
                        if (h !== 1) {
                            b._refreshProgress(c, d);
                            e.labelAlign === "running" && b._updateRunningLabelCss(c)
                        }
                        b._triggerEvent("progressChanged", f, d);
                        b._lastStep = c
                    },
                    step: function (a) {
                        b._performAnimating(a, j)
                    },
                    progressValue: d * 100
                }, g)
            }, e.animationDelay);
            else {
                b._refreshProgress(Math.round(c));
                e.labelAlign === "running" && b._updateRunningLabelCss(c);
                b._lastStep = c;
                b._triggerEvent("progressChanged", f, d)
            }
        },
        _refreshProgress: function (d, c) {
            var b = this,
                i = b.options,
                j = i.fillDirection,
                k = b.element;
            if (c === undefined) c = a.wijmo.wijprogressbar.mul(d, b.max - b.min) / 100 + b.min;
            if (b._triggerEvent("progressChanging", k.attr("aria-valuenow"), c)) return;
            if (b._isHorizontal()) b.valueDiv.toggleClass(j === "east" ? f : g, c === b.max).width(d + "%");
            else b.valueDiv.toggleClass(j === "south" ? e : h, c === b.max).height(d + "%");
            b.label.html(b._getFormatString(i.labelFormatString, d, c));
            k.attr("aria-valuenow", c).attr("title", b._getFormatString(i.toolTipFormatString, d, c))
        },
        _isHorizontal: function () {
            var a = this.options.fillDirection;
            return a === "west" || a === "east"
        },
        _getRotateTextOffset: function (a) {
            var c, b;
            a.css("width", "auto");
            c = a.outerWidth();
            b = a.outerHeight();
            a.css("width", "");
            return Math.max(c - b - 4, 0)
        },
        _updateElementsCss: function () {
            var a = this,
                e = a.options,
                d = a.element,
                c = e.fillDirection;
            d.removeClass(b + "-west " + b + "-east " + b + "-north " + b + "-south").addClass(b + "-" + c);
            a._updateProgressCss();
            a._updateLabelCss()
        },
        _updateLabelCss: function () {
            var d = this,
                i = d.options,
                g = d.element,
                b = i.labelAlign,
                e = d.label,
                f = d._lastStep,
                h = g.height();
            e.removeClass(c + "west " + c + "east " + c + "south " + c + "north " + c + "center " + c + "running").addClass(c + b).css({
                left: "",
                right: "",
                top: "",
                bottom: "",
                width: "",
                "text-align": "",
                "line-height": ""
            });
            b !== "north" && b !== "south" && !(b === "running" && !d._isHorizontal()) && e.css("line-height", h + "px");
            if (b === "running") d._updateRunningLabelCss(f);
            else if (!d._isHorizontal() && !a.browser.msie) if (b === "north") e.css("width", "100%").css("text-align", "right");
            else b === "south" && e.css("width", "100%").css("text-align", "left")
        },
        _updateRunningLabelCss: function (l) {
            var b = this,
                m = b.options,
                i = m.fillDirection,
                k = b.element,
                f = b.label,
                j = b.valueDiv,
                e = b._isHorizontal(),
                c, d, g, h;
            c = k[e ? "width" : "height"]();
            d = f[e ? "outerWidth" : "outerHeight"]();
            g = j[e ? "outerWidth" : "outerHeight"]();
            if (!e && !a.browser.msie) d += b._getRotateTextOffset(f);
            h = c === g ? c - d : l * c / 100 - d + d * (c - g) / c;
            f.css(b.directions[i], h)
        },
        _updateProgressCss: function () {
            var b = this,
                j = b.options,
                k = j.fillDirection,
                i = j.indicatorImage,
                a = b.valueDiv,
                c = b._lastStep;
            i !== "" && a.css("background", "transparent url(" + i + ") repeat fixed");
            a.removeClass(g + " " + f + " " + h + " " + e).addClass(d + b.directions[k]);
            if (typeof c === "number") if (b._isHorizontal()) a.css("width", c + "%").css("height", "");
            else a.css("height", c + "%").css("width", "");
            else a.css({
                width: "",
                height: ""
            })
        },
        _performAnimating: function (i, h) {
            var b = this,
                g = b.options,
                d = g.indicatorIncrement,
                f = i / 100,
                c = a.wijmo.wijprogressbar.div(f - b.min, b.max - b.min) * 100,
                j = 0,
                k, l, e = 2;
            if (d) {
                if (d !== 1) c = Math.floor(c / d) * d;
                else {
                    c = Math.round(c);
                    e = 0
                }
                b.pointNumber = j;
                if (b._lastStep === c && !h) return
            }
            b._refreshProgress(Number(c.toFixed(e)), Number(f.toFixed(e)));
            g.labelAlign === "running" && b._updateRunningLabelCss(c)
        },
        _getFormatString: function (a, d, e) {
            var c = this,
                g = c.max - e,
                f = 100 - d,
                b = /\{0\}/g;
            a = a.replace(b, e.toString());
            b = /\{ProgressValue\}/g;
            a = a.replace(b, e.toString());
            b = /\{1\}/g;
            a = a.replace(b, d.toString());
            b = /\{PercentProgress\}/g;
            a = a.replace(b, d.toString());
            b = /\{2\}/g;
            a = a.replace(b, g.toString());
            b = /\{RemainingProgress\}/g;
            a = a.replace(b, g.toString());
            b = /\{3\}/g;
            a = a.replace(b, f.toString());
            b = /\{PercentageRemaining\}/g;
            a = a.replace(b, f.toString());
            b = /\{4\}/g;
            a = a.replace(b, c.min);
            b = /\{Min\}/g;
            a = a.replace(b, c.min);
            b = /\{5\}/g;
            a = a.replace(b, c.max);
            b = /\{Max\}/g;
            a = a.replace(b, c.max);
            return a
        },
        destroy: function () {
            var c = this,
                d = c.element;
            d.attr("title", "").removeClass(b + " " + b + "-east " + b + "-west " + b + "-north " + b + "-south");
            c.label && c.label.remove();
            if (c.disabledDiv) {
                c.disabledDiv.remove();
                c.disabledDiv = null
            }
            a.ui.progressbar.prototype.destroy.apply(this, arguments)
        }
    });
    a.extend(a.wijmo.wijprogressbar, {
        animations: {
            progress: function (b, c) {
                b = a.extend({
                    easing: "swing",
                    duration: 1e3
                }, b, c);
                b.content.stop(true, true).animate({
                    pgvalue: b.progressValue
                }, b)
            }
        },
        add: function (b, c) {
            var d = 0,
                e = 0,
                a;
            try {
                d = b.toString().split(".")[1].length
            } catch (g) {}
            try {
                e = c.toString().split(".")[1].length
            } catch (f) {}
            a = Math.pow(10, Math.max(d, e));
            return (b * a + c * a) / a
        },
        mul: function (d, e) {
            var a = 0,
                b = d.toString(),
                c = e.toString();
            try {
                a += b.split(".")[1].length
            } catch (g) {}
            try {
                a += c.split(".")[1].length
            } catch (f) {}
            return Number(b.replace(".", "")) * Number(c.replace(".", "")) / Math.pow(10, a)
        },
        div: function (a, b) {
            var e = 0,
                f = 0,
                c, d;
            try {
                e = a.toString().split(".")[1].length
            } catch (h) {}
            try {
                f = b.toString().split(".")[1].length
            } catch (g) {}
            c = Number(a.toString().replace(".", ""));
            d = Number(b.toString().replace(".", ""));
            return c / d * Math.pow(10, f - e)
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    var b = "ui-state-hover",
        c = "wijmo-wijdialog-defaultdockingzone";
    a.widget("wijmo.wijdialog", a.ui.dialog, {
        options: {
            captionButtons: {},
            collapsingAnimation: null,
            expandingAnimation: null,
            contentUrl: "",
            minimizeZoneElementId: "",
            buttonCreating: null,
            stateChanged: null,
            blur: null
        },
        _create: function () {
            var b = this,
                c = b.options;
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            a.isArray(c.buttons) && a.each(c.buttons, function (c, b) {
                var a = b.click;
                if (a && typeof a === "string" && window[a]) b.click = window[a]
            });
            b.form = b.element.closest("form[id]");
            a.ui.dialog.prototype._create.apply(b, arguments);
            b.uiDialog.addClass("wijmo-wijdialog");
            b._initWijWindow();
            b._bindWindowResize();
            b._attachDraggableResizableEvent();
            b.originalPosition = c.position;
            b.isPin = false;
            b.form.length && b.uiDialog.appendTo(b.form)
        },
        _makeDraggable: function () {
            a.ui.dialog.prototype._makeDraggable.apply(this, arguments);
            this.uiDialog.draggable("option", "cancel", ".wijmo-wijdialog-captionbutton")
        },
        _handleDisabledOption: function (c) {
            var b = this;
            if (c) {
                if (!b.disabledDiv) b.disabledDiv = b._createDisabledDiv();
                b.disabledDiv.appendTo("body");
                a.browser.msie && b.uiDialog.draggable("disable")
            } else if (b.disabledDiv) {
                b.disabledDiv.remove();
                b.disabledDiv = null;
                a.browser.msie && b.uiDialog.draggable("enable")
            }
        },
        _createDisabledDiv: function () {
            var f = this,
                b = f.uiDialog,
                c = b.offset(),
                e = b.outerWidth(),
                d = b.outerHeight();
            return a("<div></div>").addClass("ui-disabled").css({
                "z-index": "99999",
                position: "absolute",
                width: e,
                height: d,
                left: c.left,
                top: c.top
            })
        },
        destroy: function () {
            var b = this;
            if (b.disabledDiv) {
                b.disabledDiv.remove();
                b.disabledDiv = null
            }
            a.ui.dialog.prototype.destroy.apply(b, arguments);
            b.element.unbind(".wijdialog").removeData("wijdialog")
        },
        _attachDraggableResizableEvent: function () {
            var a = this,
                b = a.uiDialog,
                c = a.options;
            c.draggable && b.draggable && b.bind("dragstop", function () {
                a._saveNormalState();
                a._destoryIframeMask()
            }).bind("dragstart", function () {
                a._createIframeMask()
            });
            c.resizable && b.resizable && b.bind("resizestop", function () {
                a._saveNormalState();
                a._destoryIframeMask()
            }).bind("resizestart", function () {
                a._createIframeMask()
            })
        },
        _createIframeMask: function () {
            var b = this;
            if (b.innerFrame) b.mask = a("<div style='width:100%;height:100%;position:absolute;top:0px;left:0px;z-index:" + (a.ui.dialog.maxZ + 1) + "'></div>").appendTo(b.uiDialog)
        },
        _destoryIframeMask: function () {
            var a = this;
            if (a.innerFrame && a.mask) {
                a.mask.remove();
                a.mask = undefined
            }
        },
        _initWijWindow: function () {
            var b = this,
                c = true;
            b._createCaptionButtons();
            b._checkUrl();
            b.uiDialog.bind("mousedown", function (c) {
                var d = c.target;
                !a.contains(b.element[0], d) && b.uiDialog.focus()
            }).bind("mouseenter", function () {
                c = true
            }).bind("mouseleave", function () {
                c = false
            }).bind("focusout", function (a) {
                !c && b._trigger("blur", a, {
                    el: b.element
                })
            })
        },
        _checkUrl: function () {
            var b = this,
                e = b.options,
                d = e.contentUrl,
                c = a('<iframe style="width:100%;height:99%;" frameborder="0"></iframe>');
            if (typeof d === "string" && d.length > 0) {
                b.element.addClass("wijmo-wijdialog-hasframe");
                b.element.append(c);
                b.innerFrame = c
            }
            b.contentWrapper = b.element
        },
        _setOption: function (c, d) {
            var b = this;
            a.ui.dialog.prototype._setOption.apply(b, arguments);
            if (c === "disabled") b._handleDisabledOption(d, b.element);
            else if (c === "contentUrl") if (b.innerFrame) b.innerFrame.attr("src", d);
            else b._checkUrl();
            else(c = "captionButtons") && b._createCaptionButtons()
        },
        _createCaptionButtons: function () {
            var c = [],
                b = this,
                h = b.options,
                d, g = {
                    pin: {
                        visible: true,
                        click: b.pin,
                        iconClassOn: "ui-icon-pin-w",
                        iconClassOff: "ui-icon-pin-s"
                    },
                    refresh: {
                        visible: true,
                        click: b.refresh,
                        iconClassOn: "ui-icon-refresh"
                    },
                    toggle: {
                        visible: true,
                        click: b.toggle,
                        iconClassOn: "ui-icon-carat-1-n",
                        iconClassOff: "ui-icon-carat-1-s"
                    },
                    minimize: {
                        visible: true,
                        click: b.minimize,
                        iconClassOn: "ui-icon-minus"
                    },
                    maximize: {
                        visible: true,
                        click: b.maximize,
                        iconClassOn: "ui-icon-extlink"
                    },
                    close: {
                        visible: true,
                        click: b.close,
                        iconClassOn: "ui-icon-close"
                    }
                }, e = h.captionButtons,
                f = b.uiDialogTitlebar;
            f.children(".ui-dialog-titlebar-close, .wijmo-wijdialog-captionbutton").remove();
            a.each(g, function (b, d) {
                e && e[b] && a.extend(d, e[b]);
                c.push({
                    button: b,
                    info: d
                })
            });
            b._trigger("buttonCreating", null, c);
            for (d = 0; d < c.length; d++) b._createCaptionButton(c[d], f)
        },
        _createCaptionButton: function (f, g, k) {
            var j = this,
                d, h = "wijmo-wijdialog-titlebar-" + f.button,
                i = g.children("." + h),
                c = f.info,
                e = a("<span></span>");
            if (c.visible) {
                if (i.size() === 0) {
                    e.addClass("ui-icon " + c.iconClassOn).text(c.text || f.button);
                    d = a('<a href="#"></a>').append(e).addClass(h + " ui-corner-all wijmo-wijdialog-captionbutton").attr("role", "button").hover(function () {
                        d.addClass(b)
                    }, function () {
                        d.removeClass(b)
                    }).click(function () {
                        if (e.hasClass(c.iconClassOff)) e.removeClass(c.iconClassOff);
                        else e.addClass(c.iconClassOff);
                        a.isFunction(c.click) && c.click.apply(j, arguments);
                        return false
                    });
                    if (k) return d;
                    else d.appendTo(g)
                }
                j[f.button + "Button"] = d
            } else i.remove()
        },
        pin: function () {
            var b = this.isPin,
                a = this.pinButton.children("span");
            if (!b) {
                if (a.length)!a.hasClass("ui-icon-pin-s") && a.addClass("ui-icon-pin-s")
            } else a.removeClass("ui-icon-pin-s");
            this._enableDisableDragger(!b);
            this.isPin = !b
        },
        refresh: function () {
            var a = this.innerFrame;
            a !== undefined && a.attr("src", a.attr("src"))
        },
        toggle: function () {
            var a = this,
                b = a.toggleButton.children("span");
            if (!a.minimized) if (a.collapsed === undefined || !a.collapsed) {
                a.collapsed = true;
                !b.hasClass("ui-icon-carat-1-s") && b.addClass("ui-icon-carat-1-s");
                a._collapseDialogContent(true)
            } else {
                a.collapsed = false;
                b.hasClass("ui-icon-carat-1-s") && b.removeClass("ui-icon-carat-1-s");
                a._expandDialogContent(true)
            }
        },
        _expandDialogContent: function (e) {
            var b = this,
                d = b.options,
                c = d.expandingAnimation;
            b.uiDialog.height("auto");
            if (e && c !== null) b.contentWrapper.show(c.animated, c.options, c.duration, function (e) {
                b.uiDialog.css("height", b._toggleHeight);
                a.isFunction(c.callback) && c.callback(e);
                d.resizable && b._enableDisableResizer(false)
            });
            else {
                b.contentWrapper.show();
                d.resizable && b._enableDisableResizer(false);
                b.uiDialog.css("height", b.toggleHeight)
            }
        },
        _collapseDialogContent: function (d) {
            var a = this,
                c = a.options,
                b = c.collapsingAnimation;
            c.resizable && a._enableDisableResizer(true);
            a._toggleHeight = a.uiDialog[0].style.height;
            a.uiDialog.height("auto");
            if (d && b !== null) a.contentWrapper.hide(b.animated, b.options, b.duration);
            else a.contentWrapper.hide();
            a._enableDisableDragger(a.isPin)
        },
        _enableDisableResizer: function (a) {
            var b = this.uiDialog;
            b.resizable({
                disabled: a
            });
            a && b.removeClass("ui-state-disabled")
        },
        _enableDisableDragger: function (a) {
            var b = this.uiDialog;
            if (!this.options.draggable) return;
            b.draggable({
                disabled: a
            });
            a && b.removeClass("ui-state-disabled")
        },
        minimize: function () {
            var b = this,
                k = b.uiDialog,
                q = b.options,
                f = null,
                h = a("<div></div>"),
                j = a("<div></div>"),
                e, n, p, l, g = {}, o, i = {}, d = "uiDialog",
                m;
            if (!b.minimized) {
                l = b.uiDialog.position();
                g.width = b.uiDialog.width();
                g.height = b.uiDialog.height();
                m = b.getState();
                if (b.maximized) {
                    b.maximized = false;
                    b.restoreButton.remove();
                    a(window).unbind(".onWinResize")
                } else {
                    b.collapsed && b._expandDialogContent(false);
                    b._saveNormalState()
                }
                b._enableDisableResizer(true);
                b.collapsed && b._collapseDialogContent(false);
                h.appendTo(document.body).css({
                    top: b.uiDialog.offset().top,
                    left: b.uiDialog.offset().left,
                    height: b.uiDialog.innerHeight(),
                    width: b.uiDialog.innerWidth(),
                    position: "absolute"
                });
                b.contentWrapper.hide();
                b.uiDialogButtonPane.length && b.uiDialogButtonPane.hide();
                k.height("auto");
                k.width("auto");
                b._doButtonAction(b.minimizeButton, "hide");
                b._restoreButton(true, b.minimizeButton, "After");
                b._doButtonAction(b.pinButton, "hide");
                b._doButtonAction(b.refreshButton, "hide");
                b._doButtonAction(b.toggleButton, "hide");
                b._doButtonAction(b.maximizeButton, "show");
                a.browser.webkit && a(".wijmo-wijdialog-captionbutton", b.uiDialog).css("float", "left");
                if (b.innerFrame) {
                    d = "copy";
                    b[d] = b.uiDialog.clone();
                    b[d].empty();
                    b.uiDialogTitlebar.appendTo(b[d])
                }
                if (q.minimizeZoneElementId.length > 0) f = a("#" + q.minimizeZoneElementId);
                if (f !== null && f.size() > 0) f.append(b[d]);
                else {
                    e = a("." + c);
                    if (e.size() === 0) {
                        e = a('<div class="' + c + '"></div>');
                        a(document.body).append(e)
                    }
                    e.append(b[d]).css("z-index", k.css("z-index"))
                }
                b[d].css("position", "static");
                b[d].css("float", "left");
                if (a.browser.msie && a.browser.version === "6.0") {
                    n = a(document).scrollTop();
                    p = document.documentElement.clientHeight - e.height() + n;
                    e.css({
                        position: "absolute",
                        left: "0px",
                        top: p
                    })
                }
                j.appendTo(document.body).css({
                    top: b[d].offset().top,
                    left: b[d].offset().left,
                    height: b[d].innerHeight(),
                    width: b[d].innerWidth(),
                    position: "absolute"
                });
                b.uiDialog.hide();
                b.innerFrame && b[d].hide();
                h.effect("transfer", {
                    to: j,
                    className: "ui-widget-content"
                }, 100, function () {
                    h.remove();
                    j.remove();
                    b[d].show();
                    b.minimized = true;
                    o = b.uiDialog.position();
                    i.width = b.uiDialog.width();
                    i.height = b.uiDialog.height();
                    b._enableDisableDragger(true);
                    b._trigger("resize", null, {
                        originalPosition: l,
                        originalSize: g,
                        position: o,
                        size: i
                    });
                    b._trigger("stateChanged", null, {
                        originalState: m,
                        state: "minimized"
                    })
                })
            }
        },
        _doButtonAction: function (a, c) {
            if (a !== undefined) {
                a.removeClass(b);
                a[c]()
            }
        },
        maximize: function () {
            var b = this,
                h = a(window),
                e, c = {}, f, d = {}, g;
            if (!b.maximized) {
                b._enableDisableDragger(false);
                e = b.uiDialog.position();
                c.width = b.uiDialog.width();
                c.height = b.uiDialog.height();
                if (b.minimized) b.restore();
                else {
                    b.collapsed && b._expandDialogContent(false);
                    b._saveNormalState();
                    g = "normal"
                }
                b.maximized = true;
                if (b.maximizeButton !== undefined) {
                    b.maximizeButton.hide();
                    b._restoreButton(true, b.maximizeButton, "Before")
                }
                a.browser.webkit && a(".wijmo-wijdialog-captionbutton").css("float", "");
                b._onWinResize(b, h);
                b.collapsed && b._collapseDialogContent(false);
                !b.collapsed && b._enableDisableDragger(true);
                b.uiDialog.resizable({
                    disabled: true
                });
                b.uiDialog.removeClass("ui-state-disabled");
                f = b.uiDialog.position();
                d.width = b.uiDialog.width();
                d.height = b.uiDialog.height();
                b._trigger("resize", null, {
                    originalPosition: e,
                    originalSize: c,
                    position: f,
                    size: d
                });
                g === "normal" && b._trigger("stateChanged", null, {
                    originalState: "normal",
                    state: "maximized"
                })
            }
        },
        _bindWindowResize: function () {
            var b = this,
                d = a(window),
                f, e, c;
            d.resize(function () {
                b.maximized && b._onWinResize(b, d)
            });
            a.browser.msie && a.browser.version === "6.0" && d.bind("scroll.wijdialog resize.wijdialog", function () {
                if (b.minimized) {
                    e = a(document).scrollTop();
                    c = b.uiDialog.parent();
                    f = document.documentElement.clientHeight - c.height() + e;
                    c.css({
                        top: f
                    })
                }
            })
        },
        _saveNormalState: function () {
            var a = this,
                b = a.uiDialog,
                c = a.element;
            if (!a.maximized) {
                a.normalWidth = b.css("width");
                a.normalLeft = b.css("left");
                a.normalTop = b.css("top");
                a.normalHeight = b.css("height");
                a.normalInnerHeight = c.css("height");
                a.normalInnerWidth = c.css("width");
                a.normalInnerMinWidth = c.css("min-width");
                a.normalInnerMinHeight = c.css("min-height")
            }
        },
        _onWinResize: function (a, b) {
            a.uiDialog.css("top", b.scrollTop());
            a.uiDialog.css("left", b.scrollLeft());
            a.uiDialog.setOutWidth(b.width());
            a.uiDialog.setOutHeight(b.height());
            a.options.width = a.uiDialog.width();
            a.options.height = a.uiDialog.height();
            a._size();
            if (a.collapsed) {
                a.uiDialog.height("auto");
                a.contentWrapper.hide()
            }
        },
        _restoreButton: function (c, f, e) {
            var a = this,
                d = {
                    button: "restore",
                    info: {
                        visible: c,
                        click: a.restore,
                        iconClassOn: "ui-icon-newwin"
                    }
                }, b = a._createCaptionButton(d, a.uiDialogTitlebar, true);
            if (c) {
                b["insert" + e](f);
                a.restoreButton = b
            }
        },
        _appendToBody: function (a) {
            if (!this.innerFrame) a.appendTo(document.body);
            else {
                this.uiDialogTitlebar.prependTo(a);
                a.show()
            }
        },
        restore: function () {
            var b = this,
                k = b.uiDialog,
                f, d = {}, g, e = {}, i = a("<div></div>"),
                j = a("<div></div>"),
                c = "uiDialog",
                h;
            if (b.minimized) {
                b.minimized = false;
                b._enableDisableDragger(false);
                if (b.innerFrame) {
                    c = "copy";
                    if (!b[c]) c = "uiDialog"
                }
                f = b[c].position();
                d.width = b[c].width();
                d.height = b[c].height();
                i.appendTo(document.body).css({
                    top: b[c].offset().top,
                    left: b[c].offset().left,
                    height: b[c].innerHeight(),
                    width: b[c].innerWidth(),
                    position: "absolute"
                });
                k.css("position", "absolute");
                k.css("float", "");
                b._appendToBody(k);
                b._enableDisableResizer(false);
                !b.isPin && b._enableDisableDragger(false);
                b._restoreToNormal();
                b.contentWrapper.show();
                b.uiDialogButtonPane.length && b.uiDialogButtonPane.show();
                j.appendTo(document.body).css({
                    top: b.uiDialog.offset().top,
                    left: b.uiDialog.offset().left,
                    height: b.uiDialog.innerHeight(),
                    width: b.uiDialog.innerWidth(),
                    position: "absolute"
                });
                b.uiDialog.hide();
                i.effect("transfer", {
                    to: j,
                    className: "ui-widget-content"
                }, 150, function () {
                    b.uiDialog.show();
                    g = b.uiDialog.position();
                    e.width = b.uiDialog.width();
                    e.height = b.uiDialog.height();
                    i.remove();
                    j.remove();
                    b.copy && b.copy.remove();
                    b._trigger("resize", null, {
                        originalPosition: f,
                        originalSize: d,
                        position: g,
                        size: e
                    });
                    h = b.getState();
                    b._trigger("stateChanged", null, {
                        originalState: "minimized",
                        state: h
                    })
                });
                b.collapsed && b._collapseDialogContent();
                b._doButtonAction(b.minimizeButton, "show");
                b._doButtonAction(b.restoreButton, "remove");
                b._doButtonAction(b.pinButton, "show");
                b._doButtonAction(b.refreshButton, "show");
                b._doButtonAction(b.toggleButton, "show");
                a.browser.webkit && a(".wijmo-wijdialog-captionbutton").css("float", "")
            } else if (b.maximized) {
                b.maximized = false;
                f = b.uiDialog.position();
                d.width = b.uiDialog.width();
                d.height = b.uiDialog.height();
                a(window).unbind(".onWinResize");
                b.collapsed && b._expandDialogContent();
                b._enableDisableResizer(false);
                !b.isPin && b._enableDisableDragger(false);
                b._restoreToNormal();
                b.contentWrapper.show();
                b.collapsed && b._collapseDialogContent();
                if (b.maximizeButton !== undefined) {
                    b.maximizeButton.show();
                    b._restoreButton(false, b.maximizeButton, "before")
                }
                g = b.uiDialog.position();
                e.width = b.uiDialog.width();
                e.height = b.uiDialog.height();
                b._trigger("resize", null, {
                    originalPosition: f,
                    originalSize: d,
                    position: g,
                    size: e
                });
                h = b.getState();
                b._trigger("stateChanged", null, {
                    originalState: "maximized",
                    state: h
                })
            }
        },
        getState: function () {
            var a = this;
            return a.minimized ? "minimized" : a.maximized ? "maximized" : "normal"
        },
        reset: function () {
            var a = this;
            a.normalWidth = a.normalLeft = a.normalTop = a.normalHeight = a.normalInnerHeight = a.normalInnerWidth = a.normalInnerMinWidth = a.normalInnerMinHeight = undefined;
            a._setOption("position", a.originalPosition)
        },
        open: function () {
            var b = this,
                c = b.options;
            (c.hide === "drop" || c.hide === "bounce") && a.browser.msie && b.uiDialog.css("filter", "auto");
            if (!b.innerFrame) {
                if (!b.minimized) a.ui.dialog.prototype.open.apply(b, arguments);
                else b.uiDialog.show();
                b.uiDialog.wijTriggerVisibility()
            } else {
                b.innerFrame.attr("src", c.contentUrl);
                if (!b.minimized) a.ui.dialog.prototype.open.apply(b, arguments);
                else b.uiDialogTitlebar.show()
            }
            b.collapsed && b._collapseDialogContent();
            if (c.disabled) if (b.disabledDiv) b.disabledDiv.show();
            else b.disable()
        },
        close: function () {
            var b = this,
                c = b.options;
            if (a.ui.dialog.prototype.close.apply(b, arguments)) {
                if (b.innerFrame) {
                    b.innerFrame.attr("src", "");
                    b.minimized && b.uiDialogTitlebar.hide()
                }
                b.disabledDiv && c.disabled && b.disabledDiv.hide()
            }
        },
        _restoreToNormal: function () {
            var a = this,
                b = a.uiDialog,
                c = a.element;
            b.css("width", a.normalWidth);
            b.css("left", a.normalLeft);
            b.css("top", a.normalTop);
            b.css("height", a.normalHeight);
            c.css("height", a.normalInnerHeight);
            c.css("width", a.normalInnerWidth);
            c.css("min-width", a.normalInnerMinWidth);
            c.css("min-height", a.normalInnerMinHeight);
            a.options.width = a.uiDialog.width();
            a.options.height = a.uiDialog.height()
        }
    });
    a.extend(a.ui.dialog.overlay, {
        create: function (b) {
            a.ui.dialog.latestDlg = b;
            if (this.instances.length === 0) {
                setTimeout(function () {
                    a.ui.dialog.overlay.instances.length && a(document).bind(a.ui.dialog.overlay.events, function (b) {
                        if (a(b.target).zIndex() < a.ui.dialog.overlay.maxZ && !a.contains(a.ui.dialog.latestDlg.element[0], b.target)) return false
                    })
                }, 1);
                a(document).bind("keydown.dialog-overlay", function (c) {
                    if (b.options.closeOnEscape && !c.isDefaultPrevented() && c.keyCode && c.keyCode === a.ui.keyCode.ESCAPE) {
                        b.close(c);
                        c.preventDefault()
                    }
                });
                a(window).bind("resize.dialog-overlay", a.ui.dialog.overlay.resize)
            }
            var c = (this.oldInstances.pop() || a("<div></div>").addClass("ui-widget-overlay")).appendTo(document.body).css({
                width: this.width(),
                height: this.height()
            });
            a.fn.bgiframe && c.bgiframe();
            this.instances.push(c);
            return c
        },
        height: function () {
            var b, c;
            if (a.browser.msie) {
                b = Math.max(document.documentElement.scrollHeight, document.body.scrollHeight);
                c = Math.max(document.documentElement.offsetHeight, document.body.offsetHeight);
                return b < c ? a(window).height() + "px" : b + "px"
            } else return a(document).height() + "px"
        },
        width: function () {
            var b, c;
            if (a.browser.msie) {
                b = Math.max(document.documentElement.scrollWidth, document.body.scrollWidth);
                c = Math.max(document.documentElement.offsetWidth, document.body.offsetWidth);
                return b < c ? a(window).width() + "px" : b + "px"
            } else return a(document).width() + "px"
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    a.widget("wijmo.wijaccordion", {
        widgetEventPrefix: "wijaccordion",
        options: {
            animated: "slide",
            duration: null,
            event: "click",
            disabled: false,
            expandDirection: "bottom",
            header: "> li > :first-child,> :not(li):even",
            requireOpenedPane: true,
            selectedIndex: 0
        },
        _setOption: function (d, b) {
            var c = this.options;
            if (c[d] !== b) switch (d) {
                case "selectedIndex":
                    this.activate(b);
                    break;
                case "disabled":
                    if (b) this.element.addClass("ui-state-disabled");
                    else this.element.removeClass("ui-state-disabled");
                    break;
                case "event":
                    this._unbindLiveEvents();
                    this.options.event = b;
                    this._bindLiveEvents();
                    break;
                case "header":
                    this._handleHeaderChange(b, c.header);
                    break;
                case "expandDirection":
                    this._onDirectionChange(b, true, c.expandDirection)
            }
            a.Widget.prototype._setOption.apply(this, arguments)
        },
        _handleHeaderChange: function (b, a) {
            var c = this.element.find(a);
            c.removeClass("wijmo-wijaccordion-header ui-helper-reset ui-state-active " + this._triangleIconOpened).siblings(".wijmo-wijaccordion-content").removeClass("wijmo-wijaccordion-content ui-helper-reset ui-widget-content wijmo-wijaccordion-content-active");
            this._initHeaders(b)
        },
        _initHeaders: function (a) {
            var c = this.options,
                a = a ? a : c.header,
                b = this.element.find(a);
            b.each(jQuery.proxy(this._initHeader, this))
        },
        _initHeader: function (e, f) {
            var g = this.options,
                d = this.element.data("rightToLeft"),
                b = a(f),
                c = a(b.next()[0]);
            if (d) {
                b.remove();
                b.insertAfter(c)
            }
            b.addClass("wijmo-wijaccordion-header ui-helper-reset").attr("role", "tab");
            c.attr("role", "tabpanel");
            b.find("> a").length === 0 && b.wrapInner('<a href="#"></a>');
            b.find("> .ui-icon").length === 0 && a('<span class="ui-icon"></span>').insertBefore(a("> a", b)[0]);
            if (e === g.selectedIndex) {
                b.addClass("ui-state-active").addClass(this._headerCornerOpened).attr({
                    "aria-expanded": "true",
                    tabIndex: 0
                }).find("> .ui-icon").addClass(this._triangleIconOpened);
                c.addClass("wijmo-wijaccordion-content-active").addClass(this._contentCornerOpened).wijTriggerVisibility()
            } else {
                b.addClass("ui-state-default ui-corner-all").attr({
                    "aria-expanded": "false",
                    tabIndex: -1
                }).find("> .ui-icon").addClass(this._triangleIconClosed);
                c.hide()
            }
            c.addClass("wijmo-wijaccordion-content ui-helper-reset ui-widget-content")
        },
        _create: function () {
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            this.element.addClass("wijmo-wijaccordion ui-widget wijmo-wijaccordion-icons ui-helper-reset ui-helper-clearfix");
            var b = this.options;
            b.disabled && this.element.addClass("ui-state-disabled");
            this._onDirectionChange(b.expandDirection, false);
            this._initHeaders();
            this.element.attr("role", "tablist");
            a.Widget.prototype._create.apply(self, arguments)
        },
        _init: function () {
            this._bindLiveEvents()
        },
        destroy: function () {
            this._unbindLiveEvents();
            this.element.removeClass("wijmo-wijaccordion ui-widget ui-helper-reset wijmo-wijaccordion-icons").removeAttr("role");
            a.Widget.prototype.destroy.apply(this, arguments)
        },
        _getHeaders: function () {
            var g = this.options,
                f = this.element.data("rightToLeft"),
                e = [],
                c, d, b = this.element.find(g.header);
            if (b.length > 0 && !a(b[0]).hasClass("wijmo-wijaccordion-header") && a(b[0]).hasClass("wijmo-wijaccordion-content")) for (c = 0; c < b.length; c += 1) {
                d = f ? a(b[c]).next(".wijmo-wijaccordion-header") : a(b[c]).prev(".wijmo-wijaccordion-header");
                d.length > 0 && e.push(d[0])
            } else return b;
            return a(e)
        },
        activate: function (f) {
            var b, d = this.options,
                j = this._getHeaders(),
                c, p = this.element.data("rightToLeft"),
                i, l, g, h, m, o, n, k, q, e;
            c = a(jQuery.grep(j, function (b) {
                return a(b).hasClass("ui-state-active")
            }));
            if (typeof f === "number") b = a(j[f]);
            else if (typeof f === "string") {
                f = parseInt(f, 0);
                b = a(j[f])
            } else {
                b = a(f);
                f = j.index(f)
            }
            if (b.hasClass("ui-state-disabled")) return false;
            if (b.hasClass("ui-state-active")) if (d.requireOpenedPane) {
                if (c.length === b.length && c.index() === b.index()) return false
            } else {
                c = b;
                b = a(null)
            } else if (!d.requireOpenedPane) c = a(null);
            i = j.index(b);
            l = j.index(c);
            g = p ? b.prev(".wijmo-wijaccordion-content") : b.next(".wijmo-wijaccordion-content");
            h = p ? c.prev(".wijmo-wijaccordion-content") : c.next(".wijmo-wijaccordion-content");
            if (c.length === 0 && b.length === 0) return false;
            if (!this._trigger("beforeSelectedIndexChanged", null, {
                newIndex: i,
                prevIndex: l
            })) return false;
            c.removeClass("ui-state-active").removeClass(this._headerCornerOpened).addClass("ui-state-default ui-corner-all").attr({
                "aria-expanded": "false",
                tabIndex: -1
            }).find("> .ui-icon").removeClass(this._triangleIconOpened).addClass(this._triangleIconClosed);
            b.removeClass("ui-state-default ui-corner-all").addClass("ui-state-active").addClass(this._headerCornerOpened).attr({
                "aria-expanded": "true",
                tabIndex: 0
            }).find("> .ui-icon").removeClass(this._triangleIconClosed).addClass(this._triangleIconOpened);
            if (d.animated) {
                m = {
                    toShow: g,
                    toHide: h,
                    complete: jQuery.proxy(function () {
                        h.removeClass("wijmo-wijaccordion-content-active");
                        g.addClass("wijmo-wijaccordion-content-active").wijTriggerVisibility();
                        h.css("display", "");
                        g.css("display", "");
                        if (a.fn.wijlinechart) {
                            h.find(".wijmo-wijlinechart").wijlinechart("redraw");
                            g.find(".wijmo-wijlinechart").wijlinechart("redraw")
                        }
                        this._trigger("selectedIndexChanged", null, {
                            newIndex: i,
                            prevIndex: l
                        })
                    }, this),
                    horizontal: this.element.hasClass("ui-helper-horizontal"),
                    rightToLeft: this.element.data("rightToLeft"),
                    down: i > l,
                    autoHeight: d.autoHeight || d.fillSpace
                };
                o = d.animated;
                n = d.duration;
                if (a.isFunction(o)) d.animated = o(m);
                if (a.isFunction(n)) d.duration = n(m);
                k = a.wijmo.wijaccordion.animations;
                q = d.duration;
                e = d.animated;
                if (e && !k[e] && !a.easing[e]) e = "slide";
                if (!k[e]) k[e] = function (a) {
                    this.slide(a, {
                        easing: e,
                        duration: q || 700
                    })
                };
                k[e](m)
            } else {
                c.length > 0 && h.hide().removeClass("wijmo-wijaccordion-content-active");
                b.length > 0 && g.show().addClass("wijmo-wijaccordion-content-active").addClass(this._contentCornerOpened).wijTriggerVisibility();
                if (a.fn.wijlinechart) {
                    h.find(".wijmo-wijlinechart").wijlinechart("redraw");
                    g.find(".wijmo-wijlinechart").wijlinechart("redraw")
                }
                this._trigger("selectedIndexChanged", null, {
                    newIndex: i,
                    prevIndex: l
                })
            }
            this.options.selectedIndex = i
        },
        _bindLiveEvents: function () {
            this.element.find(".wijmo-wijaccordion-header").live(this.options.event + ".wijaccordion", jQuery.proxy(this._onHeaderClick, this)).live("keydown.wijaccordion", jQuery.proxy(this._onHeaderKeyDown, this)).live("mouseenter.wijaccordion", function () {
                a(this).addClass("ui-state-hover")
            }).live("mouseleave.wijaccordion", function () {
                a(this).removeClass("ui-state-hover")
            }).live("focus.wijaccordion", function () {
                a(this).addClass("ui-state-focus")
            }).live("blur.wijaccordion", function () {
                a(this).removeClass("ui-state-focus")
            })
        },
        _unbindLiveEvents: function () {
            this.element.find(".wijmo-wijaccordion-header").die(".wijaccordion")
        },
        _onHeaderClick: function (a) {
            !this.options.disabled && this.activate(a.currentTarget);
            return false
        },
        _onHeaderKeyDown: function (d) {
            if (this.options.disabled || d.altKey || d.ctrlKey) return;
            var b = a.ui.keyCode,
                f = this.element.find(".wijmo-wijaccordion-header.ui-state-focus"),
                c, e = this._getHeaders();
            if (f.length > 0) {
                c = a(".wijmo-wijaccordion-header", this.element).index(f);
                switch (d.keyCode) {
                    case b.RIGHT:
                    case b.DOWN:
                        if (e[c + 1]) {
                            e[c + 1].focus();
                            return false
                        }
                        break;
                    case b.LEFT:
                    case b.UP:
                        if (e[c - 1]) {
                            e[c - 1].focus();
                            return false
                        }
                        break;
                    case b.SPACE:
                    case b.ENTER:
                        this.activate(d.currentTarget);
                        d.preventDefault()
                }
            }
            return true
        },
        _onDirectionChange: function (j, e, i) {
            var b, g, f, d, c, h;
            if (e) {
                g = this.element.find(".wijmo-wijaccordion-header." + this._headerCornerOpened);
                g.removeClass(this._headerCornerOpened);
                f = this.element.find(".wijmo-wijaccordion-content." + this._contentCornerOpened);
                f.removeClass(this._contentCornerOpened);
                d = this.element.find("." + this._triangleIconOpened);
                c = this.element.find("." + this._triangleIconClosed);
                d.removeClass(this._triangleIconOpened);
                c.removeClass(this._triangleIconClosed)
            }
            i !== null && this.element.removeClass("wijmo-wijaccordion-" + i);
            switch (j) {
                case "top":
                    this._headerCornerOpened = "ui-corner-bottom";
                    this._contentCornerOpened = "ui-corner-top";
                    this._triangleIconOpened = "ui-icon-triangle-1-n";
                    this._triangleIconClosed = "ui-icon-triangle-1-e";
                    b = true;
                    this.element.removeClass("ui-helper-horizontal");
                    this.element.addClass("wijmo-wijaccordion-top");
                    break;
                case "right":
                    this._headerCornerOpened = "ui-corner-left";
                    this._contentCornerOpened = "ui-corner-right";
                    this._triangleIconOpened = "ui-icon-triangle-1-e";
                    this._triangleIconClosed = "ui-icon-triangle-1-s";
                    b = false;
                    this.element.addClass("ui-helper-horizontal");
                    this.element.addClass("wijmo-wijaccordion-right");
                    break;
                case "left":
                    this._headerCornerOpened = "ui-corner-right";
                    this._contentCornerOpened = "ui-corner-left";
                    this._triangleIconOpened = "ui-icon-triangle-1-w";
                    this._triangleIconClosed = "ui-icon-triangle-1-s";
                    b = true;
                    this.element.addClass("ui-helper-horizontal");
                    this.element.addClass("wijmo-wijaccordion-left");
                    break;
                default:
                    this._headerCornerOpened = "ui-corner-top";
                    this._contentCornerOpened = "ui-corner-bottom";
                    this._triangleIconOpened = "ui-icon-triangle-1-s";
                    this._triangleIconClosed = "ui-icon-triangle-1-e";
                    b = false;
                    this.element.removeClass("ui-helper-horizontal");
                    this.element.addClass("wijmo-wijaccordion-bottom")
            }
            h = this.element.data("rightToLeft");
            this.element.data("rightToLeft", b);
            if (e) {
                d.addClass(this._triangleIconOpened);
                c.addClass(this._triangleIconClosed);
                g.addClass(this._headerCornerOpened);
                f.addClass(this._contentCornerOpened)
            }
            e && b !== h && this.element.children(".wijmo-wijaccordion-header").each(function () {
                var c = a(this),
                    d;
                if (b) {
                    d = c.next(".wijmo-wijaccordion-content");
                    c.remove();
                    c.insertAfter(d)
                } else {
                    d = c.prev(".wijmo-wijaccordion-content");
                    c.remove();
                    c.insertBefore(d)
                }
            })
        }
    });
    a.extend(a.wijmo.wijaccordion, {
        animations: {
            slide: function (b, h) {
                b = a.extend({
                    easing: "swing",
                    duration: 300
                }, b, h);
                if (!b.toHide.size()) {
                    b.toShow.stop(true, true).animate(b.horizontal ? {
                        width: "show"
                    } : {
                        height: "show"
                    }, b);
                    return
                }
                if (!b.toShow.size()) {
                    b.toHide.stop(true, true).animate(b.horizontal ? {
                        width: "hide"
                    } : {
                        height: "hide"
                    }, b);
                    return
                }
                var i = b.toShow.css("overflow"),
                    f = 0,
                    e = {}, g = {}, j = b.horizontal ? ["width", "paddingLeft", "paddingRight"] : ["height", "paddingTop", "paddingBottom"],
                    d, c = b.toShow;
                if (b.horizontal) {
                    d = c[0].style.height;
                    c.height(parseInt(c.parent().height(), 10) - parseInt(c.css("paddingTop"), 10) - parseInt(c.css("paddingBottom"), 10) - (parseInt(c.css("borderTopWidth"), 10) || 0) - (parseInt(c.css("borderBottomWidth"), 10) || 0))
                } else {
                    d = c[0].style.width;
                    c.width(parseInt(c.parent().width(), 10) - parseInt(c.css("paddingLeft"), 10) - parseInt(c.css("paddingRight"), 10) - (parseInt(c.css("borderLeftWidth"), 10) || 0) - (parseInt(c.css("borderRightWidth"), 10) || 0))
                }
                a.each(j, function (f, d) {
                    g[d] = "hide";
                    var c = ("" + a.css(b.toShow[0], d)).match(/^([\d+-.]+)(.*)$/);
                    e[d] = {
                        value: c ? c[1] : 0,
                        unit: c ? c[2] || "px" : "px"
                    }
                });
                b.toShow.css(b.horizontal ? {
                    width: 0,
                    overflow: "hidden"
                } : {
                    height: 0,
                    overflow: "hidden"
                }).stop(true, true).show();
                b.toHide.filter(":hidden").each(b.complete).end().filter(":visible").stop(true, true).animate(g, {
                    step: function (d, a) {
                        var c;
                        if (a.prop === b.horizontal ? "width" : "height") f = a.end - a.start === 0 ? 0 : (a.now - a.start) / (a.end - a.start);
                        c = f * e[a.prop].value;
                        if (c < 0) c = 0;
                        b.toShow[0].style[a.prop] = c + e[a.prop].unit
                    },
                    duration: b.duration,
                    easing: b.easing,
                    complete: function () {
                        !b.autoHeight && b.toShow.css(b.horizontal ? "width" : "height", "");
                        b.toShow.css(b.horizontal ? "height" : "width", d);
                        b.toShow.css({
                            overflow: i
                        });
                        b.complete()
                    }
                })
            },
            bounceslide: function (a) {
                this.slide(a, {
                    easing: a.down ? "easeOutBounce" : "swing",
                    duration: a.down ? 1e3 : 200
                })
            }
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    a.fn.extend({
        getBounds: function () {
            return a.extend({}, a(this).offset(), {
                width: a(this).outerWidth(true),
                height: a(this).outerHeight(true)
            })
        },
        setBounds: function (b) {
            a(this).css({
                left: b.left,
                top: b.top
            }).width(b.width).height(b.height);
            return this
        },
        getMaxZIndex: function () {
            var b = (a(this).css("z-index") === "auto" ? 0 : a(this).css("z-index")) * 1;
            a(this).siblings().each(function (d, c) {
                b = Math.max(b, (a(c).css("z-index") === "auto" ? 0 : a(c).css("z-index")) * 1)
            });
            return b
        }
    });
    a.widget("wijmo.wijpopup", {
        options: {
            ensureOutermost: false,
            showEffect: "show",
            showOptions: {},
            showDuration: 300,
            hideEffect: "hide",
            hideOptions: {},
            hideDuration: 100,
            autoHide: false,
            position: {
                at: "left bottom",
                my: "left top"
            },
            showing: null,
            shown: null,
            hiding: null,
            hidden: null,
            posChanged: null
        },
        _create: function () {
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a)
        },
        _init: function () {
            if ( !! this.options.ensureOutermost) {
                var b = a("form");
                if (b.length === 0) b = a(document.body);
                this.element.appendTo(b)
            }
            this.element.data("visible.wijpopup", false);
            this.element.css("position", "absolute");
            this.element.position({
                of: a(document.body)
            });
            this.element.hide()
        },
        _setOption: function (c) {
            a.Widget.prototype._setOption.apply(this, arguments);
            if (c === "autoHide") {
                var b = this.isVisible();
                this.hide();
                b && this.show()
            }
        },
        destroy: function () {
            a.Widget.prototype.destroy.apply(this, arguments);
            this.isVisible() && this.hide();
            if (a.browser.msie && a.browser.version < 7) {
                jFrame = this.element.data("backframe.wijpopup");
                !jFrame && jFrame.remove()
            }
            var b = this;
            this.element.unbind(".wijpopup");
            a.each(["visible", "backframe", "animating", "width"], function (c, a) {
                b.element.removeData(a + ".wijpopup")
            })
        },
        isVisible: function () {
            return !!this.element.data("visible.wijpopup") && this.element.is(":visible")
        },
        isAnimating: function () {
            return !!this.element.data("animating.wijpopup")
        },
        _pushQueue: function () {
            var c = a(window),
                b = c.data("wijPopupQueue"),
                d;
            if (!b) {
                b = [];
                c.data("wijPopupQueue", b)
            }
            return b.push(this)
        },
        show: function (d) {
            this._setPosition(d);
            if (this.isVisible()) return;
            if (this._trigger("showing") === false) return;
            var e = this;
            if (this.options.autoHide) this._pushQueue() === 1 && a(document).bind("mouseup.wijpopup", function (a) {
                e._onDocMouseUp(a)
            });
            var b = this.options.showEffect || "show",
                c = this.options.showDuration || 300,
                f = this.options.showOptions || {};
            this.element.data("animating.wijpopup", true);
            if (a.effects && (a.effects[b] || a.effects.effect && a.effects.effect[b])) this.element.show(b, f, c, a.proxy(this._showCompleted, this));
            else if (this.element[b]) this.element[b](b === "show" ? null : c, a.proxy(this._showCompleted, this));
            else this.element.show();
            (!b || !c || b === "show" || c <= 0) && this._showCompleted()
        },
        _showCompleted: function () {
            this.element.removeData("animating.wijpopup");
            this.element.data("visible.wijpopup", true);
            this._trigger("shown")
        },
        showAt: function (a, b) {
            this.show({
                my: "left top",
                at: "left top",
                of: document.body,
                offset: "" + a + " " + b
            })
        },
        hide: function () {
            if (!this.isVisible()) return;
            if (this._trigger("hiding") === false) return;
            var b = this.options.hideEffect || "hide",
                c = this.options.hideDuration || 300,
                d = this.options.hideOptions || {};
            this.element.data("animating.wijpopup", true);
            if (a.effects && (a.effects[b] || a.effects.effect && a.effects.effect[b])) this.element.hide(b, d, c, a.proxy(this._hideCompleted, this));
            else if (this.element[b]) this.element[b](b === "hide" ? null : c, a.proxy(this._hideCompleted, this));
            else this.element.hide();
            (!b || !c || b === "hide" || c <= 0) && this._hideCompleted()
        },
        _hideCompleted: function () {
            if (this.element.data("width.wijpopup") !== undefined) {
                this.element.width(this.element.data("width.wijpopup"));
                this.element.removeData("width.wijpopup")
            }
            this.element.removeData("animating.wijpopup").unbind("move.wijpopup");
            if (a.browser.msie && a.browser.version < 7) {
                var b = this.element.data("backframe.wijpopup");
                b && b.hide()
            }
            this._trigger("hidden")
        },
        _onDocMouseUp: function (e) {
            var f = a(window),
                c = a(e.target ? e.target : e.srcElement),
                d = f.data("wijPopupQueue"),
                b;
            if (c.parents().hasClass("wijmo-wijcombobox-list") || c.parents().hasClass("wijmo-wijcalendar")) return;
            if ( !! d) {
                while (b = d.pop()) if (b.isVisible()) {
                    if ( !! b.options.autoHide) {
                        if (c.get(0) != b.element.get(0) && c.parents().index(b.element) < 0) b.hide();
                        else d.push(b);
                        break
                    }
                } else break;
                d.length === 0 && a(document).unbind("mouseup.wijpopup")
            }
        },
        _onMove: function () {
            var a = this.element.data("backframe.wijpopup");
            if (a) {
                this.element.before(a);
                a.css({
                    top: this.element.css("top"),
                    left: this.element.css("left")
                })
            }
        },
        _addBackgroundIFrame: function () {
            if (a.browser.msie && a.browser.version < 7) {
                var b = this.element.data("backframe.wijpopup");
                if (!b) {
                    b = jQuery("<iframe/>").css({
                        position: "absolute",
                        display: "none",
                        filter: "progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)"
                    }).attr({
                        src: "javascript:'<html></html>';",
                        scrolling: "no",
                        frameborder: "0",
                        "tabIndex ": -1
                    });
                    this.element.before(b);
                    this.element.data("backframe.wijpopup", b);
                    this.element.bind("move.wijpopup", a.proxy(this._onMove, this))
                }
                b.setBounds(this.element.getBounds());
                b.css({
                    display: "block",
                    left: this.element.css("left"),
                    top: this.element.css("top"),
                    "z-index": this.element.css("z-index") - 1
                })
            }
        },
        _setZIndex: function (b) {
            this.element.css("z-index", b);
            var a = this.element.data("backframe.wijpopup");
            a && a.css("z-index", this.element.css("z-index") - 1)
        },
        _setPosition: function (c) {
            var d = this.element.is(":visible");
            this.element.show();
            this.element.position(a.extend({}, this.options.position, c ? c : {}));
            !d && this.element.hide();
            this._addBackgroundIFrame();
            var b = 1e3;
            if (this.options.position.of) b = Math.max(b, a(this.options.position.of).getMaxZIndex());
            this._setZIndex(b + 10);
            this._trigger("posChanged")
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    var i = "wijmo-wijsuperpanel ui-widget ui-widget-content",
        h = "ui-corner-all",
        b = "ui-state-disabled",
        f = "ui-state-hover",
        g = "ui-state-active",
        e = "ui-state-default",
        c = "wijmo-wijsuperpanel-handle",
        d = "wijmo-wijsuperpanel-hbarcontainer",
        j = "wijmo-wijsuperpanel-vbarcontainer",
        l = "<div class='wijmo-wijsuperpanel-statecontainer'><div class='wijmo-wijsuperpanel-contentwrapper'><div class='wijmo-wijsuperpanel-templateouterwrapper'></div></div></div>",
        k = "<div class='wijmo-wijsuperpanel-hbarcontainer ui-widget-header'><div class='wijmo-wijsuperpanel-handle ui-state-default ui-corner-all'><span class='ui-icon ui-icon-grip-solid-vertical'></span></div><div class='wijmo-wijsuperpanel-hbar-buttonleft ui-state-default ui-corner-bl'><span class='ui-icon ui-icon-triangle-1-w'></span></div><div class='wijmo-wijsuperpanel-hbar-buttonright ui-state-default ui-corner-br'><span class='ui-icon ui-icon-triangle-1-e'></span></div></div>",
        n = "<div class='wijmo-wijsuperpanel-vbarcontainer ui-widget-header'><div class='wijmo-wijsuperpanel-handle ui-state-default ui-corner-all'><span class='ui-icon ui-icon-grip-solid-horizontal'></span></div><div class='wijmo-wijsuperpanel-vbar-buttontop ui-state-default ui-corner-tr'><span class='ui-icon ui-icon-triangle-1-n'></span></div><div class='wijmo-wijsuperpanel-vbar-buttonbottom ui-state-default ui-corner-br'><span class='ui-icon ui-icon-triangle-1-s'></span></div></div>",
        m = "<div class='ui-state-default wijmo-wijsuperpanel-button wijmo-wijsuperpanel-buttonleft'><span class='ui-icon ui-icon-carat-1-w'></span></div><div class='ui-state-default wijmo-wijsuperpanel-button wijmo-wijsuperpanel-buttonright'><span class='ui-icon ui-icon-carat-1-e'></span></div>",
        o = "<div class='ui-state-default wijmo-wijsuperpanel-button wijmo-wijsuperpanel-buttontop'><span class='ui-icon ui-icon-carat-1-n'></span></div><div class='ui-state-default wijmo-wijsuperpanel-button wijmo-wijsuperpanel-buttonbottom'><span class='ui-icon ui-icon-carat-1-s'></span></div>";
    a.widget("wijmo.wijsuperpanel", {
        options: {
            allowResize: false,
            autoRefresh: false,
            animationOptions: {
                queue: false,
                disabled: false,
                duration: 250,
                easing: undefined
            },
            hScrollerActivating: null,
            hScroller: {
                scrollBarPosition: "bottom",
                scrollBarVisibility: "auto",
                scrollMode: "scrollBar",
                scrollValue: null,
                scrollMax: 100,
                scrollMin: 0,
                scrollLargeChange: null,
                scrollSmallChange: null,
                scrollMinDragLength: 6,
                increaseButtonPosition: null,
                decreaseButtonPosition: null,
                hoverEdgeSpan: 20,
                firstStepChangeFix: 0
            },
            keyboardSupport: false,
            keyDownInterval: 100,
            mouseWheelSupport: true,
            bubbleScrollingEvent: true,
            resizableOptions: {
                handles: "all",
                helper: "ui-widget-content wijmo-wijsuperpanel-helper"
            },
            resized: null,
            dragStop: null,
            painted: null,
            scrolling: null,
            scroll: null,
            scrolled: null,
            showRounder: true,
            vScrollerActivating: null,
            vScroller: {
                scrollBarPosition: "right",
                scrollBarVisibility: "auto",
                scrollMode: "scrollBar",
                scrollValue: null,
                scrollMax: 100,
                scrollMin: 0,
                scrollLargeChange: null,
                scrollSmallChange: null,
                scrollMinDragLength: 6,
                increaseButtonPosition: null,
                decreaseButtonPosition: null,
                hoverEdgeSpan: 20,
                firstStepChangeFix: 0
            },
            customScrolling: false,
            listenContentScroll: false
        },
        _setOption: function (d, b) {
            var c = this,
                h = c.options,
                g = c._fields(),
                e = g.hbarDrag,
                f = g.vbarDrag,
                i = g.resizer;
            if (d === "animationOptions") b = a.extend(h.animationOptions, b);
            else if (d === "hScroller") {
                if (b.scrollLargeChange !== undefined && b.scrollLargeChange !== null) c._autoHLarge = false;
                b = a.extend(h.hScroller, b)
            } else if (d === "vScroller") {
                if (b.scrollLargeChange !== undefined && b.scrollLargeChange !== null) c._autoVLarge = false;
                b = a.extend(h.vScroller, b)
            } else if (d === "resizableOptions") b = a.extend(c.resizableOptions, b);
            a.Widget.prototype._setOption.apply(c, arguments);
            if (a.isPlainObject(b)) c.options[d] = b;
            switch (d) {
                case "allowResize":
                    c._initResizer();
                    break;
                case "disabled":
                    if (b) {
                        e !== undefined && e.draggable("disable");
                        f !== undefined && f.draggable("disable");
                        i !== undefined && i.resizable("disable")
                    } else {
                        e !== undefined && e.draggable("enable");
                        f !== undefined && f.draggable("enable");
                        i !== undefined && i.resizable("enable")
                    }
                    break;
                case "mouseWheelSupport":
                case "keyboardSupport":
                    c._bindElementEvents(c, g, c.element, h)
            }
            return c
        },
        _create: function () {
            var b = this,
                c = b.options;
            c.vScroller.dir = "v";
            c.hScroller.dir = "h";
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            b.paintPanel();
            b._initResizer();
            b.options.disabled && b.disable();
            b._detectAutoRefresh();
            c.listenContentScroll && b._listenContentScroll();
            b.element.is(":hidden") && b.element.wijAddVisibilityObserver && b.element.wijAddVisibilityObserver(function () {
                b.refresh();
                b.element.wijRemoveVisibilityObserver && b.element.wijRemoveVisibilityObserver()
            }, "wijsuperpanel")
        },
        _detectAutoRefresh: function () {
            var c = this,
                b = a.wijmo.wijsuperpanel.panels;
            if (b === undefined) {
                b = [];
                a.wijmo.wijsuperpanel.panels = b
            }
            b.push(c);
            if (c.options.autoRefresh) if (!a.wijmo.wijsuperpanel.setAutoRefreshInterval) {
                a.wijmo.wijsuperpanel.setAutoRefreshInterval = c._setAutoRefreshInterval;
                a.wijmo.wijsuperpanel.setAutoRefreshInterval()
            }
        },
        _setAutoRefreshInterval: function () {
            var b = a.wijmo.wijsuperpanel.autoRereshInterval,
                c = a.wijmo.wijsuperpanel.panels,
                d = window.setInterval(function () {
                    window.clearInterval(d);
                    for (var k = c.length, j = false, b, g, i, f, e, h = 0; h < k; h++) {
                        b = c[h];
                        g = b.element[0];
                        i = b.options.autoRefresh;
                        if (i) j = true;
                        f = b.getContentElement();
                        e = b._paintedMark;
                        b.options.autoRefresh && f.is(":visible") && (e === undefined || e.width !== f[0].offsetWidth || e.height !== f[0].offsetHeight || e.mainWidth !== g.offsetWidth || e.mainHeight !== g.offsetHeight) && b.paintPanel()
                    }
                    j && window.setTimeout(a.wijmo.wijsuperpanel.setAutoRefreshInterval, 0)
                }, b === undefined ? 500 : b)
        },
        destroy: function () {
            var c = this,
                b = c._fields(),
                d = c.element,
                f, e;
            a.wijmo.wijsuperpanel.panels = a.grep(a.wijmo.wijsuperpanel.panels, function (a) {
                return a !== c
            });
            if (!b.initialized) return;
            c._radiusKey && c.element.css(c._radiusKey, "");
            if (b.intervalID !== undefined) {
                window.clearInterval(b.intervalID);
                b.intervalID = undefined
            }
            b.resizer !== undefined && b.resizer.resizable("destroy");
            if (b.hbarContainer !== undefined) {
                b.hbarDrag.remove();
                b.hbarContainer.unbind("." + c.widgetName)
            }
            if (b.vbarContainer !== undefined) {
                b.vbarDrag.remove();
                b.vbarContainer.unbind("." + c.widgetName)
            }
            d.unbind("." + c.widgetName);
            b.contentWrapper.unbind("." + c.widgetName);
            f = b.stateContainer.find(">.wijmo-wijsuperpanel-button");
            f.unbind("." + c.widgetName);
            e = b.templateWrapper;
            e.contents().each(function (b, a) {
                d.append(a)
            });
            b.stateContainer.remove();
            b.tabindex && d.removeAttr("tabindex");
            d.removeClass(i + " " + h);
            a.Widget.prototype.destroy.apply(c, arguments)
        },
        _fields: function () {
            var b = this,
                c = b.element,
                d = b.widgetName + "-fields",
                a = b._fieldsStore;
            if (a === undefined) {
                a = {};
                c.data(d, a);
                b._fieldsStore = a
            }
            return a
        },
        _hasMode: function (c, d) {
            var b = c.scrollMode.split(",");
            b = a.map(b, function (b) {
                return a.trim(b).toLowerCase()
            });
            return a.inArray(d.toLowerCase(), b) > -1
        },
        _bindElementEvents: function (a, g, b, d) {
            var e = a._hasMode(d.hScroller, "edge"),
                f = a._hasMode(d.vScroller, "edge"),
                c = a.widgetName;
            if (e || f) {
                if (a._mousemoveBind === undefined) {
                    a._mousemoveBind = true;
                    b.bind("mousemove." + c, a, a._contentMouseMove);
                    b.bind("mouseleave." + c, null, function () {
                        a._clearInterval()
                    })
                }
            } else {
                b.unbind("mousemove", a._contentMouseMove);
                a._mousemoveBind = undefined
            }
            if (d.mouseWheelSupport) {
                if (a._mouseWheelBind === undefined) {
                    a._mouseWheelBind = true;
                    b.bind("mousewheel." + c, a, a._panelMouseWheel)
                }
            } else {
                a.element.unbind("mousewheel", a._panelMouseWheel);
                a._mouseWheelBind = undefined
            }
            if (d.keyboardSupport) {
                if (a._keyboardBind === undefined) {
                    a._keyboardBind = true;
                    b.bind("keydown." + c, a, a._panelKeyDown)
                }
            } else {
                b.unbind("keydown", a._panelKeyDown);
                a._keyboardBind = undefined
            }
        },
        _dragStop: function (d, b, c) {
            var a = {
                dragHandle: c
            };
            b._trigger("dragStop", d, a)
        },
        _contentMouseMove: function (g) {
            var b = g.data,
                n = b.options,
                i, j, f, s, q, r, h, m, d, e, k, l, o, p, c;
            if (n.disabled) return;
            i = n.hScroller;
            j = n.vScroller;
            f = a(g.currentTarget);
            s = b._fields();
            q = b._hasMode(i, "edge");
            r = b._hasMode(j, "edge");
            b._clearInterval();
            h = {
                X: g.pageX,
                Y: g.pageY
            };
            m = f.offset();
            d = m.left;
            e = m.top;
            d = h.X - d;
            e = h.Y - e;
            k = i.hoverEdgeSpan;
            l = j.hoverEdgeSpan;
            o = f.innerHeight();
            p = f.innerWidth();
            c = "";
            if (q) {
                if (d < k) c = "left";
                if (d > p - k) c = "right"
            }
            if (r) {
                if (e < l) c = "top";
                if (e > o - l) c = "bottom"
            }
            b._setScrollingInterval(s, c, b, false)
        },
        _setScrollingInterval: function (d, b, a, c) {
            var e = a.options;
            if (b.length > 0) d.internalFuncID = window.setInterval(function () {
                a._doScrolling(b, a, c)
            }, e.keyDownInterval)
        },
        _scrollButtonMouseOver: function (e) {
            var c = e.data,
                d;
            if (c.options.disabled) return;
            d = a(e.currentTarget);
            if (!d.hasClass(b)) {
                d.bind("mouseout." + c.widgetName, c, c._buttonMouseOut).bind("mousedown." + c.widgetName, c, c._buttonMouseDown).bind("mouseup." + c.widgetName, c, c._buttonMouseUp).addClass(f);
                c._buttonScroll(d, c, "buttonshover")
            }
        },
        _buttonScroll: function (c, a, f) {
            var b = "",
                g = a.options,
                h = a._fields(),
                d = a._hasMode(g.hScroller, f),
                e = a._hasMode(g.vScroller, f);
            if (c.hasClass("wijmo-wijsuperpanel-buttonleft") && d) b = "left";
            else if (c.hasClass("wijmo-wijsuperpanel-buttonright") && d) b = "right";
            else if (c.hasClass("wijmo-wijsuperpanel-buttontop") && e) b = "top";
            else if (c.hasClass("wijmo-wijsuperpanel-buttonbottom") && e) b = "bottom";
            if (b.length > 0) {
                a._clearInterval();
                a._doScrolling(b, a, true);
                a._setScrollingInterval(h, b, a, true)
            }
        },
        _listenContentScroll: function () {
            var b = this,
                f = b.options,
                a = b._fields(),
                h = a.hbarContainer,
                k = a.hbarDrag,
                i = a.vbarContainer,
                l = a.vbarDrag,
                c = a.templateWrapper,
                d = a.contentWrapper,
                n = d.width(),
                m = d.height(),
                e = c && c.offset(),
                o = e && e.left,
                p = e && e.top,
                j = a.contentWidth,
                g = a.contentHeight;
            d.bind("scroll", function () {
                var o = c.position(),
                    a = o.left,
                    e = o.top;
                d.scrollTop(0).scrollLeft(0);
                c.css({
                    left: a,
                    top: e
                });
                if (a <= 0 && a > n - j) {
                    f.hScroller.scrollValue = b.scrollPxToValue(-a, "h");
                    b._scrollDrag("h", h, k, true)
                }
                if (e <= 0 && e > m - g) {
                    f.vScroller.scrollValue = b.scrollPxToValue(-e, "v");
                    b._scrollDrag("v", i, l, true)
                }
            })
        },
        _buttonMouseDown: function (e) {
            var d = e.data,
                c;
            if (d.options.disabled) return;
            c = a(e.currentTarget);
            if (!c.hasClass(b)) {
                c.addClass(g);
                d._buttonScroll(c, d, "buttons")
            }
        },
        _buttonMouseUp: function (b) {
            var d = b.data,
                c = a(b.currentTarget);
            c.removeClass("ui-state-active");
            d._clearInterval()
        },
        _buttonMouseOut: function (c) {
            var b = c.data,
                d = a(c.currentTarget);
            d.unbind("mouseout", b._buttonMouseOut).unbind("mousedown", b._buttonMouseDown).unbind("mouseup", b._buttonMouseUp).removeClass(f).removeClass(g);
            b._clearInterval()
        },
        _panelKeyDown: function (e) {
            var b = e.data,
                f = b.options,
                d, c;
            if (!f.keyboardSupport || f.disabled) return;
            d = e.shiftKey;
            c = e.keyCode;
            if (c === a.ui.keyCode.LEFT) b._doScrolling("left", b, d);
            else if (c === a.ui.keyCode.RIGHT) b._doScrolling("right", b, d);
            else if (c === a.ui.keyCode.UP) b._doScrolling("top", b, d);
            else c === a.ui.keyCode.DOWN && b._doScrolling("bottom", b, d);
            e.stopPropagation();
            e.preventDefault()
        },
        _draggingInternal: function (n, a, b, k) {
            var d = b.dir,
                j = d === "h",
                h = j ? "left" : "top",
                o = n.position[h] - a._getScrollContainerPadding(h),
                m = a._getTrackLen(d) - k[j ? "outerWidth" : "outerHeight"](true),
                l = o / m,
                e = b.scrollMax - b.scrollLargeChange + 1,
                c = l * e,
                g, f, i;
            if (c < b.scrollMin) c = b.scrollMin;
            if (c > e) c = e;
            g = {
                oldValue: b.scrollValue,
                newValue: c,
                dir: d
            };
            if (!a._scrolling(true, a, g)) return;
            if (a.customScroll) {
                i = Math.abs(a.customScroll);
                f = a.scrollPxToValue(i, b.dir)
            }
            b.scrollValue = f || c;
            a.customScroll = undefined;
            a._setDragAndContentPosition(true, false, d, "dragging")
        },
        _dragging: function (g, e, b) {
            var f = b.options,
                c = a(g.target),
                h = c.parent();
            if (h.hasClass(d)) b._draggingInternal(e, b, f.hScroller, c);
            else b._draggingInternal(e, b, f.vScroller, c)
        },
        _panelMouseWheel: function (h, l) {
            var c = h.data,
                i = c.options,
                k, b, j, f, g, e;
            if (!i.mouseWheelSupport || i.disabled) return;
            k = a(h.srcElement || h.originalEvent.target);
            b = "";
            j = k.closest("." + d, c.element).size() > 0;
            f = i.hScroller;
            g = i.vScroller;
            if (l > 0) b = j ? "left" : "top";
            else b = j ? "right" : "bottom";
            b.length > 0 && c._doScrolling(b, c);
            e = false;
            if (b === "left") e = !c.hNeedScrollBar || Math.abs(f.scrollValue - f.scrollMin) < .001;
            if (b === "right") e = !c.hNeedScrollBar || Math.abs(f.scrollValue - (f.scrollMax - c._getHScrollBarLargeChange() + 1)) < .001;
            if (b === "top") e = !c.vNeedScrollBar || Math.abs(g.scrollValue - g.scrollMin) < .001;
            if (b === "bottom") e = !c.vNeedScrollBar || Math.abs(g.scrollValue - (g.scrollMax - c._getVScrollBarLargeChange() + 1)) < .001;
            if (!e || !i.bubbleScrollingEvent || b === "left" || b === "right") {
                h.stopPropagation();
                h.preventDefault()
            }
        },
        _documentMouseUp: function (c) {
            var b = c.data.self,
                d = c.data.ele;
            d.removeClass(g);
            b._clearInterval();
            a(document).unbind("mouseup", b._documentMouseUp)
        },
        _scrollerMouseOver: function (i) {
            var b = i.data,
                g, c, h;
            if (b.options.disabled) return;
            g = a(i.srcElement || i.originalEvent.target);
            c = null;
            h = false;
            if (g.hasClass(e)) {
                c = g;
                h = true
            } else if (g.parent().hasClass(e)) {
                c = g.parent();
                h = true
            } else if (g.hasClass(j) || g.hasClass(d)) c = g;
            if (c !== undefined) {
                h && c.addClass(f);
                c.bind("mouseout." + b.widgetName, b, b._elementMouseOut);
                c.bind("mousedown." + b.widgetName, b, b._elementMouseDown);
                c.bind("mouseup." + b.widgetName, b, b._elementMouseUp)
            }
        },
        _elementMouseUp: function (c) {
            var b = a(c.currentTarget);
            b.removeClass("ui-state-active")
        },
        _elementMouseDown: function (i) {
            var b = a(i.currentTarget),
                f = i.data,
                e, h, g, k, n, l, m, o;
            if (f.options.disabled || i.which !== 1) return;
            e = "";
            h = false;
            g = false;
            if (b.hasClass("wijmo-wijsuperpanel-vbar-buttontop")) {
                e = "top";
                g = true
            } else if (b.hasClass("wijmo-wijsuperpanel-vbar-buttonbottom")) {
                e = "bottom";
                g = true
            } else if (b.hasClass("wijmo-wijsuperpanel-hbar-buttonleft")) {
                e = "left";
                g = true
            } else if (b.hasClass("wijmo-wijsuperpanel-hbar-buttonright")) {
                e = "right";
                g = true
            } else if (b.hasClass(c)) {
                b.addClass("ui-state-active");
                return
            } else if (b.hasClass(d)) {
                k = b.find("." + c);
                n = k.offset();
                if (i.pageX < n.left) e = "left";
                else e = "right";
                h = true
            } else if (b.hasClass(j)) {
                l = b.find("." + c);
                m = l.offset();
                if (i.pageY < m.top) e = "top";
                else e = "bottom";
                h = true
            }
            f._clearInterval();
            f._doScrolling(e, f, h);
            o = f._fields();
            f._setScrollingInterval(o, e, f, h);
            g && b.addClass("ui-state-active");
            a(document).bind("mouseup." + f.widgetName, {
                self: f,
                ele: b
            }, f._documentMouseUp)
        },
        doScrolling: function (b, a) {
            this._doScrolling(b, this, a)
        },
        _setScrollerValue: function (p, b, n, h, o, j, c) {
            var f = b.scrollMin,
                k = j ? h : n,
                d = b.scrollValue,
                a, e, g, l, i, m;
            if (!d) d = f;
            a = 0;
            if (o) {
                e = b.scrollMax - h + 1;
                if (Math.abs(d - e) < .001) {
                    c._clearInterval();
                    return false
                }
                g = b.firstStepChangeFix;
                a = d + k;
                if (!j && Math.abs(d - f) < .0001 && !isNaN(g)) a += g;
                if (a > e) a = e
            } else {
                if (Math.abs(d - f) < .001) {
                    c._clearInterval();
                    return false
                }
                a = d - k;
                if (a < 0) a = f
            }
            l = {
                oldValue: b.scrollValue,
                newValue: a,
                direction: p,
                dir: b.dir
            };
            if (!c._scrolling(true, c, l)) return false;
            if (c.customScroll) {
                m = Math.abs(c.customScroll);
                i = c.scrollPxToValue(m, b.dir)
            }
            b.scrollValue = i || a;
            c.customScroll = undefined;
            return true
        },
        _doScrolling: function (a, b, c) {
            var d = b.options,
                f = d.vScroller,
                e = d.hScroller,
                j = b._getVScrollBarSmallChange(),
                i = b._getVScrollBarLargeChange(),
                g = b._getHScrollBarLargeChange(),
                h = b._getHScrollBarSmallChange();
            if (a === "top" || a === "bottom") {
                if (!b._setScrollerValue(a, f, j, i, a === "bottom", c, b)) return;
                a = "v"
            } else if (a === "left" || a === "right") {
                if (!b._setScrollerValue(a, e, h, g, a === "right", c, b)) return;
                a = "h"
            }
            b._setDragAndContentPosition(true, true, a)
        },
        _disableButtonIfNeeded: function (h) {
            var a = h._fields(),
                c, f, j, g, i, m, o, d, k, n, p, e, l;
            a.intervalID > 0 && window.clearInterval(a.intervalID);
            c = h.options;
            f = a.buttonLeft;
            j = a.buttonRight;
            g = a.buttonTop;
            i = a.buttonBottom;
            if (f !== undefined) {
                m = h._getHScrollBarLargeChange();
                o = c.hScroller.scrollMax - m + 1;
                d = c.hScroller.scrollValue;
                k = c.hScroller.scrollMin;
                if (d === undefined) d = k;
                if (Math.abs(d - k) < .001 || !a.hScrolling) f.addClass(b);
                else f.removeClass(b);
                if (Math.abs(d - o) < .001 || !a.hScrolling) j.addClass(b);
                else j.removeClass(b)
            }
            if (g !== undefined) {
                n = h._getVScrollBarLargeChange();
                p = c.vScroller.scrollMax - n + 1;
                e = c.vScroller.scrollValue;
                l = c.vScroller.scrollMin;
                if (e === undefined) e = l;
                if (Math.abs(e - l) < .001 || !a.vScrolling) g.addClass(b);
                else g.removeClass(b);
                if (Math.abs(e - p) < .001 || !a.vScrolling) i.addClass(b);
                else i.removeClass(b)
            }
        },
        _clearInterval: function () {
            var b = this._fields(),
                a = b.internalFuncID;
            if (a > 0) {
                window.clearInterval(a);
                b.internalFuncID = -1
            }
        },
        _elementMouseOut: function (d) {
            var b = a(d.currentTarget),
                c = d.data;
            b.unbind("mouseout", c._elementMouseOut);
            b.unbind("mousedown", c._elementMouseDown);
            b.unbind("mouseup", c._elementMouseUp);
            b.removeClass(f)
        },
        _getScrollOffset: function (n) {
            var i = a(n),
                l, e, m, b, f, c, h, j, g, k, d = {
                    left: null,
                    top: null
                };
            if (i.size() === 0) return d;
            l = this._fields();
            e = l.contentWrapper;
            m = l.templateWrapper;
            b = i.offset();
            f = m.offset();
            b.leftWidth = b.left + i.outerWidth();
            b.topHeight = b.top + i.outerHeight();
            c = e.offset();
            c.leftWidth = c.left + e.outerWidth();
            c.topHeight = c.top + e.outerHeight();
            g = b.left - f.left;
            if (b.left < c.left) d.left = g;
            else if (b.leftWidth > c.leftWidth) {
                k = b.leftWidth - f.left - e.innerWidth();
                if (g < k) d.left = g;
                else d.left = k
            }
            h = b.top - f.top;
            if (b.top < c.top) d.top = h;
            else if (b.topHeight > c.topHeight) {
                j = b.topHeight - f.top - e.innerHeight();
                if (h < j) d.top = h;
                else d.top = j
            }
            return d
        },
        _scrollDrag: function (c, o, i, n) {
            var a = this,
                m = a.options,
                d = c === "v",
                b = d ? m.vScroller : m.hScroller,
                g = b.scrollMin,
                q = b.scrollMax,
                f = b.scrollValue === undefined ? g : b.scrollValue - g,
                p = a._getLargeChange(c),
                h = q - g - p + 1,
                e = -1,
                k, l, j;
            if (f > h) f = h;
            if (o !== undefined) {
                k = a._getTrackLen(c);
                l = i[d ? "outerHeight" : "outerWidth"]();
                j = a._getScrollContainerPadding(d ? "top" : "left");
                e = f / h * (k - l) + j
            }
            e >= 0 && i.css(d ? "top" : "left", e + "px");
            a._scrollEnd(n, a, c)
        },
        needToScroll: function (b) {
            var a = this._getScrollOffset(b);
            return a.top !== null || a.left !== null
        },
        scrollChildIntoView: function (d) {
            var a = this._getScrollOffset(d),
                b = a.left,
                c = a.top;
            b !== null && this.hScrollTo(b);
            c !== null && this.vScrollTo(c)
        },
        hScrollTo: function (b) {
            var a = this.options;
            a.hScroller.scrollValue = this.scrollPxToValue(b, "h");
            this._setDragAndContentPosition(true, true, "h", "nonestop")
        },
        vScrollTo: function (b) {
            var a = this.options;
            a.vScroller.scrollValue = this.scrollPxToValue(b, "v");
            this._setDragAndContentPosition(true, true, "v", "nonestop")
        },
        scrollPxToValue: function (o, b) {
            var g = this.options,
                p = b === "h" ? "outerWidth" : "outerHeight",
                n = b === "h" ? "contentWidth" : "contentHeight",
                e = b === "h" ? "hScroller" : "vScroller",
                f = this._fields(),
                j = f.contentWrapper,
                l = f[n],
                h = j[p](),
                d = g[e].scrollMin,
                m = g[e].scrollMax,
                k = m - d,
                i = b === "h" ? this._getHScrollBarLargeChange() : this._getVScrollBarLargeChange(),
                c = k - i + 1,
                a = c * (o / (l - h));
            if (a < d) a = d;
            if (a > c) a = c;
            return a
        },
        scrollTo: function (a, b) {
            this.hScrollTo(a);
            this.vScrollTo(b)
        },
        refresh: function () {
            this.paintPanel()
        },
        paintPanel: function (h) {
            var b = this,
                e = b.element,
                g, f, c, d;
            if (e.is(":visible")) {
                g = typeof document.activeElement != "unknown" ? document.activeElement : undefined;
                f = b.options;
                c = b._fields();
                !c.initialized && b._initialize(c, e, b);
                b._resetLargeChange(b, c, f);
                b._bindElementEvents(b, c, e, f);
                d = c.templateWrapper;
                d.css({
                    "float": "left",
                    left: "0px",
                    top: "0px",
                    width: "auto",
                    height: "auto"
                });
                d.hide();
                d.show();
                c.contentWidth = d.width();
                c.contentHeight = d.height();
                d.css("float", "");
                b._setRounder(b, e);
                b._setInnerElementsSize(c, e);
                if (b._testScroll(b, c, f) === false) return false;
                b._initScrollBars(b, c, f);
                b._initScrollButtons(b, c, f);
                b._trigger("painted");
                b._paintedMark = {
                    date: new Date,
                    mainWidth: e[0].offsetWidth,
                    mainHeight: e[0].offsetHeight,
                    width: c.contentWidth,
                    height: c.contentWidth
                };
                g !== undefined && !h && a(g).focus();
                return true
            }
            return false
        },
        _resetLargeChange: function (d, a, e) {
            var b;
            if (d._autoVLarge) e.vScroller.scrollLargeChange = null;
            if (d._autoHLarge) e.hScroller.scrollLargeChange = null;
            a.vTrackLen = undefined;
            a.hTrackLen = undefined;
            if (a.vbarContainer) {
                b = a.vbarContainer.children("." + c + ":eq(0)");
                b.detach();
                a.vbarContainer.remove();
                a.vbarContainer = undefined
            }
            if (a.hbarContainer) {
                b = a.hbarContainer.children("." + c + ":eq(0)");
                b.detach();
                a.hbarContainer.remove();
                a.hbarContainer = undefined
            }
        },
        _initialize: function (b, a, c) {
            b.initialized = true;
            a.addClass(i);
            b.oldHeight = a.css("height");
            var d = a.css("overflow");
            a.css("overflow", "");
            a.height(a.height());
            a.css("overflow", d);
            c._createAdditionalDom(c, b, a)
        },
        getContentElement: function () {
            return this._fields().templateWrapper
        },
        _setButtonPosition: function (f, s, g, r, n, d, k) {
            var b = r === "h",
                q = "mouseover." + f.widgetName,
                i = b ? "buttonLeft" : "buttonTop",
                j = b ? "buttonRight" : "buttonBottom",
                e = d[i],
                h = d[j],
                p, l, c;
            if (f._hasMode(g, "buttons") || f._hasMode(g, "buttonshover")) {
                p = b ? m : o;
                if (e === undefined) {
                    l = a(p).appendTo(k);
                    l.bind(q, f, f._scrollButtonMouseOver);
                    d[i] = e = k.children(b ? ".wijmo-wijsuperpanel-buttonleft" : ".wijmo-wijsuperpanel-buttontop");
                    d[j] = h = k.children(b ? ".wijmo-wijsuperpanel-buttonright" : ".wijmo-wijsuperpanel-buttonbottom")
                }
                c = {
                    my: b ? "left" : "top",
                    of: n,
                    at: b ? "left" : "top",
                    collision: "none"
                };
                a.extend(c, g.decreaseButtonPosition);
                e.position(c);
                c = {
                    my: b ? "right" : "bottom",
                    of: n,
                    at: b ? "right" : "bottom",
                    collision: "none"
                };
                a.extend(c, g.increaseButtonPosition);
                h.position(c)
            } else if (e !== undefined) {
                e.remove();
                h.remove();
                d[i] = d[j] = undefined
            }
        },
        _initScrollButtons: function (a, b, c) {
            var e = b.contentWrapper,
                d = b.stateContainer;
            a._setButtonPosition(a, c, c.hScroller, "h", e, b, d);
            a._setButtonPosition(a, c, c.vScroller, "v", e, b, d)
        },
        _getVScrollBarSmallChange: function () {
            var a = this.options,
                b;
            if (!a.vScroller.scrollSmallChange) {
                b = this._getVScrollBarLargeChange();
                a.vScroller.scrollSmallChange = b / 2
            }
            return a.vScroller.scrollSmallChange
        },
        _getVScrollBarLargeChange: function () {
            return this._getLargeChange("v")
        },
        _getLargeChange: function (q) {
            var f = this,
                m = f.options,
                l = f._fields(),
                c = q === "v",
                a = c ? m.vScroller : m.hScroller,
                n = c ? "innerHeight" : "innerWidth",
                o = c ? "contentHeight" : "contentWidth",
                p = c ? "_autoVLarge" : "_autoHLarge",
                j, k, i, h, d, g, e, b;
            if (a.scrollLargeChange) return a.scrollLargeChange;
            j = a.scrollMax;
            k = a.scrollMin;
            i = j - k;
            h = l.contentWrapper;
            d = h[n]();
            g = l[o];
            e = d / (g - d);
            b = (i + 1) * e / (1 + e);
            if (isNaN(b)) b = 0;
            a.scrollLargeChange = b;
            f[p] = true;
            return a.scrollLargeChange
        },
        _getHScrollBarSmallChange: function () {
            var a = this.options,
                b;
            if (!a.hScroller.scrollSmallChange) {
                b = this._getHScrollBarLargeChange();
                a.hScroller.scrollSmallChange = b / 2
            }
            return a.hScroller.scrollSmallChange
        },
        _getHScrollBarLargeChange: function () {
            return this._getLargeChange("h")
        },
        _initScrollBars: function (b, r, e) {
            var p = e.hScroller,
                u = p.scrollMax,
                v = p.scrollMin,
                s = u - v,
                q = e.vScroller,
                w = q.scrollMax,
                x = q.scrollMin,
                t = w - x,
                c = r.hbarDrag,
                d = r.vbarDrag,
                l, j, g, o, k, m, h, f, n, i;
            if (b.hNeedScrollBar && c.is(":visible")) {
                l = b._getHScrollBarLargeChange();
                j = b._getTrackLen("h");
                g = b._getDragLength(s, l, j, e.hScroller.scrollMinDragLength);
                c.width(g);
                o = c.outerWidth(true) - c.width();
                c.width(g - o);
                k = c.children("span");
                k.css("margin-left", (c.width() - k[0].offsetWidth) / 2);
                if (j <= c.outerWidth(true)) c.hide();
                else c.show();
                if (b._isDragging == true) {
                    a(document).trigger("mouseup");
                    b._isDragging = false
                }
            }
            if (b.vNeedScrollBar && d.is(":visible")) {
                m = b._getVScrollBarLargeChange();
                h = b._getTrackLen("v");
                f = b._getDragLength(t, m, h, e.vScroller.scrollMinDragLength);
                d.height(f);
                n = d.outerHeight(true) - d.height();
                d.height(f - n);
                i = d.children("span");
                i.css("margin-top", (d.height() - i[0].offsetHeight) / 2);
                if (h <= d.outerHeight(true)) d.hide();
                else d.show();
                if (b._isDragging == true) {
                    a(document).trigger("mouseup");
                    b._isDragging = false
                }
            }
            b._setDragAndContentPosition(false, false, "both")
        },
        _getTrackLen: function (f) {
            var e = this,
                a = e._fields(),
                d = f + "TrackLen",
                g, h, c, b;
            if (a[d] !== undefined) return a[d];
            g = a.hbarContainer;
            h = a.vbarContainer;
            c = 0;
            b = 0;
            if (f === "h") {
                b = e._getScrollContainerPadding("h");
                c = g.innerWidth()
            }
            if (f === "v") {
                b = e._getScrollContainerPadding("v");
                c = h.innerHeight()
            }
            a[d] = c - b;
            return a[d]
        },
        _getScrollContainerPadding: function (b) {
            var d = this,
                e = d._fields(),
                a = 0,
                c, f;
            if (b === "h") a = d._getScrollContainerPadding("left") + d._getScrollContainerPadding("right");
            else if (b === "v") a = d._getScrollContainerPadding("top") + d._getScrollContainerPadding("bottom");
            else {
                if (b === "left" || b === "right") c = e.hbarContainer;
                else c = e.vbarContainer;
                f = b + "Padding";
                if (e[f] !== undefined) {
                    a = e[f];
                    return a
                }
                if (c && c.css) a = parseFloat(c.css("padding-" + b));
                e[f] = a
            }
            return a
        },
        _triggerScroll: function (b, d, a) {
            var c = {
                position: b,
                dir: d,
                animationOptions: a
            };
            this._trigger("scroll", null, c)
        },
        _contentDragAnimate: function (e, q, C, i, A, o, w) {
            var b = this,
                d = b.options,
                f = e === "v",
                j = f ? d.vScroller : d.hScroller,
                H = f ? "outerHeight" : "outerWidth",
                I = f ? "innerHeight" : "innerWidth",
                E = f ? "contentHeight" : "contentWidth",
                F = f ? "top" : "left",
                r = j.scrollMin,
                K = j.scrollMax,
                J = K - r,
                h = j.scrollValue === undefined ? r : j.scrollValue - r,
                D = b._getLargeChange(e),
                m = J - D + 1,
                t = b._fields(),
                G = t.contentWrapper,
                l = t.templateWrapper,
                c, g, y, z, B, x, n, v, k, p, u, s;
            if (h > m) h = m;
            c = (t[E] - G[I]()) * (h / m);
            if (Math.abs(c) < .001) c = 0;
            c = Math.round(c);
            g = -1;
            if (C !== undefined) {
                q && i.is(":animated") && A !== "nonestop" && i.stop(true, false);
                y = b._getTrackLen(e);
                z = i[H](true);
                B = y - z;
                x = b._getScrollContainerPadding(F);
                g = h / m * B + x
            }
            if (q && d.animationOptions && !d.animationOptions.disabled) {
                if (g >= 0 && w !== "dragging") {
                    n = a.extend({}, d.animationOptions);
                    n.complete = undefined;
                    v = f ? {
                        top: g
                    } : {
                        left: g
                    };
                    i.animate(v, n)
                }
                k = a.extend({}, d.animationOptions);
                p = d.animationOptions.complete;
                k.complete = function () {
                    b._scrollEnd(o, b, e);
                    a.isFunction(p) && p(arguments)
                };
                q && l.is(":animated") && A !== "nonestop" && l.stop(true, false);
                u = f ? {
                    top: -c
                } : {
                    left: -c
                };
                if (!d.customScrolling) l.animate(u, k);
                else b._scrollEnd(o, b, e, h);
                b._triggerScroll(c, e, k)
            } else if (j.scrollBarVisibility !== "hidden") {
                s = f ? "top" : "left";
                if (g >= 0 && w !== "dragging") i[0].style[s] = g + "px";
                if (!d.customScrolling) l[0].style[s] = -c + "px";
                b._triggerScroll(c, e);
                b._scrollEnd(o, b, e, h)
            }
        },
        _setDragAndContentPosition: function (d, e, c, g, f) {
            var b = this,
                a = b._fields(),
                h = a.hbarContainer,
                j = a.hbarDrag,
                i = a.vbarContainer,
                k = a.vbarDrag;
            (c === "both" || c === "h") && a.hScrolling && b._contentDragAnimate("h", e, h, j, g, d, f);
            (c === "both" || c === "v") && a.vScrolling && b._contentDragAnimate("v", e, i, k, g, d, f);
            a.intervalID > 0 && window.clearInterval(a.intervalID);
            a.intervalID = window.setInterval(function () {
                b._disableButtonIfNeeded(b)
            }, 500)
        },
        _scrolling: function (d, a, b) {
            var c = true;
            if (d) {
                b.beforePosition = a.getContentElement().position();
                a._beforePosition = b.beforePosition;
                c = a._trigger("scrolling", null, b);
                a.customScroll = b.customScroll
            }
            return c
        },
        _scrollEnd: function (c, a, d, b) {
            c && window.setTimeout(function () {
                var f = a.getContentElement(),
                    e, c;
                if (!f.is(":visible")) return;
                e = a.getContentElement().position();
                c = {
                    dir: d,
                    beforePosition: a._beforePosition,
                    afterPosition: e
                };
                if (!isNaN(b)) c.newValue = b;
                a._trigger("scrolled", null, c)
            }, 0)
        },
        _getDragLength: function (f, d, b, g) {
            var e = f / d,
                a = b / e,
                c = g;
            if (a < c) a = c;
            else if (a + 1 >= b) a = b - 1;
            return Math.round(a)
        },
        _needScrollbar: function (b, e) {
            var d = this._hasMode(b, "scrollbar"),
                a = b.scrollBarVisibility,
                c = d && (a === "visible" || a === "auto" && e);
            return c
        },
        _bindBarEvent: function (d, e, c) {
            var b = this;
            d.bind("mouseover." + b.widgetName, b, b._scrollerMouseOver);
            e.draggable({
                axis: c === "h" ? "x" : "y",
                start: function () {
                    b._isDragging = true
                },
                drag: function (c, a) {
                    b._dragging(c, a, b)
                },
                containment: "parent",
                stop: function (d) {
                    b._dragStop(d, b, c);
                    a(d.target).removeClass("ui-state-active");
                    b._isDragging = false
                }
            })
        },
        _createBarIfNeeded: function (o, m, e, q, i) {
            if (o) {
                var h = this,
                    j, l = h._fields(),
                    n = e + "barContainer",
                    p = e + "barDrag",
                    b = e === "h",
                    d = i[b ? "innerHeight" : "innerWidth"](),
                    f = l[n] = a(q),
                    g, k;
                m.append(f);
                g = f[0][b ? "offsetHeight" : "offsetWidth"];
                d = d - g;
                j = {
                    direction: b ? "horizontal" : "vertical",
                    targetBarLen: g,
                    contentLength: d
                };
                if (h._trigger(b ? "hScrollerActivating" : "vScrollerActivating", null, j) === false) return false;
                k = l[p] = f.find("." + c);
                h._bindBarEvent(f, k, e);
                i[b ? "height" : "width"](d)
            }
        },
        _setScrollbarPosition: function (u, p, f, a, s, r, h, q, c, g, t) {
            var b = g === "h",
                e, m, i, n, j, o, k, l, d;
            if (r) {
                e = a[0][b ? "offsetHeight" : "offsetWidth"];
                m = p._getScrollContainerPadding(g);
                i = b ? "top" : "left";
                n = b ? {
                    top: "0px",
                    bottom: "auto",
                    left: "auto",
                    right: "auto"
                } : {
                    left: "0px",
                    right: "auto",
                    top: "auto",
                    bottom: "auto"
                };
                j = b ? {
                    top: e + "px"
                } : {
                    left: e + "px"
                };
                o = b ? {
                    top: "auto",
                    right: "auto",
                    left: "auto",
                    bottom: "0px"
                } : {
                    left: "auto",
                    right: "0px",
                    top: "auto",
                    bottom: "auto"
                };
                k = b ? {
                    top: ""
                } : {
                    left: ""
                };
                l = f[b ? "innerWidth" : "innerHeight"]();
                if (q === i) {
                    a.css(n);
                    f.css(j);
                    if (b) {
                        a.children(".wijmo-wijsuperpanel-hbar-buttonleft").removeClass("ui-corner-bl").addClass("ui-corner-tl");
                        a.children(".wijmo-wijsuperpanel-hbar-buttonright").removeClass("ui-corner-br").addClass("ui-corner-tr");
                        a.removeClass("ui-corner-bottom").addClass("ui-corner-top")
                    } else {
                        a.children(".wijmo-wijsuperpanel-vbar-buttontop").removeClass("ui-corner-tr").addClass("ui-corner-tl");
                        a.children(".wijmo-wijsuperpanel-vbar-buttonbottom").removeClass("ui-corner-br").addClass("ui-corner-bl");
                        a.removeClass("ui-corner-right").addClass("ui-corner-left")
                    }
                } else {
                    a.css(o);
                    f.css(k);
                    if (b) {
                        a.children(".wijmo-wijsuperpanel-hbar-buttonleft").removeClass("ui-corner-tl").addClass("ui-corner-bl");
                        a.children(".wijmo-wijsuperpanel-hbar-buttonright").removeClass("ui-corner-bl").addClass("ui-corner-br");
                        a.removeClass("ui-corner-top").addClass("ui-corner-bottom")
                    } else {
                        a.children(".wijmo-wijsuperpanel-vbar-buttontop").removeClass("ui-corner-tl").addClass("ui-corner-tr");
                        a.children(".wijmo-wijsuperpanel-vbar-buttonbottom").removeClass("ui-corner-bl").addClass("ui-corner-br");
                        a.removeClass("ui-corner-left").addClass("ui-corner-right")
                    }
                }
                d = 0;
                if (h) {
                    d = s[0][b ? "offsetWidth" : "offsetHeight"];
                    if (c === "left") a.css("right", "0px");
                    else if (c === "right") a.css("left", "0px");
                    else if (c === "top") a.css("bottom", "0px");
                    else c === "bottom" && a.css("top", "0px")
                }
                if (!b && h) d = 0;
                a[b ? "width" : "height"](l - m);
                p._enableDisableScrollBar(g, a, !t)
            } else u.css(b ? "left" : "top", "")
        },
        _testScroll: function (b, a, g) {
            var d = a.templateWrapper,
                e = a.contentWrapper,
                h = a.stateContainer,
                p = e.innerWidth(),
                o = e.innerHeight(),
                r = a.contentWidth,
                q = a.contentHeight,
                c, f, i, j, l, m;
            a.hScrolling = r > p;
            a.vScrolling = q > o;
            c = b.hNeedScrollBar = b._needScrollbar(g.hScroller, a.hScrolling);
            if (b._createBarIfNeeded(c, h, "h", k, e) === false) return false;
            if (c && !a.vScrolling) {
                d.css("float", "left");
                a.contentHeight = d.height();
                a.vScrolling = a.contentHeight > o - a.hbarContainer[0].offsetHeight;
                d.css("float", "")
            }
            f = b.vNeedScrollBar = b._needScrollbar(g.vScroller, a.vScrolling);
            if (b._createBarIfNeeded(f, h, "v", n, e) === false) return false;
            if (f && !a.hScrolling) {
                d.css("float", "left");
                a.contentWidth = d.width();
                a.hScrolling = a.contentWidth > p - a.vbarContainer[0].offsetWidth;
                d.css("float", "");
                if (a.hScrolling && !c) {
                    c = b.hNeedScrollBar = b._needScrollbar(g.hScroller, a.hScrolling);
                    if (b._createBarIfNeeded(c, h, "h", k, e) === false) return false
                }
            }
            i = a.hbarContainer;
            j = a.vbarContainer;
            l = g.hScroller.scrollBarPosition;
            m = g.vScroller.scrollBarPosition;
            b._setScrollbarPosition(d, b, e, i, j, c, f, l, m, "h", a.hScrolling);
            b._setScrollbarPosition(d, b, e, j, i, f, c, m, l, "v", a.vScrolling)
        },
        _enableDisableScrollBar: function (f, a, d) {
            if (f === "v") {
                a[d ? "addClass" : "removeClass"]("wijmo-wijsuperpanel-vbarcontainer-disabled");
                a.find("." + e)[d ? "addClass" : "removeClass"](b)
            } else if (f === "h") {
                a[d ? "addClass" : "removeClass"]("wijmo-wijsuperpanel-hbarcontainer-disabled");
                a.find("." + e)[d ? "addClass" : "removeClass"](b)
            }
            a.children("." + c)[d ? "hide" : "show"]()
        },
        _initResizer: function () {
            var b = this,
                g = b.options,
                d = b._fields(),
                f = d.resizer,
                c, e;
            if (!f && g.allowResize) {
                c = g.resizableOptions;
                e = c.stop;
                c.stop = function (c) {
                    b._resizeStop(c, b);
                    a.isFunction(e) && e(c)
                };
                d.resizer = f = b.element.resizable(c)
            }
            if (!g.allowResize && d.resizer) {
                f.resizable("destroy");
                d.resizer = null
            }
        },
        _resizeStop: function (b, a) {
            !this.options.autoRefresh && a.paintPanel(true);
            a._trigger("resized")
        },
        _createAdditionalDom: function (f, b, c) {
            if (!c.attr("tabindex")) {
                c.attr("tabindex", "-1");
                b.tabindex = true
            }
            var d = b.stateContainer = a(l),
                e;
            b.contentWrapper = d.children();
            e = b.templateWrapper = b.contentWrapper.children();
            c.contents().each(function (f, d) {
                var c = a(d);
                if (c.hasClass("wijmo-wijsuperpanel-header")) {
                    b.header = c;
                    return
                }
                if (c.hasClass("wijmo-wijsuperpanel-footer")) {
                    b.footer = c;
                    return
                }
                e[0].appendChild(d)
            });
            b.header !== undefined && c.prepend(b.header);
            c[0].appendChild(d[0]);
            b.footer !== undefined && b.footer.insertAfter(d)
        },
        _setRounder: function (e, d) {
            if (this.options.showRounder) {
                d.addClass(h);
                if (e._rounderAdded) return;
                if (a.browser.msie) return;
                var b, c, g, f;
                b = c = "";
                if (a.browser.webkit) {
                    c = "WebkitBorderTopLeftRadius";
                    b = "WebkitBorderRadius"
                } else if (a.browser.mozilla) {
                    c = "MozBorderRadiusBottomleft";
                    b = "MozBorderRadius"
                } else {
                    c = "border-top-left-radius";
                    b = "border-radius"
                }
                g = d.css(c);
                f = parseInt(g, 10);
                d.css(b, f + 1);
                e._rounderAdded = true;
                e._radiusKey = b
            } else d.removeClass(h)
        },
        _setInnerElementsSize: function (a, g) {
            var i = a.stateContainer,
                h = a.contentWrapper,
                e = 0,
                b, c, d, f;
            if (a.header !== undefined) e += a.header.outerHeight();
            if (a.footer !== undefined) e += a.footer.outerHeight();
            b = i[0].style;
            c = g.innerHeight() - e;
            d = g.innerWidth();
            b.display = "none";
            b.height = c + "px";
            b.width = d + "px";
            f = h[0].style;
            f.height = c + "px";
            f.width = d + "px";
            b.display = ""
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    a.widget("wijmo.wijtextbox", {
        options: {},
        _create: function () {
            var b = this,
                c = b.element,
                f = {
                    input: true,
                    textarea: true
                }, e = {
                    text: true,
                    password: true,
                    email: true,
                    url: true
                }, d = c.get(0).nodeName.toLowerCase();
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            if (!f.hasOwnProperty(d)) return;
            if (d === "input" && b.element.attr("type") && !e.hasOwnProperty(b.element.attr("type").toLowerCase())) return;
            c.addClass("wijmo-wijtextbox ui-widget ui-state-default ui-corner-all");
            b.element.bind("mouseover." + b.widgetName, function () {
                c.addClass("ui-state-hover")
            }).bind("mouseout." + b.widgetName, function () {
                c.removeClass("ui-state-hover")
            }).bind("mousedown." + b.widgetName, function () {
                c.addClass("ui-state-active")
            }).bind("mouseup." + b.widgetName, function () {
                c.removeClass("ui-state-active")
            }).bind("focus." + b.widgetName, function () {
                c.addClass("ui-state-focus")
            }).bind("blur." + b.widgetName, function () {
                c.removeClass("ui-state-focus")
            });
            if (c.is(":disabled")) {
                b._setOption("disabled", true);
                c.addClass("ui-state-disabled")
            } else {
                b._setOption("disabled", false);
                c.removeClass("ui-state-disabled")
            }
        },
        destroy: function () {
            var b = this;
            b.element.removeClass("ui-widget ui-state-default ui-corner-all ui-state-hover ui-state-active wijmo-wijtextbox").unbind("." + b.widgetName);
            a.Widget.prototype.destroy.apply(b)
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    a.widget("wijmo.wijdropdown", {
        options: {
            zIndex: 1e3,
            showingAnimation: {
                effect: "blind"
            },
            hidingAnimation: {
                effect: "blind"
            }
        },
        hoverClass: "ui-state-hover",
        activeClass: "ui-state-active",
        focusClass: "ui-state-focus",
        _setOption: function (c, b) {
            a.Widget.prototype._setOption.apply(this, arguments);
            if (c === "disabled") {
                this._labelWrap.toggleClass("ui-state-disabled", b);
                this._label.toggleClass("ui-state-disabled", b);
                this.element.attr("disabled", b ? "disabled" : "")
            }
        },
        _create: function () {
            var b = this,
                c = b.element;
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            if (c.get(0).tagName.toLowerCase() !== "select") return;
            if (c.is(":visible")) {
                b._activeItem = null;
                b._createSelect();
                b._bindEvents();
                b.needInit = false
            } else b.needInit = true;
            b.element.is(":hidden") && b.element.wijAddVisibilityObserver && b.element.wijAddVisibilityObserver(function () {
                b.refresh();
                b.element.wijRemoveVisibilityObserver && b.element.wijRemoveVisibilityObserver()
            }, "wijdropdown")
        },
        _createSelect: function () {
            var b = this,
                c = b.element,
                k = c.width(),
                f = k,
                j = c.wrap("<div></div>").parent().addClass("ui-helper-hidden"),
                d = j.wrap("<div></div>").parent().attr("role", "select").addClass("wijmo-wijdropdown ui-widget ui-widwijmo-wijdropdownt-content ui-state-default ui-corner-all ui-helper-clearfix"),
                g = a('<label class="wijmo-dropdown-label ui-corner-all"></label>').attr("id", c.get(0).id + "_select").attr("name", c.attr("name") || ""),
                i = a("<div></div>").addClass("wijmo-dropdown-trigger ui-state-default ui-corner-right"),
                e = a('<a href="#"></a>'),
                h = a("<div>").addClass("wijmo-dropdown"),
                l = a("<ul></ul>").addClass("wijmo-dropdown-list ui-widget-content ui-widget ui-corner-all ui-helper-reset").appendTo(h);
            a("<span></span>").addClass("ui-icon ui-icon-triangle-1-s").appendTo(i);
            k = Math.max(k, d.width());
            c.get(0).tabIndex !== "" && e.attr("tabindex", c.attr("tabindex"));
            if (c.get(0).disabled !== false) b.options.disabled = true;
            if (b.options.disabled) {
                e.addClass("ui-state-disabled");
                g.addClass("ui-state-disabled")
            }
            e.append(g);
            d.append(j).append(e).append(i).append(h);
            f += parseInt(g.css("padding-left").replace(/px/, ""), 10);
            f += parseInt(g.css("padding-right").replace(/px/, ""), 10);
            f -= 16;
            d.width(f);
            b._buildList(l, h, f);
            b._rightTrigger = i;
            b._label = g;
            b._listContainer = h;
            b._list = l;
            b._value = c.val();
            b._selectedIndex = a("option", c).index(c.find("option:selected"));
            b._selectWrap = j;
            b._labelWrap = e;
            b._container = d;
            d.attr("title", c.attr("title"));
            c.removeAttr("title")
        },
        _buildList: function (b, c, f) {
            var d = this,
                g = d.element,
                e;
            c.show();
            g.children().each(function (i, h) {
                var c = a(h),
                    f, g, e;
                if (c.is("option")) b.append(d._buildItem(c));
                else {
                    f = a('<li class="wijmo-dropdown-optgroup"></li>');
                    g = a("<span>" + c.attr("label") + "</span>").addClass("wijmo-optgroup-header ui-priority-primary");
                    e = a("<ul></ul>").addClass("ui-helper-reset wijmo-dropdown-items");
                    c.children("option").each(function () {
                        e.append(d._buildItem(a(this)))
                    });
                    f.append(g).append(e);
                    b.append(f)
                }
            });
            c.height("");
            e = c.height();
            e = b.outerHeight() < e ? b.outerHeight() : e;
            c.css({
                height: e,
                width: f
            });
            if (a.browser.msie && /^[8]\.[0-9]+/.test(a.browser.version)) b.setOutWidth(b.parent().parent().innerWidth() - 19);
            else b.setOutWidth(b.parent().parent().innerWidth() - 18);
            if (c.data("wijsuperpanel")) {
                c.wijsuperpanel("paintPanel");
                d.superpanel = c.data("wijsuperpanel")
            } else d.superpanel = c.wijsuperpanel().data("wijsuperpanel");
            a.fn.bgiframe && d.superpanel.element.bgiframe();
            if (!d.superpanel.vNeedScrollBar) {
                if (a.browser.msie && /^[8]\.[0-9]+/.test(a.browser.version)) b.setOutWidth(b.parent().parent().innerWidth() - 1);
                else b.setOutWidth(b.parent().parent().innerWidth());
                d.superpanel.refresh()
            }
            c.hide()
        },
        _handelEvents: function (d) {
            var a = this,
                b = "." + a.widgetName,
                c = a.element;
            d.bind("click" + b, function (b) {
                if (a.options.disabled) return;
                if (a._listContainer.is(":hidden")) a._show();
                else a._hide();
                c.click();
                if (d.get(0) === a._label.get(0)) b.preventDefault();
                else a._labelWrap.focus()
            }).bind("mouseover" + b, function () {
                if (a.options.disabled) return;
                a._label.addClass(a.hoverClass);
                a._rightTrigger.addClass(a.hoverClass);
                c.trigger("mouseover")
            }).bind("mouseout" + b, function () {
                if (a.options.disabled) return;
                a._label.removeClass(a.hoverClass);
                a._rightTrigger.removeClass(a.hoverClass);
                c.trigger("mouseout")
            }).bind("mousedown" + b, function () {
                if (a.options.disabled) return;
                a._label.addClass(a.activeClass);
                a._rightTrigger.addClass(a.activeClass);
                c.trigger("mousedown")
            }).bind("mouseup" + b, function () {
                if (a.options.disabled) return;
                a._label.removeClass(a.activeClass);
                a._rightTrigger.removeClass(a.activeClass);
                c.trigger("mouseup")
            })
        },
        _bindEvents: function () {
            var b = this,
                d = "." + b.widgetName,
                h = b._label,
                e = b._rightTrigger,
                j = b._labelWrap,
                c = b._listContainer,
                f = b.element,
                i = false,
                g;
            b._handelEvents(b._label);
            b._handelEvents(b._rightTrigger);
            a(document).bind("click" + d, function (a) {
                if (c.is(":hidden")) return;
                g = c.offset();
                if (a.target === h.get(0) || a.target === e.get(0) || a.target === e.children().get(0)) return;
                (a.pageX < g.left || a.pageX > g.left + c.width() || a.pageY < g.top || a.pageY > g.top + c.height()) && b._hide()
            });
            c.bind("click" + d, function (e) {
                var d = a(e.target);
                if (d.closest("li.wijmo-dropdown-item", a(this)).length > 0) {
                    b._setValue();
                    c.css("z-index", "");
                    a.browser.msie && /^[6,7].[0-9]+/.test(a.browser.version) && c.parent().css("z-index", "");
                    c.hide();
                    b._setValueToEle()
                }
                f.click()
            });
            j.bind("keydown" + d, function (d) {
                if (b.options.disabled) return;
                var c = a.ui.keyCode;
                switch (d.which) {
                    case c.UP:
                    case c.LEFT:
                        b._previous();
                        b._setValue();
                        b._setValueToEle();
                        break;
                    case c.DOWN:
                    case c.RIGHT:
                        b._next();
                        b._setValue();
                        b._setValueToEle();
                        break;
                    case c.PAGE_DOWN:
                        b._nextPage();
                        b._setValue();
                        b._setValueToEle();
                        break;
                    case c.PAGE_UP:
                        b._previousPage();
                        b._setValue();
                        b._setValueToEle();
                        break;
                    case c.ENTER:
                    case c.NUMPAD_ENTER:
                        b._setValue();
                        b._listContainer.hide();
                        b._setValueToEle()
                }
                d.which !== c.TAB && d.preventDefault();
                f.trigger("keydown")
            }).bind("focus" + d, function () {
                if (b.options.disabled) return;
                h.addClass(b.focusClass);
                e.addClass(b.focusClass);
                f.focus()
            }).bind("blur" + d, function () {
                if (b.options.disabled) return;
                h.removeClass(b.focusClass);
                e.removeClass(b.focusClass);
                f.trigger("blur")
            }).bind("keypress" + d, function () {
                if (b.options.disabled) return;
                f.trigger("keypress")
            }).bind("keyup" + d, function () {
                if (b.options.disabled) return;
                f.trigger("keyup")
            });
            i = /chrome/.test(navigator.userAgent.toLowerCase());
            (i || a.browser.safari) && e.bind("mouseout" + d, function () {
                if (b.options.disabled) return;
                h.removeClass(b.focusClass);
                e.removeClass(b.focusClass)
            })
        },
        _init: function () {
            var a = this;
            a._initActiveItem();
            a._activeItem && a._label.text(a._activeItem.text())
        },
        _buildItem: function (d) {
            var f = d.val(),
                b = d.text(),
                e = this,
                c;
            if (b === "") b = "&nbsp;";
            c = a('<li class="wijmo-dropdown-item ui-corner-all"><span>' + b + "</span></li>").mousemove(function (b) {
                var c = a(b.target).closest(".wijmo-dropdown-item");
                c !== this.last && e._activate(a(this));
                this.last = a(b.target).closest(".wijmo-dropdown-item")
            }).attr("role", "option");
            c.data("value", f);
            return c
        },
        _show: function () {
            var d = this,
                c = d._listContainer,
                b = d.options.showingAnimation;
            c.css("z-index", "100000");
            a.browser.msie && /^[6,7]\.[0-9]+/.test(a.browser.version) && c.parent().css("z-index", "99999");
            if (b) c.show(b.effect, b.options, b.speed, function () {
                d._initActiveItem()
            });
            else c.show()
        },
        _hide: function () {
            var d = this,
                b = d._listContainer,
                c = d.options.hidingAnimation;
            if (b.is(":hidden")) return;
            if (c) b.hide(c.effect, c.options, c.speed, function () {
                a.isFunction(c.callback) && c.callback.apply(d, arguments);
                a.browser.msie && /^[6,7]\.[0-9]+/.test(a.browser.version) && b.parent().css("z-index", "");
                b.css("z-index", "")
            });
            else {
                a.browser.msie && a.browser.version === "6.0" && b.parent().css("z-index", "");
                b.css("z-index", "");
                b.hide()
            }
        },
        _setValue: function () {
            var b = this,
                c = b._listContainer,
                d, e;
            if (b._activeItem) {
                b._label.text(b._activeItem.text());
                b._value = b._activeItem.data("value");
                b._selectedIndex = a("li.wijmo-dropdown-item", c).index(b._activeItem);
                if (b.superpanel.vNeedScrollBar) {
                    d = b._activeItem.offset().top;
                    e = b._activeItem.outerHeight();
                    if (c.offset().top > d) c.wijsuperpanel("scrollTo", 0, d - b._list.offset().top);
                    else c.offset().top < d + e - c.innerHeight() && c.wijsuperpanel("scrollTo", 0, d + e - c.height() - b._list.offset().top)
                }
            }
        },
        _setValueToEle: function () {
            var c = this,
                b = c.element,
                d = b.find(":selected"),
                f = a("option", b).index(d),
                e = c._selectedIndex;
            if (f !== e) {
                a.browser.mozilla && b.val(c._value);
                d.removeAttr("selected");
                b.find("option:eq(" + e + ")").attr("selected", true);
                b.trigger("change")
            }
        },
        _initActiveItem: function () {
            var b = this;
            if (b._value !== undefined) {
                if (b._selectedIndex === -1) {
                    b._activate(b._list.find("li.wijmo-dropdown-item").eq(0));
                    return
                }
                b._list.find("li.wijmo-dropdown-item").each(function (c) {
                    if (c === b._selectedIndex) {
                        b._activate(a(this));
                        return false
                    }
                })
            }
        },
        _activate: function (b) {
            var a = this;
            a._deactivate();
            a._activeItem = b;
            a._activeItem.addClass(a.hoverClass).attr("aria-selected", true)
        },
        _deactivate: function () {
            var a = this;
            a._activeItem && a._activeItem.removeClass(a.hoverClass).attr("aria-selected", false)
        },
        _next: function () {
            this._move("next", "first")
        },
        _previous: function () {
            this._move("prev", "last")
        },
        _nextPage: function () {
            this._movePage("first")
        },
        _previousPage: function () {
            this._movePage("last")
        },
        refresh: function () {
            var b = this,
                d = b.element,
                c;
            if (b.needInit) {
                if (b.element.is(":visible")) {
                    b._activeItem = null;
                    b._createSelect();
                    b._bindEvents();
                    b._init();
                    b.needInit = false
                }
            } else {
                if (!b._list) return;
                b._listContainer.show();
                b._selectWrap.removeClass("ui-helper-hidden");
                c = b.element.width();
                c += parseInt(b._label.css("padding-left").replace(/px/, ""), 10);
                c += parseInt(b._label.css("padding-right").replace(/px/, ""), 10);
                c -= 16;
                b._container.width(c);
                b._selectWrap.addClass("ui-helper-hidden");
                b._list.empty();
                b._buildList(b._list, b._listContainer, c);
                b._value = b.element.val();
                b._selectedIndex = a("option", d).index(d.find("option:selected"));
                b._initActiveItem();
                b._activeItem && b._label.text(b._activeItem.text())
            }
        },
        _move: function (c, d) {
            var a = this,
                e, b;
            if (!a._activeItem) {
                a._activate(a._list.find(".wijmo-dropdown-item:" + d));
                return
            }
            e = a._activeItem[c]().eq(0);
            if (e.length) b = a._getNextItem(e, c, d);
            else if (a._activeItem.closest(".wijmo-dropdown-optgroup").length) b = a._getNextItem(a._activeItem.closest(".wijmo-dropdown-optgroup")[c](), c, d);
            if (b && b.length) a._activate(b);
            else a._activate(a._list.find(".wijmo-dropdown-item:" + d))
        },
        _movePage: function (d) {
            var b = this,
                g, e, c, f = d === "first" ? "last" : "first";
            if (b.superpanel.vNeedScrollBar) {
                g = b._activeItem.offset().top;
                e = b.options.height;
                c = b._list.find(".wijmo-dropdown-item").filter(function () {
                    var c = a(this).offset().top - g + (d === "first" ? -e : e) + a(this).height(),
                        b = a(this).height();
                    return c < b && c > -b
                });
                if (!c.length) c = b._list.find(".wijmo-dropdown-item:" + f);
                b._activate(c)
            } else b._activate(b._list.find(".wijmo-dropdown-item:" + (!b._activeItem ? d : f)))
        },
        _getNextItem: function (a, b, c) {
            if (a.length) if (a.is(".wijmo-dropdown-optgroup")) if ( !! a.find(">ul>li.wijmo-dropdown-item").length) return a.find(">ul>li.wijmo-dropdown-item:" + c).eq(0);
            else this._getNextItem(a[b]().eq(0));
            else return a
        },
        destroy: function () {
            this.element.attr("title", this._container.attr("title"));
            this.element.closest(".wijmo-wijdropdown").find(">div.wijmo-dropdown-trigger,>div.wijmo-dropdown,>a").remove();
            this.element.unwrap().unwrap().removeData("maxZIndex");
            a.Widget.prototype.destroy.apply(this)
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    var b = 0;
    a.widget("wijmo.wijcheckbox", {
        _csspre: "wijmo-checkbox",
        options: {
            checked: null,
            changed: null
        },
        _init: function () {
            var c = this,
                d = c.element,
                g = c.options,
                f, i, h, e, j;
            if (d.is(":checkbox")) {
                if (!d.attr("id")) {
                    d.attr("id", c._csspre + b);
                    b += 1
                }
                if (d.parent().is("label")) {
                    f = d.parent().wrap("<div class='" + c._csspre + "-inputwrapper'></div>").parent().wrap("<div></div>").parent().addClass(c._csspre + " ui-widget");
                    i = d.parent();
                    i.attr("for", d.attr("id"));
                    f.find("." + c._csspre + "-inputwrapper").append(d);
                    f.append(i)
                } else f = d.wrap("<div class='" + c._csspre + "-inputwrapper'></div>").parent().wrap("<div></div>").parent().addClass(c._csspre + " ui-widget");
                h = a("label[for='" + d.attr("id") + "']");
                if (h.length > 0) {
                    f.append(h);
                    h.attr("labelsign", "C1")
                }
                d.is(":disabled") && c._setOption("disabled", true);
                e = a("<div class='" + c._csspre + "-box ui-widget ui-state-" + (g.disabled ? "disabled" : "default") + " ui-corner-all'><span class='" + c._csspre + "-icon'></span></div>");
                j = e.children("." + c._csspre + "-icon");
                f.append(e);
                d.data("iconElement", j);
                d.data("boxElement", e);
                d.data("checkboxElement", f);
                e.removeClass(c._csspre + "-relative").attr("role", "checkbox").bind("mouseover", function () {
                    d.mouseover()
                }).bind("mouseout", function () {
                    d.mouseout()
                });
                (h.length === 0 || h.html() === "") && e.addClass(c._csspre + "-relative");
                d.bind("click.checkbox", function (a) {
                    if (g.disabled) return;
                    c.refresh(a);
                    c._trigger("changed", null, {
                        checked: c.options.checked
                    })
                }).bind("focus.checkbox", function () {
                    if (g.disabled) return;
                    e.removeClass("ui-state-default").addClass("ui-state-focus")
                }).bind("blur.checkbox", function () {
                    if (g.disabled) return;
                    e.removeClass("ui-state-focus").not(".ui-state-hover").addClass("ui-state-default")
                }).bind("keydown.checkbox", function (a) {
                    if (a.keyCode === 32) {
                        if (g.disabled) return;
                        c.refresh()
                    }
                });
                e.bind("click.checkbox", function (a) {
                    if (g.disabled) return;
                    d.get(0).checked = !d.get(0).checked;
                    d.change();
                    d.focus();
                    c.refresh(a);
                    c._trigger("changed", null, {
                        checked: c.options.checked
                    })
                });
                c._initCheckState();
                c.refresh();
                f.bind("mouseover.checkbox", function () {
                    if (g.disabled) return;
                    e.removeClass("ui-state-default").addClass("ui-state-hover")
                }).bind("mouseout.checkbox", function () {
                    if (g.disabled) return;
                    e.removeClass("ui-state-hover").not(".ui-state-focus").addClass("ui-state-default")
                });
                f.attr("title", d.attr("title"))
            }
        },
        _create: function () {
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a)
        },
        _setOption: function (e, c) {
            var b = this,
                d = b.options.checked;
            a.Widget.prototype._setOption.apply(this, arguments);
            if (e === "checked") {
                b.element.get(0).checked = c;
                b.refresh();
                d !== c && b._trigger("changed", null, {
                    checked: c
                })
            }
        },
        _initCheckState: function () {
            var b = this,
                a = b.options;
            if (a.checked !== undefined && a.checked !== null) b.element.get(0).checked = a.checked
        },
        refresh: function (b) {
            var a = this,
                c = a.options;
            c.checked = a.element.get(0).checked;
            a.element.data("iconElement").toggleClass("ui-icon ui-icon-check", a.element.get(0).checked);
            a.element.data("boxElement").toggleClass("ui-state-active", a.element.get(0).checked).attr("aria-checked", a.element.get(0).checked);
            a.element.data("checkboxElement").toggleClass("ui-state-checked", a.element.get(0).checked);
            b && b.stopPropagation()
        },
        destroy: function () {
            var b = this,
                c = b.element.parent().parent();
            c.children("div." + b._csspre + "-box").remove();
            b.element.unwrap();
            b.element.unwrap();
            a.Widget.prototype.destroy.apply(b)
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    var b = 0;
    a.widget("wijmo.wijradio", {
        _radiobuttonPre: "wijmo-wijradio",
        options: {
            checked: null,
            changed: null
        },
        _create: function () {
            var c = this,
                d = c.element,
                h, e, j, g, f, i;
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            if (d.is(":radio")) {
                if (!d.attr("id")) {
                    d.attr("id", "wijmo-radio-" + b);
                    b += 1
                }
                if (d.parent().is("label")) {
                    e = d.parent().wrap("<div class='" + c._radiobuttonPre + "-inputwrapper'></div>").parent().wrap("<div></div>").parent().addClass(c._radiobuttonPre + " ui-widget");
                    j = d.parent();
                    j.attr("for", d.attr("id"));
                    e.find("." + c._radiobuttonPre + "-inputwrapper").append(d);
                    e.append(j)
                } else e = d.wrap("<div class='" + c._radiobuttonPre + "-inputwrapper'></div>").parent().wrap("<div></div>").parent().addClass(c._radiobuttonPre + " ui-widget");
                g = a("label[for='" + d.attr("id") + "']");
                if (g.length > 0) {
                    e.append(g);
                    g.attr("labelsign", "wij")
                }
                d.is(":disabled") && c._setOption("disabled", true);
                f = a("<div class='" + c._radiobuttonPre + "-box ui-widget " + (c.options.disabled ? "ui-state-disabled" : "ui-state-default") + " ui-corner-all'><span class='" + c._radiobuttonPre + "-icon'></span></div>");
                i = f.children("." + c._radiobuttonPre + "-icon");
                e.append(f);
                i.addClass("ui-icon ui-icon-radio-on");
                d.data("iconElement", i);
                d.data("boxElement", f);
                d.data("radiobuttonElement", e);
                f.removeClass(c._radiobuttonPre + "-relative").attr("role", "radio").bind("mouseover", function () {
                    d.mouseover()
                }).bind("mouseout", function () {
                    d.mouseout()
                });
                (g.length === 0 || g.html() === "") && f.addClass(c._radiobuttonPre + "-relative");
                c._setDefaul();
                d.bind("click.radio", function () {
                    if (c.options.disabled) return;
                    h = c.options.checked;
                    c._refresh();
                    h !== c.element.is(":checked") && c._trigger("changed", null, {
                        checked: c.options.checked
                    })
                }).bind("focus.radio", function () {
                    if (c.options.disabled) return;
                    f.removeClass("ui-state-default").addClass("ui-state-focus")
                }).bind("blur.radio", function () {
                    if (c.options.disabled) return;
                    f.removeClass("ui-state-focus").not(".ui-state-hover").addClass("ui-state-default")
                });
                e.click(function () {
                    if (c.options.disabled) return;
                    if (g.length === 0 || g.html() === "") {
                        h = c.options.checked;
                        d.attr("checked", true);
                        c._refresh();
                        d.change();
                        h !== c.element.is(":checked") && c._trigger("changed", null, {
                            checked: c.options.checked
                        })
                    }
                });
                e.bind("mouseover.radio", function () {
                    if (c.options.disabled) return;
                    f.removeClass("ui-state-default").addClass("ui-state-hover")
                }).bind("mouseout.radio", function () {
                    if (c.options.disabled) return;
                    f.removeClass("ui-state-hover").not(".ui-state-focus").addClass("ui-state-default")
                });
                e.attr("title", d.attr("title"))
            }
        },
        _setOption: function (e, c) {
            var b = this,
                d = b.options.checked;
            a.Widget.prototype._setOption.apply(this, arguments);
            if (e === "checked") {
                b.element.attr("checked", c);
                b._refresh();
                d !== c && b._trigger("changed", null, {
                    checked: c
                })
            }
        },
        _setDefaul: function () {
            var b = this,
                a = b.options;
            a.checked !== undefined && a.checked !== null && this.element.attr("checked", a.checked);
            if (this.element.attr("checked")) {
                this.element.parents(".wijmo-wijradio").find("." + this._radiobuttonPre + "-box").children().removeClass("ui-icon-radio-on ui-icon-radio-off").addClass("ui-icon-radio-off");
                this.element.data("boxElement").removeClass("ui-state-default").addClass("ui-state-active").attr("aria-checked", true);
                this.element.data("radiobuttonElement").addClass("ui-state-checked")
            }
        },
        _refresh: function () {
            var d = this.element.attr("name") || "",
                b = this,
                c;
            if (d === "") return;
            a("[name='" + d + "']").each(function (e, d) {
                a(d).parents(".wijmo-wijradio").find("." + b._radiobuttonPre + "-box").children().removeClass("ui-icon-radio-on ui-icon-radio-off").addClass("ui-icon-radio-on");
                a(d).parents(".wijmo-wijradio").find("." + b._radiobuttonPre + "-box").removeClass("ui-state-active").addClass("ui-state-default").attr("aria-checked", false);
                a(d).parents(".wijmo-wijradio").removeClass("ui-state-checked");
                c = a(d).parents(".wijmo-wijradio").find(":radio");
                c.wijradio("option", "checked") && c[0] !== b.element[0] && c.wijradio("setCheckedOption", false)
            });
            if (b.element.is(":checked")) {
                b.element.data("iconElement").removeClass("ui-icon-radio-on").addClass("ui-icon-radio-off");
                b.element.data("boxElement").removeClass("ui-state-default").addClass("ui-state-active").attr("aria-checked", true);
                b.element.data("radiobuttonElement").addClass("ui-state-checked")
            }
            b.options.checked = b.element.is(":checked")
        },
        setCheckedOption: function (a) {
            var c = this,
                b = c.options;
            if (b.checked !== null && b.checked !== a) {
                b.checked = a;
                c._trigger("changed", null, {
                    checked: a
                })
            }
        },
        refresh: function () {
            this._refresh()
        },
        destroy: function () {
            var b = this,
                c = b.element.parent().parent();
            c.children("div." + b._radiobuttonPre + "-box").remove();
            b.element.unwrap();
            b.element.unwrap();
            a.Widget.prototype.destroy.apply(b)
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    var g = "ui-widget ui-widget-content ui-corner-all wijmo-wijlist",
        c = "wijmo-wijlist-item",
        h = c + "-alternate",
        i = c + "-selected",
        j = c + "-first",
        k = c + "-last",
        f = "ui-state-hover",
        l = "ui-state-active",
        e = "wijmo-wijlistitem-active",
        b = i + " " + l,
        d = "item.wijlist";
    a.widget("wijmo.wijlist", {
        options: {
            dataSource: null,
            listItems: [],
            selected: null,
            selectionMode: "single",
            autoSize: false,
            maxItemsCount: 5,
            addHoverItemClass: true,
            superPanelOptions: null,
            disabled: false,
            focusing: null,
            focus: null,
            blur: null,
            itemRendering: null,
            itemRendered: null,
            listRendered: null,
            keepHightlightOnMouseLeave: false
        },
        removeAll: function () {
            var a = this;
            a.items = [];
            a._refresh()
        },
        addItem: function (c, b) {
            var a = this;
            a._checkData();
            if (b === null || b === undefined) a.items.push(c);
            else a.items && a.items.splice(b, 0, c);
            a._refresh()
        },
        removeItem: function (c) {
            var b = this,
                a;
            b._checkData();
            a = b.indexOf(c);
            a >= 0 && b.removeItemAt(a)
        },
        indexOf: function (e) {
            var c = this,
                d = -1,
                a = 0,
                b;
            c._checkData();
            for (a = 0; a < c.items.length; a++) {
                b = c.items[a];
                if (b.label === e.label && b.value === e.value) {
                    d = a;
                    break
                }
            }
            return d
        },
        removeItemAt: function (b) {
            var a = this;
            a._checkData();
            a.items.splice(b, 1);
            a._refresh()
        },
        _checkData: function () {
            var a = this;
            if (!a.items) a.items = []
        },
        _refresh: function () {
            var a = this;
            a.renderList();
            a.refreshSuperPanel()
        },
        _setOption: function (d, h) {
            var c = this,
                e, g, f;
            a.Widget.prototype._setOption.apply(c, arguments);
            if (d === "disabled") c._handleDisabledOption(h, c.element);
            else if (d === "selectionMode") {
                e = c.selectedItem;
                if (e) {
                    e.selected = false;
                    e.element && e.element.removeClass(b);
                    c.selectedItem = undefined
                }
                a.each(c.selectedItems, function (c, a) {
                    a.selected = false;
                    a.element.removeClass(b)
                });
                c.selectedItem = []
            } else if (d === "listItems") {
                g = c._isBind();
                if (g) {
                    f = c._getRenderItems();
                    c.setItems(f)
                } else c.setItems(h);
                c.renderList();
                c.refreshSuperPanel()
            } else if (d === "dataSource") {
                g = c._isBind();
                if (g) {
                    f = c._getRenderItems();
                    c.setItems(f);
                    c.renderList();
                    c.refreshSuperPanel()
                }
            } else(d === "autoSize" || d === "maxItemsCount") && c.refreshSuperPanel()
        },
        _create: function () {
            var b = this,
                c = this.element,
                f = this.options,
                d;
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            c.addClass(g).attr({
                role: "listbox",
                "aria-activedescendant": e,
                "aria-multiselectable": f.selectionMode === "multiple"
            }).bind("click." + b.widgetName, b, b._onListClick);
            if (c.is("div") && c.children().is("ul")) {
                b._isInnerData = true;
                b._templates = [];
                a.each(a("ul > li", c), function (c, a) {
                    b._templates.push({
                        templateHtml: a.innerHTML
                    })
                });
                b._oriChildren = c.children().hide()
            }
            b.ul = a("<ul class='wijmo-wijlist-ul'></ul>").appendTo(c);
            if (f.listItems !== null) {
                d = b._getRenderItems();
                if (d) {
                    b.setItems(d);
                    b.renderList();
                    b.refreshSuperPanel()
                }
            }
            b.element.is(":hidden") && b.element.wijAddVisibilityObserver && b.element.wijAddVisibilityObserver(function () {
                b.refreshSuperPanel();
                b.element.wijRemoveVisibilityObserver && b.element.wijRemoveVisibilityObserver()
            }, "wijlist");
            f.disabled && b.disable()
        },
        _isBind: function () {
            var b = this.options,
                a = b.listItems;
            return a !== null && a.label && a.label.bind ? true : false
        },
        _getRenderItems: function () {
            var c = this.options,
                b = c.listItems;
            return b !== null ? a.isArray(b) && b.length > 0 && typeof b[0].label === "string" ? b : b.label && b.label.bind ? this._getMappingItems() : null : null
        },
        _getMappingItems: function () {
            var g = this.options,
                c = g.dataSource,
                b = g.listItems,
                d, e, f;
            if (!c || !b) return null;
            if (!b.label || !b.label.bind || !b.value || !b.value.bind) return null;
            e = b.label.bind;
            f = b.value.bind;
            if (c && c.length !== 0) {
                d = [];
                a.each(c, function (b, a) {
                    d.push({
                        label: a[e],
                        value: a[f]
                    })
                });
                return d
            }
            return null
        },
        _handleDisabledOption: function (b, c) {
            var a = this;
            if (b) {
                if (!a.disabledDiv) a.disabledDiv = a._createDisabledDiv(c);
                a.disabledDiv.appendTo("body")
            } else if (a.disabledDiv) {
                a.disabledDiv.remove();
                a.disabledDiv = null
            }
        },
        _createDisabledDiv: function (f) {
            var g = this,
                b = f || g.element,
                c = b.offset(),
                e = b.outerWidth(),
                d = b.outerHeight();
            return a("<div></div>").addClass("ui-disabled").css({
                "z-index": "99999",
                position: "absolute",
                width: e,
                height: d,
                left: c.left,
                top: c.top
            })
        },
        setTemplateItems: function (a) {
            this._setItemsByExtend(a, true)
        },
        setItems: function (a) {
            this._setItemsByExtend(a, false)
        },
        _setItemsByExtend: function (c, e) {
            var b = this,
                d;
            if (e) {
                if (b._templates && c && c.length !== b._templates.length) return;
                b.items = c;
                if (!b.items) b.items = [];
                a.each(b._templates, function (a) {
                    if (b.items[a]) b.items[a].templateHtml = b._templates[a].templateHtml;
                    else b.items.push({
                        templateHtml: b._templates[a].templateHtml,
                        label: c[a].label,
                        value: c[a].value
                    })
                })
            } else b.items = c;
            if (!c) return null;
            d = a.grep(c, function (a) {
                return a.selected
            });
            if (b.options.selectionMode === "single") {
                b.selectedItems = [];
                b.selectedItem = d.length > 0 ? d[0] : undefined
            } else b.selectedItems = d
        },
        filterItems: function (g, l, k) {
            var c = this,
                e = c._escapeRegex(g),
                i, d, j = "",
                n = null,
                f = false,
                h = null;
            if (!this.items) return null;
            if (a("li[wijhidden].wijmo-wijlist-item", c.element) && a("li[wijhidden].wijmo-wijlist-item", c.element).length > 0) f = true;
            if (a("span.ui-priority-primary", c.element) && a("span.ui-priority-primary", c.element).length > 0) f = true;
            if (!f && (!g || g.length === 0)) {
                a.each(this.items, function (d, a) {
                    if (a.selected) {
                        c.activate(null, a, false);
                        a.element.addClass(b);
                        c.selectedItem = a
                    } else a.element.hasClass(b) && a.element.removeClass(b)
                });
                return
            }
            i = new RegExp(e, "i");
            a.each(this.items, function (m, f) {
                d = f.label;
                if (f.templateHtml) d = f.templateHtml;
                else if (f.text !== undefined) d = f.text;
                a("span.ui-priority-primary", f.element).length > 0 && f.element.empty().append(d);
                var g = i.exec(f.label);
                if (g === null && l) {
                    f.element.hide();
                    f.element.attr("wijhidden", "wijhidden")
                } else {
                    if (f.selected) {
                        c.activate(null, f, false);
                        f.element.addClass(b);
                        c.selectedItem = f
                    } else f.element.hasClass(b) && f.element.removeClass(b);
                    if (k) {
                        j = d.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + e + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<span class='ui-priority-primary'>$1</span>");
                        f.element.html(j)
                    }
                    if (!f.element.is(":visible")) {
                        f.element.show();
                        f.element.removeAttr("wijhidden")
                    }
                    if (e !== undefined && e.length !== 0 && h === null && g && g.index === 0) h = f
                }
            });
            return h
        },
        popItem: function () {
            var a = this;
            a._checkData();
            a.items.pop();
            a._refresh()
        },
        getList: function () {
            return this.ul
        },
        _onListClick: function (b) {
            if (!a(b.target).closest(".wijmo-wijlist-item").length) return;
            var c = b.data;
            c.select(b)
        },
        destroy: function () {
            var b = this,
                c = this.element;
            b.superPanel !== undefined && b.superPanel.destroy();
            c.removeClass("wijmo-wijobserver-visibility").removeClass(g).removeAttr("role").removeAttr("aria-activedescendant").unbind("." + b.widgetName);
            b.ul.remove();
            if (b.disabledDiv) {
                b.disabledDiv.remove();
                b.disabledDiv = null
            }
            b._isInnerData && b._oriChildren.show();
            a.Widget.prototype.destroy.apply(b, arguments)
        },
        activate: function (d, b, g) {
            var a = this,
                h, c;
            a.deactivate();
            if (b === null || b === undefined) return;
            if (a._trigger("focusing", d, b) === false) return;
            h = a.active = b;
            c = b.element;
            if (c) {
                a.options.addHoverItemClass && c.addClass(f);
                c.attr("id", e)
            }
            g && a.superPanel !== undefined && a.superPanel.scrollChildIntoView(c);
            a.element.is(":visible") && a._trigger("focus", d, b)
        },
        deactivate: function () {
            var a = this,
                c = a.active,
                b;
            if (!c) return;
            b = c.element;
            a._trigger("blur", null, c);
            b && b.removeClass(f).removeAttr("id");
            a.active = undefined
        },
        next: function (a) {
            this.move("next", "." + c + ":first", a)
        },
        nextPage: function () {
            this.superPanel.doScrolling("bottom", true)
        },
        previous: function (a) {
            this.move("prev", "." + c + ":last", a)
        },
        previousPage: function () {
            this.superPanel.doScrolling("top", true)
        },
        first: function () {
            return this.active && !this.active.element.prev().length
        },
        last: function () {
            return this.active && !this.active.element.next().length
        },
        move: function (h, f, b) {
            var a = this,
                g, e;
            if (!a.active) {
                g = a.ul.children(":visible" + f).data(d);
                a.activate(b, g, true);
                return
            }
            e = a.active.element[h + "All"](":visible." + c).eq(0);
            if (e.length) a.activate(b, e.data(d), true);
            else a.activate(b, a.element.children(f).data(d), true)
        },
        select: function (j, k) {
            var e = this,
                g, h, c, i, f;
            if (e.active === undefined) return;
            g = e.active.element;
            if (g === undefined) return;
            c = g.data(d);
            if (!c) return;
            i = e.options.selectionMode === "single";
            if (i) {
                f = e.selectedItem;
                g.addClass(b).attr("aria-selected", "true");
                c.selected = true;
                if (f !== undefined && c !== f) {
                    f.selected = false;
                    f.element && f.element.removeClass(b).removeAttr("aria-selected")
                }
                e.selectedItem = c;
                h = a.inArray(c, e.items);
                e._trigger("selected", j, {
                    item: c,
                    previousItem: f,
                    selectedIndex: h,
                    data: k
                })
            } else {
                c.selected = !c.selected;
                if (c.selected) g.addClass(b).attr("aria-selected", "true");
                else g.removeClass(b).removeAttr("aria-selected", "true");
                h = [];
                e.selectedItems = a.grep(e.items, function (a, b) {
                    a.selected && h.push(b);
                    return a.selected
                });
                e._trigger("selected", j, {
                    selectedIndex: h,
                    item: c,
                    selectedItems: e.selectedItems
                })
            }
        },
        _findItemsByValues: function (c) {
            var b, d = [];
            d = a.grep(this.items, function (d) {
                b = false;
                for (var a = 0; a < c.length; a++) if (d.value === c[a]) b = true;
                return b
            });
            return d
        },
        _findItemsByIndices: function (c) {
            var d = this,
                e = this.items.length,
                b = [];
            a.each(c, function (c, a) {
                a >= 0 && a < e && b.push(d.items[a])
            });
            return b
        },
        getItems: function (b) {
            var g = this,
                f, c, d, e;
            c = a.isArray(b);
            f = !c && typeof b === "number" || c && typeof b[0] === "number";
            d = c ? b : [b];
            e = f ? g._findItemsByIndices(d) : g._findItemsByValues(d);
            return e
        },
        selectItems: function (i, g) {
            var c = this,
                h = this.options.selectionMode === "single",
                e, d, f;
            f = c.getItems(i);
            if (h) {
                if (f.length > 0) {
                    e = f[0];
                    e.selected = true;
                    e.element.addClass(b)
                }
                d = c.selectedItem;
                if (d) {
                    d.selected = false;
                    d.element.removeClass(b)
                }
                c.selectedItem = e;
                g && c._trigger("selected", null, {
                    item: e,
                    previousItem: d
                })
            } else {
                a.each(f, function (c, a) {
                    a.selected = true;
                    a.element.addClass(b)
                });
                c.selectedItems = a.grep(c.items, function (a) {
                    return a.selected
                });
                g && c._trigger("selected", null, {
                    selectedItems: c.selectedItems
                })
            }
        },
        unselectItems: function (f) {
            var c = this,
                g = this.options.selectionMode,
                d, e;
            if (g === "single") {
                d = c.selectedItem;
                if (d) {
                    d.selected = false;
                    d.element.removeClass(b);
                    c.selectedItem = undefined
                }
            } else {
                e = c.getItems(f);
                a.each(e, function (c, a) {
                    a.selected = false;
                    a.element.removeClass(b)
                });
                c.selectedItems = a.grep(c.items, function (a) {
                    return a.selected
                })
            }
        },
        renderList: function () {
            var e = this,
                g = this.ul,
                l = this.options,
                b, c, h, d, i, f;
            g.empty();
            b = e.items;
            if (b === undefined) return;
            c = b.length;
            if (b === undefined || b === null && c === 0) return;
            h = l.selectionMode === "single";
            f = [];
            for (d = 0; d < c; d++) {
                i = b[d];
                f.push(e._renderItem(g, i, d, h))
            }
            a(f).appendTo(g);
            if (c > 0) {
                b[0].element && b[0].element.addClass(j);
                b[c - 1].element && b[c - 1].element.addClass(k)
            }
            e._trigger("listRendered", null, e)
        },
        _renderItem: function (l, c, j) {
            var e = this,
                f = a("<li role='option' class='wijmo-wijlist-item ui-corner-all'></li>"),
                g, i;
            c.element = f;
            c.list = e;
            if (e._trigger("itemRendering", null, c) === false) return;
            g = c.label;
            if (c.templateHtml) g = c.templateHtml;
            else if (c.text !== undefined) g = c.text;
            f.bind("mouseover", function (a) {
                e.activate(a, c, false)
            }).bind("mouseout", function () {
                !e.options.keepHightlightOnMouseLeave && e.deactivate()
            }).data(d, c).append(g);
            if (!e._isInnerData) {
                i = c.imageUrl;
                i !== undefined && i.length > 0 && f.prepend("<img src='" + c.imageUrl + "'>")
            }
            if (c.selected) {
                e.activate(null, c, false);
                f.addClass(b)
            }
            j % 2 === 1 && f.addClass(h);
            e._trigger("itemRendered", null, c);
            return f
        },
        _escapeRegex: function (a) {
            return a === undefined ? a : a.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi, "\\$1")
        },
        adjustOptions: function () {
            var b = this.options,
                a;
            if (b.data !== null) for (a = 0; a < b.listItems.length; a++) {
                delete b.listItems[a].element;
                delete b.listItems[a].list
            }
            return b
        },
        refreshSuperPanel: function () {
            var b = this,
                c = this.element,
                o = this.options,
                d = this.ul,
                q = d.children(".wijmo-wijlist-item:first"),
                p, f, i, j = null,
                h, l, m, e, g, k, n;
            if (!c.is(":visible")) return false;
            f = d.outerHeight();
            i = c.innerWidth();
            if (o.autoSize) j = q.outerHeight(true) * o.maxItemsCount;
            j !== null && c.height(Math.min(j, f));
            h = c.innerHeight();
            l = h / (f - h);
            g = 101 * l / (1 + l);
            m = q.outerHeight() / (f - h) * (101 - g);
            if (b.superPanel === undefined) {
                k = {
                    allowResize: false,
                    keyboardSupport: false,
                    bubbleScrollingEvent: true,
                    hScroller: {
                        scrollBarVisibility: "hidden"
                    },
                    vScroller: {
                        scrollSmallChange: m,
                        scrollLargeChange: g
                    }
                };
                a.extend(k, o.superPanelOptions);
                b.superPanel = c.wijsuperpanel(k).data("wijsuperpanel");
                if (b.superPanel.vNeedScrollBar) {
                    d.setOutWidth(i - 18);
                    b.superPanel.refresh()
                }
            } else {
                e = b.superPanel.options.vScroller;
                e.scrollLargeChange = g;
                e.scrollSmallChange = m;
                b.superPanel.paintPanel();
                if (b.superPanel.vNeedScrollBar) {
                    d.setOutWidth(i - 18);
                    b.superPanel.refresh()
                } else {
                    d.setOutWidth(c.outerWidth());
                    p = c.children(".wijmo-wijsuperpanel-header").outerHeight();
                    c.height(f + p);
                    b.superPanel.refresh()
                }
            }
            n = d.css("padding-top");
            if (n.length > 0) {
                e = b.superPanel.options.vScroller;
                e.firstStepChangeFix = b.superPanel.scrollPxToValue(parseFloat(n), "v")
            } else e.firstStepChangeFix = 0;
            d.setOutWidth(d.parent().parent().innerWidth())
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    var c = {
        general: 0,
        weekEnd: 1,
        otherMonth: 2,
        outOfRange: 4,
        today: 8,
        custom: 16,
        disabled: 32,
        selected: 64,
        gap: 128
    };
    a.widget("wijmo.wijcalendar", {
        options: {
            culture: "",
            monthCols: 1,
            monthRows: 1,
            titleFormat: "MMMM yyyy",
            showTitle: true,
            displayDate: undefined,
            dayRows: 6,
            dayCols: 7,
            weekDayFormat: "short",
            showWeekDays: true,
            showWeekNumbers: false,
            calendarWeekRule: "firstDay",
            minDate: new Date(1900, 0, 1),
            maxDate: new Date(2099, 11, 31),
            showOtherMonthDays: true,
            showDayPadding: false,
            selectionMode: {
                day: true,
                days: true
            },
            allowPreview: false,
            allowQuickPick: true,
            toolTipFormat: "dddd, MMMM dd, yyyy",
            prevTooltip: "Previous",
            nextTooltip: "Next",
            quickPrevTooltip: "Quick Previous",
            quickNextTooltip: "Quick Next",
            prevPreviewTooltip: "",
            nextPreviewTooltip: "",
            navButtons: "default",
            quickNavStep: 12,
            direction: "horizontal",
            duration: 250,
            easing: "easeInQuad",
            popupMode: false,
            autoHide: true,
            customizeDate: null,
            title: null,
            beforeSlide: null,
            afterSlide: null,
            beforeSelect: null,
            afterSelect: null,
            selectedDatesChanged: null
        },
        _create: function () {
            var b = this;
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            a.isFunction(window.wijmoASPNetParseOptions) && wijmoASPNetParseOptions(this.options);
            this.element.addClass("wijmo-wijcalendar ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all").attr("role", "grid");
            this._previewWrapper(this.options.allowPreview);
            this.element.data("preview.wijcalendar", false);
            b.element.is(":hidden") && b.element.wijAddVisibilityObserver && b.element.wijAddVisibilityObserver(function () {
                b.refresh();
                b.element.wijRemoveVisibilityObserver && b.element.wijRemoveVisibilityObserver()
            }, "wijcalendar")
        },
        _init: function () {
            if (this.options.popupMode) {
                var a = {
                    autoHide: !! this.options.autoHide
                }, b = this;
                if (this.options.beforePopup) a.showing = this.options.beforePopup;
                if (this.options.afterPopup) a.shown = this.options.afterPopup;
                if (this.options.beforeClose) a.hiding = this.options.beforeClose;
                a.hidden = function (a) {
                    b.element.removeData("lastdate.wijcalendar");
                    b.options.afterClose && b.options.afterClose.call(a)
                };
                this.element.wijpopup(a)
            }
            this._getSelectedDates();
            this._getDisabledDates();
            this._resetWidth();
            this.refresh();
            this.element.width(this.element.width() + 2)
        },
        destroy: function () {
            a.Widget.prototype.destroy.apply(this, arguments);
            this.close();
            this.element.html("");
            this.element.removeClass("wijmo-wijcalendar ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-datepicker-multi").removeAttr("role");
            var b = this;
            a.each(["preview", "disableddates", "selecteddates", "dragging", "lastdate", "animating"], function (c, a) {
                b.element.removeData(a + ".wijcalendar")
            });
            this._previewWrapper(false)
        },
        _setOption: function (c, b) {
            a.Widget.prototype._setOption.apply(this, arguments);
            switch (c) {
                case "showWeekDays":
                case "showWeekNumbers":
                case "showTitle":
                case "showOtherMonthDays":
                case "selectionMode":
                    this.unSelectAll();
                    this._resetWidth();
                    this.refresh();
                    break;
                case "culture":
                    this.refresh();
                    break;
                case "allowPreview":
                    this._previewWrapper(b);
                    this.refresh();
                    break;
                case "monthCols":
                    this._resetWidth();
                    this.refresh();
                    break;
                case "autoHide":
                    this.element.wijpopup({
                        autoHide: this.options.autoHide
                    });
                    break;
                case "selectedDates":
                    this._getSelectedDates().setDates(b);
                    this.refresh();
                    break;
                case "disabledDates":
                    this._getDisabledDates().setDates(b);
                    this.refresh();
                    break;
                case "displayDate":
                    this.refresh()
            }
        },
        _previewWrapper: function (a) {
            if (a)!this.element.parent().hasClass("wijmo-wijcalendar-preview-wrapper") && this.element.wrap("<div class='wijmo-wijcalendar-preview-wrapper ui-helper-clearfix'></div>");
            else this.element.parent().hasClass("wijmo-wijcalendar-preview-wrapper") && this.element.unwrap()
        },
        _isRTL: function () {
            return !!this._getCulture().isRTL
        },
        refresh: function () {
            this.element.empty().append(this._createCalendar());
            this.element[(this._isRTL() ? "add" : "remove") + "Class"]("ui-datepicker-rtl");
            this._bindEvents()
        },
        refreshDate: function (b) {
            if (!this._monthViews) return;
            if (b < this._groupStartDate || b > this._groupEndDate) return;
            a.each(this._monthViews, function () {
                this._refreshDate(b)
            })
        },
        getDisplayDate: function () {
            var a = this.options.displayDate ? this.options.displayDate : new Date;
            if (b.isSameDate(a, new Date(1900, 0, 1))) a = new Date;
            return a
        },
        getSelectedDate: function () {
            var a = this.options.selectedDates;
            return !a || a.length === 0 ? null : a[0]
        },
        selectDate: function (a) {
            a = new Date(a);
            if (this._getDisabledDates().contains(a)) return false;
            if (a < this.options.minDate || a > this.options.maxDate) return false;
            this._getSelectedDates().add(a);
            this.refreshDate(a);
            return true
        },
        unSelectDate: function (a) {
            a = new Date(a);
            if (this._getDisabledDates().contains(a)) return false;
            if (a < this.options.minDate || a > this.options.maxDate) return false;
            this._getSelectedDates().remove(a);
            this.refreshDate(a);
            return true
        },
        unSelectAll: function () {
            var a = this.options.selectedDates,
                b;
            if (a && a.length > 0) {
                this._getSelectedDates().clear();
                for (b = 0; b < a.length; b++) this.refreshDate(a[b])
            }
        },
        _slideToDate: function (a) {
            if (b.isSameMonth(this.getDisplayDate(), a)) return;
            var c = this.element.is(":visible");
            if (!c) this.options.displayDate = a;
            else {
                if (this._trigger("beforeSlide") === false) return;
                if (this._isSingleMonth()) this._playSlideAnimation(a);
                else this._playMmSlideAnimation(a)
            }
        },
        isPopupShowing: function () {
            return !!this.options.popupMode ? this.element.wijpopup("isVisible") : false
        },
        popup: function (a) {
            this._myGrid = undefined;
            this.refresh();
            this.element.data("dragging.wijcalendar", false);
            this.element.wijpopup("show", a)
        },
        popupAt: function (a, b) {
            this._myGrid = undefined;
            this.refresh();
            this.element.data("dragging.wijcalendar", false);
            this.element.wijpopup("showAt", a, b)
        },
        close: function () {
            this.isPopupShowing() && this.element.wijpopup("hide")
        },
        _getCulture: function (a) {
            return Globalize.findClosestCulture(a || this.options.culture)
        },
        _getDates: function (b) {
            var c = b.toLowerCase() + ".wijcalendar",
                a = this.element.data(c);
            if (a === undefined) {
                a = new f(this, b);
                this.element.data(c, a)
            }
            return a
        },
        _getDisabledDates: function () {
            return this._getDates("disabledDates")
        },
        _getSelectedDates: function () {
            return this._getDates("selectedDates")
        },
        _onDayDragStart: function (a) {
            a.preventDefault();
            a.stopPropagation();
            return false
        },
        _onDayMouseDown: function (c) {
            c.preventDefault();
            c.stopPropagation();
            var d = this.options,
                j = this,
                b, g, e = false,
                f = d.selectedDates,
                i = false,
                h = [];
            if (c.which !== 1) return false;
            b = this._getCellDate(c.currentTarget);
            if (b === undefined) return false;
            if (!d.selectionMode.day) return false;
            g = {
                date: b
            };
            if (this._trigger("beforeSelect", null, g) === false) return false;
            (!d.selectionMode.days || !c.metaKey && !c.shiftKey && !c.ctrlKey) && this.unSelectAll();
            if ( !! d.selectionMode.days) if (c.shiftKey && this.element.data("lastdate.wijcalendar")) {
                this._selectRange(this.element.data("lastdate.wijcalendar"), b);
                e = true
            } else if (c.ctrlKey) {
                this.element.data("lastdate.wijcalendar", b);
                a.each(f, function (c, a) {
                    if (b.getFullYear() === a.getFullYear() && b.getMonth() === a.getMonth() && b.getDate() === a.getDate()) {
                        i = true;
                        return false
                    }
                });
                if (i) this.unSelectDate(b);
                else this.selectDate(b);
                f = d.selectedDates;
                a.each(f, function (b, a) {
                    h.push(new Date(a))
                });
                this._trigger("selectedDatesChanged", null, {
                    dates: h
                });
                e = true
            }
            if (!e) {
                this.element.data("lastdate.wijcalendar", b);
                e = this.selectDate(b);
                this._trigger("selectedDatesChanged", null, {
                    dates: [b]
                })
            }
            if (e) {
                this._trigger("afterSelect", null, g);
                if ( !! d.selectionMode.days) {
                    this.element.data("dragging.wijcalendar", true);
                    a(document.body).bind("mouseup." + this.widgetName, function () {
                        a(document.body).unbind("mouseup." + j.widgetName);
                        j.element.data("dragging.wijcalendar", false)
                    })
                }
            }
            return false
        },
        _onMouseUp: function (a) {
            a.preventDefault();
            a.stopPropagation();
            this.element.data("dragging.wijcalendar", false);
            return false
        },
        _onDayClicked: function (c) {
            var b = this._getCellDate(c.currentTarget);
            if (b === undefined) return false;
            if (!this.options.selectionMode.day) return false;
            if (this.isPopupShowing()) this.close();
            else a(c.currentTarget).hasClass("ui-datepicker-other-month") && this._slideToDate(b);
            return false
        },
        _onDayMouseEnter: function (b) {
            a(b.currentTarget).attr("state", "hover");
            this._refreshDayCell(b.currentTarget);
            if ( !! this.element.data("dragging.wijcalendar")) {
                var c = this._getCellDate(b.currentTarget);
                if (c === undefined) return;
                this.unSelectAll();
                this._selectRange(this.element.data("lastdate.wijcalendar"), c, true)
            }
        },
        _onDayMouseLeave: function (b) {
            a(b.currentTarget).attr("state", "normal");
            this._refreshDayCell(b.currentTarget)
        },
        _selectRange: function (a, e, g) {
            if (a !== undefined && a !== new Date(1900, 1, 1)) {
                var c = a,
                    f = e,
                    d = [];
                if (a > e) {
                    f = a;
                    c = e
                }
                for (;;) {
                    if (c > f) break;
                    this.selectDate(c);
                    d[d.length] = c;
                    c = b.addDays(c, 1)
                }!g && this.element.removeData("lastdate.wijcalendar");
                this._trigger("selectedDatesChanged", null, {
                    dates: d
                })
            } else {
                this.selectDate(a);
                this._trigger("selectedDatesChanged", null, {
                    dates: [a]
                })
            }
            return true
        },
        _getCellDate: function (c) {
            var b = a(c).attr("date");
            return b === undefined ? b : new Date(b)
        },
        _getParentTable: function (c) {
            var b = a(c).parents("table");
            return b.length === 0 ? undefined : b.get(0)
        },
        _initMonthSelector: function (e) {
            if (a(e).data("cells") !== undefined) return;
            var d = e.id.split("_"),
                k, b, h = [],
                f, g, c, j, i;
            if (d[d.length - 1] !== "ms") throw Error.create("not a monthview");
            k = d.slice(0, d.length - 1).join("_");
            b = this._getParentTable(e);
            if (b) {
                if (b.id !== k) throw Error.create("not a monthview");
                for (f = 0; f < b.rows.length; f++) {
                    i = b.rows[f];
                    for (g = 0; g < i.cells.length; g++) {
                        c = i.cells[g];
                        if (c) {
                            j = a(c).attr("daytype");
                            if (j !== undefined) if (a(c).find("a").hasClass("ui-priority-secondary") === false) if (this._isSelectable(parseInt(j, 10))) h[h.length] = c
                        }
                    }
                }
            }
            a(e).data("cells", h)
        },
        _onMonthSelectorClicked: function (h) {
            this._initMonthSelector(h.currentTarget);
            var f = a(h.currentTarget).data("cells"),
                c = [],
                b, g, e, d;
            this.element.removeData("lastdate.wijcalendar");
            this.unSelectAll();
            for (b = 0; b < f.length; b++) {
                g = f[b];
                e = a(g).attr("date");
                if (e !== undefined) {
                    d = new Date(e);
                    this.selectDate(d);
                    c[c.length] = d
                }
            }
            this._trigger("selectedDatesChanged", null, {
                dates: c
            });
            this.isPopupShowing() && this.close();
            return false
        },
        _onMonthSelectorMouseEnter: function (b) {
            this._initMonthSelector(b.currentTarget);
            for (var d = a(b.currentTarget).data("cells"), c = 0; c < d.length; c++) {
                b.currentTarget = d[c];
                this._onDayMouseEnter(b)
            }
        },
        _onMonthSelectorMouseLeave: function (b) {
            this._initMonthSelector(b.currentTarget);
            for (var d = a(b.currentTarget).data("cells"), c = 0; c < d.length; c++) {
                b.currentTarget = d[c];
                this._onDayMouseLeave(b)
            }
        },
        _initWeekDaySelector: function (e) {
            if (a(e).data("cells") !== undefined) return;
            var b = e.id.split("_"),
                g, k, c, h = [],
                f = 0,
                j, d, i;
            if (b[b.length - 2] !== "cs") throw Error.create("not a column");
            g = parseInt(b[b.length - 1], 10);
            k = b.slice(0, b.length - 2).join("_");
            c = this._getParentTable(e);
            if (c) {
                if (c.id !== k) throw Error.create("not a column");
                if (this.options.showWeekDays) f++;
                for (; f < c.rows.length; f++) {
                    j = c.rows[f];
                    if (g < j.cells.length) {
                        d = j.cells[g];
                        if (d) {
                            i = a(d).attr("daytype");
                            if (i !== undefined) if (a(d).find("a").hasClass("ui-priority-secondary") === false) if (this._isSelectable(parseInt(i, 10))) h[h.length] = d
                        }
                    }
                }
            }
            a(e).data("cells", h)
        },
        _onWeekDayClicked: function (h) {
            this._initWeekDaySelector(h.currentTarget);
            var f = a(h.currentTarget).data("cells"),
                c = [],
                b, g, e, d;
            this.unSelectAll();
            for (b = 0; b < f.length; b++) {
                g = a(f[b]);
                e = g.attr("date");
                if (e !== undefined) {
                    d = new Date(e);
                    this.selectDate(d);
                    c[c.length] = d
                }
            }
            this._trigger("selectedDatesChanged", null, {
                dates: c
            });
            this.isPopupShowing() && this.close();
            return false
        },
        _onWeekDayMouseEnter: function (b) {
            this._initWeekDaySelector(b.currentTarget);
            for (var d = a(b.currentTarget).data("cells"), c = 0; c < d.length; c++) {
                b.currentTarget = d[c];
                this._onDayMouseEnter(b)
            }
        },
        _onWeekDayMouseLeave: function (b) {
            this._initWeekDaySelector(b.currentTarget);
            for (var d = a(b.currentTarget).data("cells"), c = 0; c < d.length; c++) {
                b.currentTarget = d[c];
                this._onDayMouseLeave(b)
            }
        },
        _initWeekNumberSelector: function (g) {
            if (a(g).data("cells") !== undefined) return;
            var b = g.id.split("_"),
                j, k, e, h = [],
                f, d, c, i;
            if (b[b.length - 2] !== "rs") throw Error.create("not a row");
            j = parseInt(b[b.length - 1], 10);
            k = b.slice(0, b.length - 2).join("_");
            e = this._getParentTable(g);
            if (e) {
                if (e.id !== k) throw Error.create("not a row");
                f = e.rows[j];
                if (f) {
                    d = 0;
                    if (this.options.showWeekNumbers) d++;
                    for (; d < f.cells.length; d++) {
                        c = f.cells[d];
                        if (c) {
                            i = a(c).attr("daytype");
                            if (i !== undefined) if (a(c).find("a").hasClass("ui-priority-secondary") === false) if (this._isSelectable(parseInt(i, 10))) h[h.length] = c
                        }
                    }
                }
            }
            a(g).data("cells", h)
        },
        _onWeekNumberClicked: function (h) {
            this._initWeekNumberSelector(h.currentTarget);
            var f = a(h.currentTarget).data("cells"),
                c = [],
                b, g, e, d;
            this.unSelectAll();
            for (b = 0; b < f.length; b++) {
                g = a(f[b]);
                e = g.attr("date");
                if (e !== undefined) {
                    d = new Date(e);
                    this.selectDate(d);
                    c[c.length] = d
                }
            }
            this._trigger("selectedDatesChanged", null, {
                dates: c
            });
            this.isPopupShowing() && this.close();
            return false
        },
        _onWeekNumberMouseEnter: function (b) {
            this._initWeekNumberSelector(b.currentTarget);
            for (var d = a(b.currentTarget).data("cells"), c = 0; c < d.length; c++) {
                b.currentTarget = d[c];
                this._onDayMouseEnter(b)
            }
        },
        _onWeekNumberMouseLeave: function (b) {
            this._initWeekNumberSelector(b.currentTarget);
            for (var d = a(b.currentTarget).data("cells"), c = 0; c < d.length; c++) {
                b.currentTarget = d[c];
                this._onDayMouseLeave(b)
            }
        },
        _isAnimating: function () {
            return !!this.element.data("animating.wijcalendar")
        },
        _onPreviewMouseEnter: function (h) {
            if ( !! this.element.data("previewContainer")) return;
            if (this._isAnimating()) return;
            var g = a(h.currentTarget),
                d = g.attr("id"),
                f = this.getDisplayDate(),
                e = this.options.monthCols * this.options.monthRows,
                c = a("<div/>");
            if (d === undefined) return;
            if (d === "prevPreview") e = -e;
            this.options.displayDate = b.addMonths(f, e);
            this.element.data("preview.wijcalendar", true);
            c.appendTo(document.body);
            c.hide();
            c.addClass("wijmo-wijcalendar ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all");
            c.append(this._createCalendar());
            this.options.displayDate = f;
            this.element.data("preview.wijcalendar", false);
            this._createMonthViews();
            c.wijpopup({
                showEffect: "slide",
                showOptions: {
                    direction: d === "prevPreview" ? "right" : "left"
                },
                hideEffect: "slide",
                hideOptions: {
                    direction: d === "prevPreview" ? "right" : "left"
                }
            });
            c.wijpopup("show", {
                my: d === "prevPreview" ? "right top" : "left top",
                at: d === "prevPreview" ? "left top" : "right top",
                of: g
            });
            this.element.data("previewContainer", c)
        },
        _onPreviewMouseLeave: function (c) {
            var f = a(c.currentTarget),
                d = f.attr("id"),
                b = this.element.data("previewContainer"),
                e = this;
            if (d === undefined) return;
            if (b) if (b.wijpopup("isAnimating")) window.setTimeout(function () {
                e._onPreviewMouseLeave(c)
            }, 200);
            else {
                b.wijpopup("hide");
                this.element.removeData("previewContainer")
            }
        },
        _resetWidth: function () {
            if (!this._myGrid) {
                this.element.css("height", "");
                if (this.options.monthCols > 1) {
                    this.element.css("width", 17 * this.options.monthCols + "em");
                    this.element.addClass("ui-datepicker-multi")
                } else {
                    this.element.css("width", "");
                    this.element.removeClass("ui-datepicker-multi")
                }
            }
        },
        _playMmSlideAnimation: function (f) {
            var i = this.element.width(),
                g = this.element.height(),
                h = this.getDisplayDate(),
                c, a, b, e = this.options.direction || "horizontal",
                d = this;
            this.element.height(g);
            this.element.wrapInner("<div class='wijmo-wijcalendar-multi-aniwrapper'></div>");
            c = this.element.find(">:first-child").width(i).height(g);
            a = c.clone(false);
            a.hide();
            this.options.displayDate = f;
            this._createMonthViews();
            a.empty().append(this._createMonthGroup());
            a.appendTo(this.element);
            b = f > h;
            this.element.data("animating.wijcalendar", true);
            c.effect("slide", {
                mode: "hide",
                direction: e === "horizontal" ? b ? "left" : "right" : b ? "up" : "down",
                easing: this.options.easing || "easeOutBack",
                duration: this.options.duration
            }, function () {
                c.remove()
            });
            a.effect("slide", {
                direction: e === "horizontal" ? b ? "right" : "left" : b ? "down" : "up",
                easing: this.options.easing || "easeOutBack",
                duration: this.options.duration
            }, function () {
                while (a.parent().is(".wijmo-wijcalendar-multi-aniwrapper")) a.parent().replaceWith(a);
                a.replaceWith(a.contents());
                d.element.height("");
                d._bindEvents();
                d.element.data("animating.wijcalendar", false);
                d._trigger("afterSlide")
            })
        },
        _playSlideAnimation: function (m) {
            if (!this._isSingleMonth()) return;
            var f = this,
                n = this.getDisplayDate(),
                c = this.element.find(".ui-datepicker-calendar"),
                b, k, l = 1,
                j = this.options.direction || "horizontal",
                h = m > n,
                d = [],
                g, i;
            if (c.parent().is(".wijmo-wijcalendar-aniwrapper")) b = c.parent();
            else {
                b = a.effects.createWrapper(c).css({
                    overflow: "hidden"
                });
                b.removeClass("ui-effects-wrapper");
                b.addClass("wijmo-wijcalendar-aniwrapper")
            }
            if (b.parent().is(".wijmo-wijcalendar-aniwrapper")) k = b.parent();
            else {
                k = a.effects.createWrapper(b).css({
                    overflow: "hidden"
                });
                k.removeClass("ui-effects-wrapper");
                k.addClass("wijmo-wijcalendar-aniwrapper")
            }
            if (this._myGrid) switch (this._myGrid.gridType) {
                case "month":
                    l = 1;
                    break;
                case "year":
                    l = 10;
                    break;
                case "decade":
                    l = 100
            }
            d[d.length] = m;
            g = c.outerWidth();
            i = c.outerHeight();
            if (j === "horizontal") {
                c.width(g).css("float", h ? "left" : "right");
                b.width((d.length + 1) * g);
                b.css("left", h ? 0 : -d.length * g).css("position", "absolute")
            } else {
                b.width(g);
                b.css("top", h ? 0 : -d.length * i).css("position", "absolute");
                b.height((d.length + 1) * i)
            }
            a.each(d, function (l, c) {
                if (f._myGrid === undefined) {
                    var k = new e(f, c),
                        d = f._customize(k.getHtml(true));
                    if (j === "horizontal") d.width(g).css("float", h ? "left" : "right").appendTo(b);
                    else d.appendTo(b)
                } else if (j === "horizontal") a(f._myGrid.getHtml(c, true)).width(g).height(i).css("float", h ? "left" : "right").appendTo(b);
                else a(f._myGrid.getHtml(c, true)).height(i).appendTo(b)
            });
            this.options.displayDate = m;
            this._myGrid === undefined && this._createMonthViews();
            this._refreshTitle();
            this.element.data("animating.wijcalendar", true);
            b.effect("slide", {
                mode: "hide",
                direction: j === "horizontal" ? h ? "left" : "right" : h ? "up" : "down",
                easing: this.options.easing || "easeOutBack",
                distance: (j === "horizontal" ? g : i) * d.length,
                duration: this.options.duration
            }, function () {
                c = b.children(":last");
                while (c.parent().is(".wijmo-wijcalendar-aniwrapper")) c.parent().replaceWith(c);
                c.css({
                    "float": "",
                    width: ""
                });
                f._bindEvents();
                f.element.data("animating.wijcalendar", false);
                f._trigger("afterSlide")
            })
        },
        _onTitleClicked: function () {
            if (!this.options.allowQuickPick || !this._isSingleMonth()) return;
            if (this._isAnimating()) return;
            if (this._myGrid === undefined) this._myGrid = new g(this);
            else switch (this._myGrid.gridType) {
                case "month":
                    this._myGrid.gridType = "year";
                    break;
                case "year":
                    this._myGrid.gridType = "decade";
                    break;
                case "decade":
                    return
            }
            this._refreshTitle();
            this.element.width(this.element.width()).height(this.element.height());
            var d = this.element.find(".ui-datepicker-calendar"),
                b, e, c, o = d.outerWidth(),
                k = d.outerHeight(),
                f, j, n, i, h, m, l = this;
            if (d.parent().is(".wijmo-wijcalendar-aniwrapper")) b = d.parent();
            else b = a.effects.createWrapper(d).css({
                overflow: "hidden"
            }).removeClass("ui-effects-wrapper").addClass("wijmo-wijcalendar-aniwrapper");
            if (b.parent().is(".wijmo-wijcalendar-aniwrapper")) e = b.parent();
            else e = a.effects.createWrapper(b).css({
                overflow: "hidden"
            }).removeClass("ui-effects-wrapper").addClass("wijmo-wijcalendar-aniwrapper").width(o).height(k);
            c = a(this._myGrid.getHtml(true)).css({
                position: "absolute",
                top: 0,
                left: 0,
                opacity: 0
            }).appendTo(e).height(k);
            f = this._myGrid.getSelectedIndex();
            j = Math.floor(f / 4);
            n = f - j * 4;
            i = o / 4;
            h = k / 3;
            m = {
                left: i * n,
                top: h * j,
                width: i,
                height: h
            };
            d.width("100%").height("100%");
            b.css({
                border: "solid 1px #cccccc"
            });
            this.element.data("animating.wijcalendar", true);
            b.effect("size", {
                to: m,
                duration: this.options.duration || 500
            }, function () {
                b.remove()
            });
            c.animate({
                opacity: 1
            }, this.options.duration || 500, function () {
                c.css({
                    position: "",
                    top: "",
                    left: "",
                    filter: ""
                });
                while (c.parent().is(".wijmo-wijcalendar-aniwrapper")) c.parent().replaceWith(c);
                l._bindEvents();
                l.element.data("animating.wijcalendar", false)
            })
        },
        _onMyGridClicked: function (p) {
            if (this._myGrid === undefined) return false;
            if (this._isAnimating()) return false;
            var d = a(p.currentTarget),
                i = parseInt(d.attr("index"), 10),
                o = parseInt(d.attr("value"), 10),
                b = this.element.find(".ui-datepicker-calendar"),
                k, g, j, f, l, h, m, n, c, e = this;
            if (this._myGrid.gridType !== "month") if (!i || i === 11) return false;
            !d.hasClass("ui-state-active") && this._myGrid.select(i, o);
            if (this._myGrid.gridType === "decade") this._myGrid.gridType = "year";
            else if (this._myGrid.gridType === "year") this._myGrid.gridType = "month";
            else this._myGrid = undefined;
            this._refreshTitle();
            j = b.outerWidth();
            f = b.outerHeight();
            if (b.parent().is(".wijmo-wijcalendar-aniwrapper")) g = b.parent();
            else g = a.effects.createWrapper(b).css({
                overflow: "hidden"
            }).removeClass("ui-effects-wrapper").addClass("wijmo-wijcalendar-aniwrapper").width(j).height(f);
            l = a.extend({}, d.position(), {
                width: d.width(),
                height: d.height()
            });
            if (this._myGrid === undefined) {
                this._createMonthViews();
                m = this.getDisplayDate();
                n = this._getMonthView(m);
                h = this._customize(n.getHtml(true))
            } else h = a(this._myGrid.getHtml(true));
            c = h.height(f).appendTo(g);
            k = a.effects.createWrapper(c).css({
                overflow: "hidden"
            }).removeClass("ui-effects-wrapper").addClass("wijmo-wijcalendar-aniwrapper").css(a.extend(l, {
                border: "solid 1px #cccccc",
                position: "absolute"
            }));
            this.element.data("animating.wijcalendar", true);
            k.animate({
                left: 0,
                top: 0,
                width: j,
                height: f
            }, this.options.duration || 500, function () {
                c.css("width", "")
            });
            b.animate({
                opacity: 0
            }, this.options.duration || 500, function () {
                b.remove();
                while (c.parent().is(".wijmo-wijcalendar-aniwrapper")) c.parent().replaceWith(c);
                e._myGrid === undefined && e.element.width("").height("");
                e._bindEvents();
                e.element.data("animating.wijcalendar", false)
            });
            return false
        },
        _onMyGridMouseEnter: function (d) {
            if (this._myGrid === undefined) return;
            var c = a(d.currentTarget),
                b = parseInt(c.attr("index"), 10);
            if (this._myGrid.gridType !== "month" && (b < 0 || b > 11)) return;
            c.addClass("ui-state-hover")
        },
        _onMyGridMouseLeave: function (d) {
            if (this._myGrid === undefined) return;
            var c = a(d.currentTarget),
                b = parseInt(c.attr("index"), 10);
            if (this._myGrid.gridType !== "month" && (b < 0 || b > 11)) return;
            c.removeClass("ui-state-hover")
        },
        _bindEvents: function () {
            if (!this.element.data("preview.wijcalendar") && !this.options.disabledState && !this.options.disabled) {
                this.element.find("div .wijmo-wijcalendar-navbutton").unbind().bind("mouseout.wijcalendar", function () {
                    var b = a(this);
                    b.removeClass("ui-state-hover");
                    if (b.hasClass("ui-datepicker-next-hover")) b.removeClass("ui-datepicker-next-hover");
                    else b.hasClass("ui-datepicker-prev-hover") && b.removeClass("ui-datepicker-prev-hover")
                }).bind("mouseover.wijcalendar", function () {
                    var b = a(this);
                    b.addClass("ui-state-hover");
                    if (b.hasClass("ui-datepicker-next")) b.addClass("ui-datepicker-next-hover");
                    else b.hasClass("ui-datepicker-prev") && b.addClass("ui-datepicker-prev-hover")
                }).bind("click.wijcalendar", a.proxy(this._onNavButtonClicked, this));
                this.element.unbind(".wijcalendar").bind({
                    "mouseup.wijcalendar": a.proxy(this._onMouseUp, this)
                });
                this.element.find(".ui-datepicker-title").unbind().bind("mouseout.wijcalendar", function () {
                    a(this).removeClass("ui-state-hover")
                }).bind("mouseover.wijcalendar", function () {
                    a(this).addClass("ui-state-hover")
                }).bind("click.wijcalendar", a.proxy(this._onTitleClicked, this));
                this.element.find(".wijmo-wijcalendar-prevpreview-button, .wijmo-wijcalendar-nextpreview-button").unbind("mouseenter.wijcalendar").unbind("mouseleave.wijcalendar").bind({
                    "mouseenter.wijcalendar": a.proxy(this._onPreviewMouseEnter, this),
                    "mouseleave.wijcalendar": a.proxy(this._onPreviewMouseLeave, this)
                });
                if (this._myGrid === undefined) {
                    this.element.find(".wijmo-wijcalendar-day-selectable").unbind().bind({
                        "click.wijcalendar": a.proxy(this._onDayClicked, this),
                        "mouseenter.wijcalendar": a.proxy(this._onDayMouseEnter, this),
                        "mouseleave.wijcalendar": a.proxy(this._onDayMouseLeave, this),
                        "mousedown.wijcalendar": a.proxy(this._onDayMouseDown, this),
                        "dragstart.wijcalendar": a.proxy(this._onDayDragStart, this)
                    }); !! this.options.selectionMode.month && this.element.find(".wijmo-wijcalendar-monthselector").unbind().bind({
                        "click.wijcalendar": a.proxy(this._onMonthSelectorClicked, this),
                        "mouseenter.wijcalendar": a.proxy(this._onMonthSelectorMouseEnter, this),
                        "mouseleave.wijcalendar": a.proxy(this._onMonthSelectorMouseLeave, this)
                    }); !! this.options.selectionMode.weekDay && this.element.find(".ui-datepicker-week-day").unbind().bind({
                        "click.wijcalendar": a.proxy(this._onWeekDayClicked, this),
                        "mouseenter.wijcalendar": a.proxy(this._onWeekDayMouseEnter, this),
                        "mouseleave.wijcalendar": a.proxy(this._onWeekDayMouseLeave, this)
                    }); !! this.options.selectionMode.weekNumber && this.element.find(".wijmo-wijcalendar-week-num").unbind().bind({
                        "click.wijcalendar": a.proxy(this._onWeekNumberClicked, this),
                        "mouseenter.wijcalendar": a.proxy(this._onWeekNumberMouseEnter, this),
                        "mouseleave.wijcalendar": a.proxy(this._onWeekNumberMouseLeave, this)
                    })
                } else this.element.find(".wijmo-wijcalendar-day-selectable").unbind().bind({
                    "click.wijcalendar": a.proxy(this._onMyGridClicked, this),
                    "mouseenter.wijcalendar": a.proxy(this._onMyGridMouseEnter, this),
                    "mouseleave.wijcalendar": a.proxy(this._onMyGridMouseLeave, this)
                })
            }
        },
        _isSelectable: function (a) {
            var b = this.options;
            return b.showOtherMonthDays && a & c.otherMonth || !(a & (c.outOfRange | c.disabled | c.otherMonth))
        },
        _getCellClassName: function (b, h, f) {
            var e = this.options,
                a = "",
                d = "ui-state-default",
                g = !! e.selectionMode.day || !! e.selectionMode.days;
            f = f || false;
            if (!f && !e.disabledState && !e.disabled && g && this._isSelectable(b)) a += " wijmo-wijcalendar-day-selectable";
            if (b & c.weekEnd) a += " ui-datepicker-week-end";
            if (b & c.otherMonth) {
                a += " ui-datepicker-other-month";
                d += " ui-priority-secondary"
            }
            if (b & c.outOfRange) {
                a += " wijmo-wijcalendar-outofrangeday";
                d += " ui-priority-secondary"
            }
            if (b & c.gap) a += " wijmo-wijcalendar-gap";
            else {
                if (b & c.disabled) {
                    a += " ui-datepicker-unselectable";
                    d += " ui-state-disabled"
                }
                if (b & c.today) {
                    a += " ui-datepicker-days-cell-over ui-datepicker-today";
                    d += " ui-state-highlight"
                }
                if (b & c.selected && (b & (c.outOfRange | c.disabled)) === 0) {
                    a += " ui-datepicker-current-day";
                    d += " ui-state-active"
                }
                if (b & c.gap) a += " wijmo-wijcalendar-gap";
                if (b & c.custom) a += " wijmo-wijcalendar-customday"
            }
            return {
                cssCell: a,
                cssText: d
            }
        },
        _onNavButtonClicked: function (g) {
            if (this._isAnimating()) return false;
            var c = 1,
                f = a(g.currentTarget).attr("id"),
                e = this.getDisplayDate(),
                d = e;
            if (this._myGrid === undefined) {
                c = f.indexOf("quick") >= 0 ? this.options.quickNavStep : 1;
                c = f.indexOf("next") >= 0 ? c : -c;
                c = c * this.options.monthRows * this.options.monthCols;
                d = b.addMonths(e, c)
            } else {
                c = f.indexOf("next") >= 0 ? 1 : -1;
                switch (this._myGrid.gridType) {
                    case "month":
                        d = b.addYears(e, c);
                        break;
                    case "year":
                        d = b.addYears(e, c * 10);
                        break;
                    case "decade":
                        d = b.addYears(e, c * 100)
                }
            }
            this._slideToDate(d);
            return false
        },
        _getMonthGroupHtml: function () {
            var f = this.getDisplayDate(),
                c, h, a, g, e;
            if (this._isSingleMonth()) {
                c = this._getMonthView(f);
                c.showPreview = this.options.allowPreview && !this.element.data("preview.wijcalendar");
                return c.getHtml()
            }
            h = 100 / this.options.monthCols + "%";
            a = new d;
            for (g = 0; g < this.options.monthRows; g++) {
                for (e = 0; e < this.options.monthCols; e++) {
                    a.writeBeginTag("div");
                    a.writeAttribute("class", "ui-datepicker-group" + (e === 0 ? " ui-datepicker-group-first" : "") + (e === this.options.monthCols - 1 ? " ui-datepicker-group-last" : ""));
                    a.writeAttribute("style", "width:" + h);
                    a.writeTagRightChar();
                    c = this._getMonthView(f);
                    c.showPreview = false;
                    a.write(c.getHtml());
                    a.writeEndTag("div");
                    f = b.addMonths(f, 1)
                }
                a.writeBeginTag("div");
                a.writeAttribute("class", "ui-datepicker-row-break");
                a.writeTagRightChar();
                a.writeEndTag("div")
            }
            return a.toString()
        },
        _getCalendarHtml: function () {
            this._createMonthViews();
            var a = new d;
            a.write(this._getMonthGroupHtml());
            return a.toString()
        },
        _customizeDayCell: function (a) {
            a.attr("state") === undefined && a.attr("state", "normal");
            if (a.attr("daytype") === undefined) return;
            if (a.attr("date") === undefined) return;
            var b = parseInt(a.attr("daytype"), 10),
                d = new Date(a.attr("date")),
                c = a.attr("state") === "hover";
            this.options.customizeDate(a, d, b, c)
        },
        _customize: function (c) {
            var e = this.options,
                d = this,
                b = a(c);
            if (!a.isFunction(e.customizeDate)) return b;
            a.each(b.find(".wijmo-wijcalendar-day-selectable"), function (c, b) {
                d._customizeDayCell(a(b))
            });
            return b
        },
        _createCalendar: function () {
            return this._customize(a(this._getCalendarHtml()))
        },
        _createMonthGroup: function () {
            return this._customize(a(this._getMonthGroupHtml()))
        },
        _getMonthID: function (a) {
            return a.getFullYear() + "_" + (a.getMonth() + 1)
        },
        _createMonthViews: function () {
            this._monthViews = {};
            for (var c = "", a = this.getDisplayDate(), f, d, g, h = 0; h < this.options.monthRows; h++) for (f = 0; f < this.options.monthCols; f++) {
                c = this._getMonthID(a);
                this._monthViews[c] = new e(this, a);
                if (h === 0) {
                    if (f === 0) this._monthViews[c].isFirst = true;
                    if (f === this.options.monthCols - 1) this._monthViews[c].isLast = true
                }
                a = b.addMonths(a, 1)
            }
            a = this.getDisplayDate();
            c = this._getMonthID(a);
            d = this._monthViews[c];
            if (d) this._groupStartDate = d.getStartDate();
            g = this.options.monthRows * this.options.monthCols;
            if (g > 1) {
                a = b.addMonths(a, g - 1);
                c = this._getMonthID(a);
                d = this._monthViews[c]
            }
            if (d) this._groupEndDate = d.getEndDate()
        },
        _getMonthView: function (b) {
            var a = this._getMonthID(b);
            return this._monthViews[a]
        },
        _getId: function () {
            return this.element.attr("id")
        },
        _getChildElement: function (b) {
            var a = this.element.find("[id*='" + b + "']");
            return a.length === 0 ? undefined : a
        },
        _refreshDayCell: function (h) {
            var b = a(h),
                i = this.options,
                d, g, f, e;
            b.attr("state") === undefined && b.attr("state", "normal");
            if (b.attr("daytype") === undefined) return;
            if (b.attr("date") === undefined) return;
            d = parseInt(b.attr("daytype"), 10);
            g = new Date(b.attr("date"));
            f = b.attr("state") === "hover";
            b.attr("class", this._getCellClassName(d, g).cssCell);
            b.removeAttr("aria-selected");
            d & c.selected && b.attr("aria-selected", true);
            if (a.isFunction(i.customizeDate)) if (this._customizeDayCell(b)) return;
            e = b.find("a");
            if (e.length > 0) {
                e.toggleClass("ui-state-hover", f);
                e.toggleClass("ui-state-active", (d & c.selected) !== 0)
            }
        },
        _isSingleMonth: function () {
            return this.options.monthCols * this.options.monthRows === 1
        },
        _splitString: function (f, e, b) {
            if (b === undefined) return f.split(e);
            for (var c = [], d = f.split(e), a = 0; a < d.length; a++) if (a >= b) c[b - 1] = c[b - 1] + e + d[a];
            else c.push(d[a]);
            return c
        },
        _getNavButtonHtml: function (f, e, c, b) {
            var a = new d;
            a.writeBeginTag("a");
            a.writeAttribute("id", f);
            a.writeAttribute("class", e);
            a.writeAttribute("role", "button");
            a.writeAttribute("href", "#");
            if (b) {
                a.writeAttribute("title", b);
                a.writeAttribute("aria-label", b)
            }
            a.writeTagRightChar();
            a.writeBeginTag("span");
            a.writeAttribute("class", c);
            a.writeTagRightChar();
            b && a.write(b);
            a.writeEndTag("span");
            a.writeEndTag("a");
            return a.toString()
        },
        _getTitleText: function (d) {
            if (this._myGrid !== undefined) return this._myGrid.getTitle();
            else {
                var b = d || this.getDisplayDate(),
                    c = this.options.titleFormat || "MMMM yyyy";
                return a.isFunction(this.options.title) ? this.options.title(b, c) || this._formatDate(c, b) : this._formatDate(c, b)
            }
        },
        _refreshTitle: function () {
            this.element.find(".ui-datepicker-title").html(this._getTitleText())
        },
        _fillTitle: function (a, b) {
            a.writeBeginTag("div");
            a.writeAttribute("class", "ui-datepicker-title wijmo-wijcalendar-title ui-state-default ui-corner-all");
            a.writeTagRightChar();
            a.write(this._getTitleText(b));
            a.writeEndTag("div")
        },
        _getHeaderHtml: function (g, e, c) {
            var h = !! this.element.data("preview.wijcalendar"),
                f = h ? "none" : this._isSingleMonth() ? this.options.navButtons : "default",
                b = this.element.is(".ui-datepicker-rtl"),
                a = new d;
            if (f === "quick") {
                a.writeBeginTag("div");
                a.writeAttribute("class", "ui-widget-header wijmo-wijcalendar-header ui-helper-clearfix ui-corner-all");
                a.writeAttribute("role", "heading");
                a.writeTagRightChar(); !! e && a.write(this._getNavButtonHtml("quickprev", "wijmo-wijcalendar-navbutton ui-datepicker-prev ui-corner-all", "ui-icon ui-icon-seek-" + (b ? "next" : "prev"), this.options.quickPrevTooltip.replace("#", this.options.quickNavStep)));
                a.writeBeginTag("div");
                a.writeAttribute("class", "ui-datepicker-header wijmo-wijcalendar-header-inner");
                a.writeTagRightChar(); !! e && a.write(this._getNavButtonHtml("prev", "wijmo-wijcalendar-navbutton ui-datepicker-prev ui-corner-all", "ui-icon ui-icon-circle-triangle-" + (b ? "e" : "w"), this.options.prevTooltip));
                this._fillTitle(a, g); !! c && a.write(this._getNavButtonHtml("next", "wijmo-wijcalendar-navbutton ui-datepicker-next ui-corner-all", "ui-icon ui-icon-circle-triangle-" + (b ? "w" : "e"), this.options.nextTooltip));
                a.writeEndTag("div"); !! c && a.write(this._getNavButtonHtml("quicknext", "wijmo-wijcalendar-navbutton ui-datepicker-next ui-corner-all", "ui-icon ui-icon-seek-" + (b ? "prev" : "next"), this.options.quickNextTooltip.replace("#", this.options.quickNavStep)));
                a.writeEndTag("div")
            } else {
                a.writeBeginTag("div");
                a.writeAttribute("class", "ui-datepicker-header ui-widget-header ui-datepicker-header ui-helper-clearfix ui-corner-all");
                a.writeAttribute("role", "heading");
                a.writeTagRightChar();
                f !== "none" && !! e && a.write(this._getNavButtonHtml("prev", "wijmo-wijcalendar-navbutton ui-datepicker-prev ui-corner-all", "ui-icon ui-icon-circle-triangle-" + (b ? "e" : "w"), this.options.prevTooltip));
                this._fillTitle(a, g);
                f !== "none" && !! c && a.write(this._getNavButtonHtml("next", "wijmo-wijcalendar-navbutton ui-datepicker-next ui-corner-all", "ui-icon ui-icon-circle-triangle-" + (b ? "w" : "e"), this.options.nextTooltip));
                a.writeEndTag("div")
            }
            return a.toString()
        },
        _formatDate: function (c, a) {
            return !b.getTicks(a) ? "&nbsp;" : Globalize.format(a, c, this._getCulture())
        }
    });
    var d = function () {
        this._html = []
    };
    d.prototype = {
        _html: null,
        writeTagLeftChar: function () {
            this._html[this._html.length] = "<"
        },
        writeTagRightChar: function () {
            this._html[this._html.length] = ">"
        },
        write: function (a) {
            this._html[this._html.length] = " " + a + " "
        },
        writeBeginTag: function (a) {
            this._html[this._html.length] = "<" + a
        },
        writeEndTag: function (a) {
            this._html[this._html.length] = "</" + a + ">"
        },
        writeFullBeginTag: function (a) {
            this._html[this._html.length] = "<" + a + ">"
        },
        writeSelfClosingTagEnd: function () {
            this._html[this._html.length] = "/>"
        },
        writeAttribute: function (b, a) {
            if (a === undefined || a === null) return;
            this._html[this._html.length] = " " + b + '="';
            this._html[this._html.length] = a;
            this._html[this._html.length] = '"'
        },
        clean: function () {
            this._html = []
        },
        toString: function () {
            return this._html.join("")
        }
    };
    var b = {
        addDays: function (a, c) {
            var b = new Date(a.getFullYear(), a.getMonth(), a.getDate() + c);
            if (c) if (b.getDate() === a.getDate()) {
                b = new Date(a.getFullYear(), a.getMonth(), a.getDate());
                b.setTime(b.getTime() + c * 864e5)
            }
            return b
        },
        addMonths: function (a, b) {
            return new Date(a.getFullYear(), a.getMonth() + b, 1)
        },
        addYears: function (b, a) {
            return this.addMonths(b, a * 12)
        },
        getDate: function (a) {
            return new Date(a.getFullYear(), a.getMonth(), a.getDate())
        },
        getTicks: function (a) {
            return a.valueOf()
        },
        isSameDate: function (a, b) {
            return a.getFullYear() === b.getFullYear() && a.getMonth() === b.getMonth() && a.getDate() === b.getDate()
        },
        isSameMonth: function (a, b) {
            return a.getFullYear() === b.getFullYear() && a.getMonth() === b.getMonth()
        },
        getDaysInMonth: function (a) {
            return new Date(a.getFullYear(), a.getMonth() + 1, 0).getDate()
        },
        getWeekStartDate: function (a, b) {
            return new Date(a.getFullYear(), a.getMonth(), a.getDate() - (a.getDay() - b + 7) % 7)
        },
        getDayOfYear: function (a) {
            var c = new Date(a.getFullYear(), 0, 1),
                b = this.getTicks(a) - this.getTicks(c),
                d = b / 864e5;
            return Math.floor(d) + 1
        },
        getFirstDayWeekOfYear: function (c, e) {
            var d = this.getDayOfYear(c) - 1,
                a = c.getDay() - d % 7,
                b;
            a = (a - e + 14) % 7;
            b = (d + a) / 7;
            return Math.floor(b) + 1
        },
        getDayOfWeek: function (b, a) {
            return (b.getDay() - a + 7) % 7
        },
        getWeekOfYearFullDays: function (d, f, b, e) {
            var c = this.getDayOfYear(d) - 1,
                a = this.getDayOfWeek(d, b) - c % 7;
            a = (b - a + 14) % 7;
            if (a && a >= e) a -= 7;
            a = c - a;
            return a >= 0 ? Math.floor(a / 7) + 1 : this.getWeekOfYearFullDays(this.addDays(d, -(c + 1)), f, b, e)
        },
        getWeekOfYear: function (b, c, a) {
            switch (c) {
                case "firstDay":
                    return this.getFirstDayWeekOfYear(b, a);
                case "firstFullWeek":
                    return this.getWeekOfYearFullDays(b, c, a, 7);
                case "firstFourDayWeek":
                    return this.getWeekOfYearFullDays(b, c, a, 4)
            }
            return this.getFirstDayWeekOfYear(b, a)
        },
        getDateToken: function (a) {
            return a.getFullYear() + "_" + a.getMonth() + "_" + a.getDate()
        }
    }, e = function (c, a) {
        this.calendar = c;
        if (a === undefined || b.isSameDate(a, new Date(1900, 0, 1))) a = new Date;
        this.displayDate = a;
        this.id = this.calendar._getId() + "_" + this.calendar._getMonthID(a);
        this.isFirst = false;
        this.isLast = false;
        this.showPreview = false;
        this.culture = this.calendar._getCulture();
        this._calcDates(this.displayDate)
    };
    e.prototype = {
        _calcDates: function (a) {
            var c = b.getDaysInMonth(a);
            this._startDateInMonth = new Date(a.getFullYear(), a.getMonth(), 1);
            this._endDateInMonth = b.addDays(this._startDateInMonth, c - 1);
            this._startDate = b.getWeekStartDate(this._startDateInMonth, this.culture.calendar.firstDay);
            this._endDate = b.addDays(this._startDate, this.calendar.options.dayRows * this.calendar.options.dayCols - 1)
        },
        _isFirstMonth: function () {
            var a = this.calendar.getDisplayDate();
            return b.isSameMonth(this._startDateInMonth, a)
        },
        _isLastMonth: function () {
            var a = this.calendar.getDisplayDate();
            a = new Date(a.getFullYear(), a.getMonth(), 1);
            a = b.addMonths(a, this.calendar.options.monthCols * this.calendar.options.monthRows - 1);
            return b.isSameMonth(this._startDateInMonth, a)
        },
        getStartDate: function () {
            return this._startDate
        },
        getEndDate: function () {
            return this._endDate
        },
        _getMonthDate: function () {
            this._startDateInMonth === undefined && this._calcDates(this.getDisplayDate());
            return this._startDateInMonth
        },
        _setMonthDate: function (a) {
            this._calcDates(a)
        },
        _getWeekDayText: function (c, d) {
            d = d || "short";
            var b = this.culture.calendar.days,
                a = "";
            switch (d) {
                case "full":
                    a = b.names[c];
                    break;
                case "firstLetter":
                    a = b.names[c].substring(0, 1);
                    break;
                case "abbreviated":
                    a = b.namesAbbr[c];
                    break;
                default:
                    a = b.namesShort[c]
            }
            return a
        },
        _getRowCount: function () {
            var a = this.calendar.options;
            return a.showWeekDays ? a.dayRows + 1 : a.dayRows
        },
        _getColCount: function () {
            var a = this.calendar.options;
            return a.showWeekNumbers ? a.dayCols + 1 : a.dayCols
        },
        _getDayType: function (d) {
            var e = this.calendar.options,
                a = c.general,
                h = d.getDay(),
                m = h === 6 || h === 0,
                g = d < e.minDate || d > e.maxDate,
                f = d < this._startDateInMonth || d > this._endDateInMonth,
                i = g || this.calendar._getDisabledDates().contains(d),
                j = this.calendar._getSelectedDates().contains(d),
                n = new Date,
                l = b.isSameDate(d, n),
                k = false;
            if (m) a |= c.weekEnd;
            if (l) a |= c.today;
            if (i) a |= c.disabled;
            if (f) a |= c.otherMonth;
            if (g) a |= c.outOfRange;
            if (j) a |= c.selected;
            if (k) a |= c.custom;
            if (f && !e.showOtherMonthDays) a |= c.gap;
            return a
        },
        _refreshDate: function (b) {
            if (b < this._startDate || b > this._endDate) return;
            var j = this.calendar.options,
                i = Math.floor(Math.abs(b - this._startDate) / 864e5),
                f = Math.floor(i / this.calendar.options.dayCols),
                e = Math.floor(i % this.calendar.options.dayCols),
                c, g, d, h;
            if (j.showWeekNumbers) e++;
            if (j.showWeekDays) f++;
            c = a("#" + this.id, this.calendar.element).get(0);
            if (c) if (f < c.rows.length) {
                g = c.rows[f];
                if (e < g.cells.length) {
                    d = g.cells[e];
                    h = this._getDayType(b);
                    a(d).attr("daytype", h.toString());
                    this.calendar._refreshDayCell(d)
                }
            }
        },
        _fillDayCell: function (a, b, k) {
            var j = this.calendar.options,
                f = null,
                d = b.getDate().toString(),
                h = this.calendar._formatDate(j.toolTipFormat || "dddd, MMMM dd, yyyy", b),
                e = this._getDayType(b),
                g = this.calendar._isSelectable(e),
                i = this.calendar._getCellClassName(e, b, k);
            d = j.showDayPadding && d.length === 1 ? "0" + d : d;
            a.writeBeginTag("td");
            a.writeAttribute("daytype", e.toString());
            if (g) {
                a.writeAttribute("title", h);
                a.writeAttribute("aria-label", h)
            }
            a.writeAttribute("date", b.toDateString());
            a.writeAttribute("class", i.cssCell);
            a.writeAttribute("role", "gridcell");
            !g && a.writeAttribute("aria-disabled", "true");
            a.writeTagRightChar();
            if (e & c.gap) a.write("&#160;");
            else if (f && f.content) a.write(f.content);
            else {
                a.writeBeginTag("a");
                a.writeAttribute("class", i.cssText);
                a.writeAttribute("href", "#");
                a.writeAttribute("onclick", "return false;");
                a.writeTagRightChar();
                a.write(d);
                a.writeEndTag("a")
            }
            a.writeEndTag("td")
        },
        getHtml: function (g) {
            g = !! g;
            var c = this.calendar.options,
                h = !! this.calendar.element.data("preview.wijcalendar"),
                a = new d,
                e, m, f, k, q, o, r, l, j, i, p, n;
            !g && c.showTitle && a.write(this.calendar._getHeaderHtml(this._startDateInMonth, this.isFirst, this.isLast));
            if (!g && !h && this.showPreview) {
                a.writeBeginTag("div");
                a.writeAttribute("class", "wijmo-wijcalendar-prevpreview-button");
                a.writeAttribute("role", "button");
                a.writeAttribute("aria-haspopup", "true");
                a.writeAttribute("id", "prevPreview");
                a.writeTagRightChar();
                a.writeBeginTag("a");
                a.writeAttribute("class", "ui-icon ui-icon-grip-dotted-vertical");
                a.writeAttribute("href", "#");
                a.writeAttribute("title", c.prevPreviewTooltip);
                a.writeAttribute("aria-label", c.prevPreviewTooltip);
                a.writeAttribute("onclick", "return false;");
                a.writeTagRightChar();
                a.write("&#160;");
                a.writeEndTag("a");
                a.writeEndTag("div")
            }
            a.writeBeginTag("table");
            a.writeAttribute("id", this.id);
            a.writeAttribute("class", "ui-datepicker-calendar wijmo-wijcalendar-table");
            a.writeAttribute("role", "grid");
            a.writeAttribute("summary", this.calendar._getTitleText(this._startDateInMonth));
            a.writeAttribute("onselectstart", "return false;");
            a.writeTagRightChar();
            if (c.showWeekDays) {
                a.writeFullBeginTag("thead");
                a.writeBeginTag("tr");
                a.writeTagRightChar();
                if (c.showWeekNumbers) {
                    a.writeBeginTag("th");
                    a.writeAttribute("id", this.id + "_ms");
                    a.writeAttribute("class", "ui-datepicker-week-col wijmo-wijcalendar-monthselector" + ( !! c.selectionMode.month ? " wijmo-wijcalendar-selectable" : ""));
                    a.writeAttribute("role", "columnheader");
                    a.writeTagRightChar();
                    if ( !! c.selectionMode.month && !h && !c.disabledState && !c.disabled) {
                        a.writeBeginTag("a");
                        a.writeAttribute("class", "ui-icon ui-icon-triangle-1-se");
                        a.writeSelfClosingTagEnd()
                    } else a.write("Wk");
                    a.writeEndTag("th")
                }
                f = this._startDate.getDay();
                k = this._startDate;
                for (e = 0; e < c.dayCols; e++) {
                    q = f === 6 || f === 0;
                    o = e + (c.showWeekNumbers ? 1 : 0);
                    r = this._getWeekDayText(f, c.weekDayFormat);
                    l = this._getWeekDayText(f, "full");
                    a.writeBeginTag("th");
                    a.writeAttribute("id", this.id + "_cs_" + o);
                    a.writeAttribute("class", "ui-datepicker-week-day" + (q ? " ui-datepicker-week-end" : "") + ( !! c.selectionMode.weekDay ? " wijmo-wijcalendar-selectable" : ""));
                    a.writeAttribute("role", "columnheader");
                    a.writeTagRightChar();
                    a.writeBeginTag("span");
                    a.writeAttribute("title", l);
                    a.writeAttribute("aria-label", l);
                    a.writeTagRightChar();
                    a.write(r);
                    a.writeEndTag("span");
                    a.writeEndTag("th");
                    f = (f + 1) % 7;
                    k = b.addDays(k, 1)
                }
                a.writeEndTag("tr");
                a.writeEndTag("thead")
            }
            a.writeFullBeginTag("tbody");
            j = this._startDate;
            i = this._startDateInMonth;
            for (e = 0; e < c.dayRows; e++) {
                a.writeBeginTag("tr");
                a.writeTagRightChar();
                if (c.showWeekNumbers) {
                    p = e + (c.showWeekDays ? 1 : 0);
                    a.writeBeginTag("td");
                    a.writeAttribute("id", this.id + "_rs_" + p);
                    a.writeAttribute("class", "ui-datepicker-week-col wijmo-wijcalendar-week-num" + ( !! c.selectionMode.weekNumber ? " wijmo-wijcalendar-selectable" : ""));
                    a.writeAttribute("role", "rowheader");
                    a.writeTagRightChar();
                    n = b.getWeekOfYear(i, c.calendarWeekRule, this.culture.calendar.firstDay);
                    a.write(n);
                    a.writeEndTag("td");
                    i = b.addDays(i, c.dayCols)
                }
                for (m = 0; m < c.dayCols; m++) {
                    this._fillDayCell(a, j, h);
                    j = b.addDays(j, 1)
                }
                a.writeEndTag("tr")
            }
            a.writeEndTag("tbody");
            a.writeEndTag("table");
            if (!g && !h && this.showPreview) {
                a.writeBeginTag("div");
                a.writeAttribute("class", "wijmo-wijcalendar-nextpreview-button");
                a.writeAttribute("role", "button");
                a.writeAttribute("aria-haspopup", "true");
                a.writeAttribute("id", "nextPreview");
                a.writeTagRightChar();
                a.writeBeginTag("a");
                a.writeAttribute("class", "ui-icon ui-icon-grip-dotted-vertical");
                a.writeAttribute("href", "#");
                a.writeAttribute("title", c.nextPreviewTooltip);
                a.writeAttribute("aria-label", c.nextPreviewTooltip);
                a.writeAttribute("onclick", "return false;");
                a.writeTagRightChar();
                a.write("&#160;");
                a.writeEndTag("a");
                a.writeEndTag("div")
            }
            return a.toString()
        }
    };
    var f = function (b, a) {
        this._calendar = b;
        this._optionName = a;
        this._normalize()
    };
    f.prototype = {
        _calendar: null,
        _optionName: "selectedDates",
        getDates: function () {
            if (this._calendar.options[this._optionName] === undefined) this._calendar.options[this._optionName] = [];
            return this._calendar.options[this._optionName]
        },
        setDates: function (a) {
            this._calendar.options[this._optionName] = a;
            this._normalize()
        },
        getCount: function () {
            return this.getDates().length
        },
        clear: function () {
            this.setDates([])
        },
        add: function (a) {
            this.addRange(a, a)
        },
        remove: function (a) {
            this.removeRange(a, a)
        },
        indexOf: function (a) {
            return !this.getCount() ? -1 : this._findRangeBound(a, true, false)
        },
        contains: function (a) {
            return this.indexOf(a) !== -1
        },
        removeRange: function (g, f) {
            if (!this.getCount()) return;
            var c = this._findRangeBound(g, false, true),
                a = this._findRangeBound(f, false, false),
                b, d, e;
            if (c < 0 || a < 0) return;
            if (c > a) return;
            b = this.getDates();
            if (b[a] > f) return;
            d = !c ? [] : b.slice(0, c);
            e = a >= b.length - 1 ? [] : b.slice(a + 1);
            this.setDates(d.concat(e))
        },
        addRange: function (c, d) {
            this.removeRange(c, d);
            var g = this.getDates(),
                e = this._findRangeBound(c, false, true),
                h = !e ? [] : g.slice(0, e),
                i = g.slice(e),
                f = [],
                a;
            c = b.getDate(c);
            d = b.getDate(d);
            for (a = c; a <= d; a = b.addDays(a, 1)) f[f.length] = a;
            this.setDates(h.concat(f.concat(i)))
        },
        _findRangeBound: function (f, h, g) {
            var e = this.getDates(),
                c = 0,
                d = e.length,
                a;
            while (c < d) {
                a = c + d >> 1;
                if (b.isSameDate(f, e[a])) return a;
                if (f < e[a]) d = a;
                else c = a + 1
            }
            return h ? -1 : g ? c : d
        },
        _parseDate: function (a) {
            var b;
            if (!a) a = new Date;
            else if (typeof a === "string") b = a;
            if (b) {
                b = b.replace(/-/g, "/");
                try {
                    a = new Date(b);
                    if (isNaN(a)) a = new Date
                } catch (c) {
                    a = new Date
                }
            }
            return a
        },
        _normalize: function () {
            var c = this._calendar.options[this._optionName],
                d = this,
                b;
            if (a.isArray(c)) {
                b = a.map(c, function (a) {
                    return d._parseDate(a)
                });
                this._calendar.options[this._optionName] = b.sort(function (a, b) {
                    return a.getTime() - b.getTime()
                })
            }
        }
    };
    var g = function (a) {
        this.gridType = "month";
        this.calendar = a;
        this.culture = a._getCulture()
    };
    g.prototype = {
        gridType: "month",
        calendar: null,
        culture: undefined,
        select: function (c, b) {
            var a = this.calendar.getDisplayDate();
            switch (this.gridType) {
                case "month":
                    a.setMonth(b);
                    break;
                case "year":
                    a.setFullYear(b);
                    break;
                case "decade":
                    a.setFullYear(b)
            }
            this.calendar.options.displayDate = a
        },
        getSelectedIndex: function () {
            var b = this.calendar.getDisplayDate(),
                a = b.getFullYear(),
                d = Math.floor(a / 10) * 10 - 1,
                c = Math.floor(a / 100) * 100 - 10;
            switch (this.gridType) {
                case "month":
                    return b.getMonth();
                case "year":
                    return a - d;
                case "decade":
                    return Math.floor((a - c) / 10)
            }
            return 0
        },
        getTitle: function () {
            var d = this.calendar.getDisplayDate(),
                a = d.getFullYear(),
                c = Math.floor(a / 10) * 10 - 1,
                b = Math.floor(a / 100) * 100 - 10;
            switch (this.gridType) {
                case "month":
                    return a.toString();
                case "year":
                    return c + 1 + " - " + (c + 10);
                case "decade":
                    return b + 10 + " - " + (b + 109)
            }
            return ""
        },
        getHtml: function (g, l) {
            if (g === undefined) g = this.calendar.getDisplayDate();
            else if (typeof g === "boolean") {
                l = g;
                g = this.calendar.getDisplayDate()
            }
            l = !! l;
            var e = this.calendar.options,
                s = 3,
                u = 4,
                a = new d,
                p, h, o, r, q, t, m, n, c, k, f, j, b, i;
            e.showTitle && !l && a.write(this.calendar._getHeaderHtml(null, true, true));
            p = 100 / s + "%";
            p = "30%";
            a.writeBeginTag("table");
            a.writeAttribute("class", "ui-datepicker-calendar wijmo-wijcalendar-mygrid");
            a.writeAttribute("role", "grid");
            a.writeAttribute("onselectstart", "return false;");
            a.writeTagRightChar();
            h = g.getFullYear();
            o = g.getFullYear() * 12;
            r = Math.floor(h / 10) * 10 - 1;
            q = Math.floor(h / 100) * 100 - 10;
            t = this.culture.calendar.months;
            for (m = 0; m < s; m++) {
                a.writeBeginTag("tr");
                a.writeAttribute("height", p);
                a.writeTagRightChar();
                for (n = 0; n < u; n++) {
                    c = m * 4 + n;
                    k = false;
                    f = false;
                    j = "";
                    b = null;
                    switch (this.gridType) {
                        case "month":
                            if (g.getMonth() === c) k = true;
                            b = c;
                            j = t.namesAbbr[c];
                            f = o + c < e.minDate.getFullYear() * 12 + e.minDate.getMonth() || o + c > e.maxDate.getFullYear() * 12 + e.maxDate.getMonth();
                            break;
                        case "year":
                            if (c === 0 || c === 11) f = true;
                            b = r + c;
                            if (b < e.minDate.getFullYear() || b > e.maxDate.getFullYear()) f = true;
                            else k = h === b;
                            j = b.toString();
                            break;
                        case "decade":
                            if (c === 0 || c === 11) f = true;
                            b = q + c * 10;
                            if (b + 10 < e.minDate.getFullYear() || b > e.maxDate.getFullYear()) f = true;
                            else k = h >= b && h < b + 10;
                            j = b.toString() + "-<br/>" + (b + 9).toString()
                    }
                    i = "ui-datepicker-week-day";
                    if (f) i = i + " ui-datepicker-other-month ui-priority-secondary ui-datepicker-unselectable";
                    else if (!e.disabledState && !e.disabled) i += " wijmo-wijcalendar-day-selectable";
                    i += " ui-state-default" + (f ? " ui-state-disabled" : "") + (k ? " ui-state-active ui-state-highlight" : "");
                    a.writeBeginTag("td");
                    a.writeAttribute("class", i);
                    a.writeAttribute("role", "gridcell");
                    a.writeAttribute("index", c.toString());
                    a.writeAttribute("value", b.toString());
                    a.writeAttribute("other", f.toString());
                    a.writeTagRightChar();
                    a.writeBeginTag("a");
                    a.writeAttribute("href", "#");
                    a.writeTagRightChar();
                    a.write(j);
                    a.writeEndTag("a");
                    a.writeEndTag("td")
                }
                a.writeEndTag("tr")
            }
            a.writeEndTag("table");
            return a.toString()
        }
    }
})(jQuery);
(function (a) {
    "use strict";
    a.widget("wijmo.wijexpander", {
        options: {
            allowExpand: true,
            animated: "slide",
            contentUrl: "",
            expanded: true,
            expandDirection: "bottom"
        },
        _setOption: function (c, b) {
            switch (c) {
                case "contentUrl":
                    if (b) this.element.find("> .ui-widget-content").wijContent(b);
                    else this.element.find("> .ui-widget-content").html("");
                    break;
                case "disabled":
                    if (b) {
                        this.element.addClass("ui-state-disabled").find("> .ui-expander-header").addClass("ui-state-disabled");
                        this.element.find("> .ui-widget-content").addClass("ui-state-disabled")
                    } else {
                        this.element.removeClass("ui-state-disabled").find("> .ui-expander-header").removeClass("ui-state-disabled");
                        this.element.find("> .ui-widget-content").removeClass("ui-state-disabled")
                    }
                    break;
                case "expandDirection":
                    this._onDirectionChange(b, true, this.options.expandDirection);
                    break;
                case "expanded":
                    if (b) this.expand();
                    else this.collapse();
                    return
            }
            a.Widget.prototype._setOption.apply(this, arguments)
        },
        _create: function () {
            var d = this.element.children(),
                b, c;
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            this.element.addClass("wijmo-wijexpander ui-expander ui-widget ui-helper-reset ui-expander-icons");
            b = a(d[0]);
            c = a(d[1]);
            if (this.options.expandDirection === "left" || this.options.expandDirection === "top") {
                b.remove();
                b.insertAfter(c)
            }
            b.addClass("ui-expander-header ui-helper-reset");
            b.attr("role", "tab");
            c.attr("role", "tabpanel");
            b.find("> a").length === 0 && b.wrapInner('<a href="#"></a>');
            b.find("> .ui-icon").length === 0 && a('<span class="ui-icon"></span>').insertBefore(a("> a", b)[0]);
            c.addClass("ui-expander-content ui-helper-reset ui-widget-content")
        },
        _init: function () {
            var b = this.options;
            this._onDirectionChange(b.expandDirection, false);
            b.contentUrl && a(".ui-widget-content", this.element).wijContent(this.options.contentUrl);
            if (!b.expanded) {
                this.element.find("> .ui-widget-content").hide();
                this.element.find("> .ui-expander-header").addClass("ui-state-default ui-corner-all").attr({
                    "aria-expanded": "false",
                    tabIndex: -1
                }).find("> .ui-icon").addClass(this._triangleIconClosed)
            } else {
                this.element.find("> .ui-expander-header").addClass("ui-state-active").attr({
                    "aria-expanded": "true",
                    tabIndex: 0
                }).addClass(this._headerCornerOpened).find("> .ui-icon").addClass(this._triangleIconOpened);
                this.element.find("> .ui-widget-content").addClass("ui-expander-content-active").addClass(this._contentCornerOpened).wijTriggerVisibility()
            }
            if (b.disabled) {
                this.element.addClass("ui-state-disabled").find("> .ui-expander-header").addClass("ui-state-disabled");
                this.element.find("> .ui-widget-content").addClass("ui-state-disabled")
            }
            this._bindLiveEvents()
        },
        destroy: function () {
            this._unbindLiveEvents();
            this.element.removeClass("wijmo-wijexpander ui-expander ui-widget ui-helper-reset ui-expander-icons");
            a.Widget.prototype.destroy.apply(this, arguments)
        },
        _bindLiveEvents: function () {
            a(".ui-expander-header", this.element[0]).live("click.wijexpander", jQuery.proxy(this._onHeaderClick, this)).live("mouseenter.wijexpander", function () {
                a(this).addClass("ui-state-hover")
            }).live("mouseleave.wijexpander", function () {
                a(this).removeClass("ui-state-hover")
            }).live("focus.wijexpander", function () {
                a(this).addClass("ui-state-focus")
            }).live("blur.wijexpander", function () {
                a(this).removeClass("ui-state-focus")
            })
        },
        _unbindLiveEvents: function () {
            a(".ui-expander-header", this.element[0]).die(".wijexpander")
        },
        _onDirectionChange: function (l, g, j) {
            var b, i, h, f, e, k, d, c;
            j && j !== l && this.element.removeClass("ui-expander-" + j);
            if (g) {
                i = this.element.find(".ui-expander-header." + this._headerCornerOpened);
                i.removeClass(this._headerCornerOpened);
                h = this.element.find(".ui-widget-content." + this._contentCornerOpened);
                h.removeClass(this._contentCornerOpened);
                f = this.element.find("." + this._triangleIconOpened);
                e = this.element.find("." + this._triangleIconClosed);
                f.removeClass(this._triangleIconOpened);
                e.removeClass(this._triangleIconClosed)
            }
            switch (l) {
                case "top":
                    this._headerCornerOpened = "ui-corner-bottom";
                    this._contentCornerOpened = "ui-corner-top";
                    this._triangleIconOpened = "ui-icon-triangle-1-n";
                    this._triangleIconClosed = "ui-icon-triangle-1-e";
                    b = true;
                    this.element.removeClass("ui-helper-horizontal");
                    this.element.addClass("ui-expander-top");
                    break;
                case "right":
                    this._headerCornerOpened = "ui-corner-left";
                    this._contentCornerOpened = "ui-corner-right";
                    this._triangleIconOpened = "ui-icon-triangle-1-e";
                    this._triangleIconClosed = "ui-icon-triangle-1-s";
                    b = false;
                    this.element.addClass("ui-helper-horizontal");
                    this.element.addClass("ui-expander-right");
                    break;
                case "left":
                    this._headerCornerOpened = "ui-corner-right";
                    this._contentCornerOpened = "ui-corner-left";
                    this._triangleIconOpened = "ui-icon-triangle-1-w";
                    this._triangleIconClosed = "ui-icon-triangle-1-s";
                    b = true;
                    this.element.addClass("ui-helper-horizontal");
                    this.element.addClass("ui-expander-left");
                    break;
                default:
                    this._headerCornerOpened = "ui-corner-top";
                    this._contentCornerOpened = "ui-corner-bottom";
                    this._triangleIconOpened = "ui-icon-triangle-1-s";
                    this._triangleIconClosed = "ui-icon-triangle-1-e";
                    b = false;
                    this.element.removeClass("ui-helper-horizontal");
                    this.element.addClass("ui-expander-bottom")
            }
            k = this.element.data("rightToLeft");
            this.element.data("rightToLeft", b);
            if (g) {
                f.addClass(this._triangleIconOpened);
                e.addClass(this._triangleIconClosed);
                i.addClass(this._headerCornerOpened);
                h.addClass(this._contentCornerOpened)
            }
            g && b !== k && this.element.children(".ui-expander-header").each(function () {
                c = a(this);
                if (b) {
                    d = c.next(".ui-expander-content");
                    c.remove();
                    c.insertAfter(d)
                } else {
                    d = c.prev(".ui-expander-content");
                    c.remove();
                    c.insertBefore(d)
                }
            })
        },
        collapse: function () {
            var d = this.options,
                e, c, f, b;
            if (!d.allowExpand) return;
            if (this.element.hasClass("ui-state-disabled")) return false;
            if (!this._trigger("beforeCollapse")) return false;
            if (d.animated) {
                e = {
                    expand: false,
                    content: this.element.find("> .ui-widget-content"),
                    complete: jQuery.proxy(function () {
                        this.element.find("> .ui-widget-content").removeClass("ui-expander-content-active");
                        this._trigger("afterCollapse");
                        this.element.find("> .ui-widget-content").css("display", "")
                    }, this),
                    horizontal: this.element.hasClass("ui-helper-horizontal")
                };
                c = a.wijmo.wijexpander.animations;
                f = d.duration;
                b = d.animated;
                if (b && !c[b] && !a.easing[b]) b = "slide";
                if (!c[b]) c[b] = function (a) {
                    this.slide(a, {
                        easing: b,
                        duration: f || 700
                    })
                };
                c[b](e)
            } else {
                this.element.find("> .ui-widget-content").hide();
                this._trigger("afterCollapse")
            }
            this.element.find("> .ui-expander-header").removeClass("ui-state-active").removeClass(this._headerCornerOpened).attr({
                "aria-expanded": "false",
                tabIndex: -1
            }).addClass("ui-state-default ui-corner-all").find("> .ui-icon").removeClass(this._triangleIconOpened).addClass(this._triangleIconClosed);
            this.options.expanded = false;
            return true
        },
        expand: function () {
            var d = this.options,
                e, c, f, b;
            if (!d.allowExpand) return;
            if (this.element.hasClass("ui-state-disabled")) return false;
            if (!this._trigger("beforeExpand")) return false;
            if (d.animated) {
                e = {
                    expand: true,
                    content: this.element.find("> .ui-widget-content"),
                    complete: jQuery.proxy(function () {
                        this.element.find("> .ui-widget-content").addClass("ui-expander-content-active").addClass(this._contentCornerOpened).wijTriggerVisibility();
                        this._trigger("afterExpand");
                        this.element.find("> .ui-widget-content").css("display", "")
                    }, this),
                    horizontal: this.element.hasClass("ui-helper-horizontal")
                };
                c = a.wijmo.wijexpander.animations;
                f = d.duration;
                b = d.animated;
                if (b && !c[b] && !a.easing[b]) b = "slide";
                if (!c[b]) c[b] = function (a) {
                    this.slide(a, {
                        easing: b,
                        duration: f || 700
                    })
                };
                c[b](e)
            } else {
                this.element.find("> .ui-widget-content").show();
                this._trigger("afterExpand")
            }
            this.element.find("> .ui-expander-header").removeClass("ui-state-default ui-corner-all").addClass("ui-state-active").addClass(this._headerCornerOpened).attr({
                "aria-expanded": "true",
                tabIndex: 0
            }).find("> .ui-icon").removeClass(this._triangleIconClosed).addClass(this._triangleIconOpened);
            this.options.expanded = true;
            return true
        },
        _onHeaderClick: function () {
            this.option("expanded", !this.options.expanded);
            return false
        }
    });
    a.extend(a.wijmo.wijexpander, {
        animations: {
            slide: function (b, c) {
                b = a.extend({
                    easing: "swing",
                    duration: 300
                }, b, c);
                if (b.expand) b.content.stop(true, true).animate(b.horizontal ? {
                    width: "show",
                    opacity: "show"
                } : {
                    height: "show",
                    opacity: "show"
                }, b);
                else b.content.stop(true, true).animate(b.horizontal ? {
                    width: "hide",
                    opacity: "hide"
                } : {
                    height: "hide",
                    opacity: "hide"
                }, b)
            }
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    var b = "wijmo-wijmenu-item";
    a.widget("wijmo.wijmenu", {
        options: {
            trigger: "",
            triggerEvent: "click",
            position: {},
            animation: {
                animated: "slide",
                duration: 400,
                easing: null
            },
            showAnimation: {},
            hideAnimation: {
                animated: "fade",
                duration: 400,
                easing: null
            },
            showDelay: 400,
            hideDelay: 400,
            slidingAnimation: {
                duration: 400,
                easing: null
            },
            mode: "flyout",
            superPanelOptions: null,
            checkable: false,
            orientation: "horizontal",
            direction: "ltr",
            maxHeight: 200,
            backLink: true,
            backLinkText: "Back",
            topLinkText: "All",
            crumbDefaultText: "Choose an option",
            select: null,
            focus: null,
            blur: null,
            showing: null,
            shown: null,
            hidding: null,
            hidden: null,
            items: []
        },
        _preventEvent: function (a) {
            a.preventDefault();
            a.stopImmediatePropagation()
        },
        _create: function () {
            var b = this,
                f = b.options,
                h = f.direction,
                c = f.mode,
                g, d = b.element,
                i, e = a.ui.keyCode,
                j = f.disabled;
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            d.is(":hidden") && d.wijAddVisibilityObserver && d.wijAddVisibilityObserver(function () {
                b.refresh();
                d.wijRemoveVisibilityObserver && d.wijRemoveVisibilityObserver()
            }, "wijmenu");
            d.data("wijmomenu", b.widgetName);
            b.clickNameSpace = "click.wijmenudoc" + b._newId();
            d.hide();
            b.cssPre = "wijmo-wijmenu";
            b.nowIndex = 9999;
            b.activeItem = null;
            b.refresh();
            d.attr("tabIndex", 0);
            if (b._getDisabled()) {
                b.disable();
                if (f.disabledState === true) f.disabled = j
            }
            d.bind("keydown.wijmenuEvent", function (d) {
                if (b._getDisabled()) return;
                c === "sliding" && b._getSublist().stop(true, true);
                var j = b.activeItem,
                    k, m, l = f.orientation;
                if (j) {
                    k = j._isRoot();
                    i = j._getSublist()
                } else k = true;
                switch (d.keyCode) {
                    case e.PAGE_UP:
                        b.previousPage(d);
                        b._preventEvent(d);
                        break;
                    case e.PAGE_DOWN:
                        b.nextPage(d);
                        b._preventEvent(d);
                        break;
                    case e.UP:
                        if (l === "vertical" || c === "sliding" || !k) {
                            b.previous(d);
                            b._preventEvent(d)
                        }
                        break;
                    case e.DOWN:
                        if (l === "vertical" || c === "sliding" || !k) {
                            b.next(d);
                            b._preventEvent(d)
                        } else if (j) if (c === "flyout" && a.wijmo.wijmenu._hasVisibleSubMenus(j) > 0) i.is(":hidden") && j._showFlyoutSubmenu(d, function () {
                            b.activate(d, j._getFirstSelectableSubItem())
                        });
                        break;
                    case e.RIGHT:
                        if (l === "horizontal" && k && c === "flyout") {
                            if (h === "rtl") b.previous(d);
                            else b.next(d);
                            b._preventEvent(d)
                        } else if (j) {
                            g = j.getParent();
                            if (h === "rtl") b._keyDownToCloseSubmenu(c, d, g);
                            else b._keyDownToOpenSubmenu(j, c, d, i)
                        }
                        break;
                    case e.LEFT:
                        if (l === "horizontal" && k && c === "flyout") {
                            if (h === "rtl") b.next(d);
                            else b.previous(d);
                            b._preventEvent(d)
                        } else {
                            if (j) g = j.getParent();
                            if (h === "rtl") b._keyDownToOpenSubmenu(j, c, d, i);
                            else b._keyDownToCloseSubmenu(c, d, g)
                        }
                        break;
                    case e.ENTER:
                        if (!j) return;
                        m = j._getLink();
                        if (c === "flyout") break;
                        else {
                            b.select();
                            m.is("a") && m.attr("href") === "#" && b._preventEvent(d)
                        }
                        break;
                    case e.TAB:
                        b.next(d);
                        b._preventEvent(d)
                }
            })
        },
        _keyDownToOpenSubmenu: function (b, e, d, c) {
            var f = this;
            if (e === "flyout" && a.wijmo.wijmenu._hasVisibleSubMenus(b) > 0) c.is(":hidden") && b._showFlyoutSubmenu(d, function () {
                f.activate(d, b._getFirstSelectableSubItem())
            });
            else if (e === "sliding") c.length > 0 && b._getLink().trigger("click", b._getFirstSelectableSubItem())
        },
        _keyDownToCloseSubmenu: function (f, e, c) {
            var b = this,
                g = b.options,
                d;
            if (f === "flyout") {
                if (c) {
                    c._hideCurrentSubmenu(e);
                    b.activate(e, c)
                }
            } else {
                g.backLink && b._backLink && b._backLink.is(":visible") && b._backLink.trigger("click", function () {
                    c && b.activate(e, c)
                });
                d = a(".wijmo-wijmenu-breadcrumb", b.domObject.menucontainer).find("li a");
                d.length > 0 && d.eq(d.length - 2).trigger("click", function () {
                    c && b.activate(e, c)
                })
            }
        },
        _createMenuItems: function () {
            for (var b = this, d = [], f = b.options.items.length, g = b._getSublist().children("li").length, c, e = 0; e < f - g; e++) b._getSublist().append("<li>");
            a(">li", b._getSublist()).each(function (e) {
                var g = a(this),
                    f = a.wijmo.wijmenu._getMenuItemOptions(b.options, e);
                c = b._createItemWidget(g, f);
                d.push(c);
                b.options.items[e] = c.options
            });
            return d
        },
        _itemWidgetName: "wijmenuitem",
        _createItemWidget: function (c, d) {
            var b = this._itemWidgetName;
            a.fn[b] && c[b](d);
            return a.wijmo.wijmenu._getItemWidget(c)
        },
        _handleDisabledOption: function (b, c) {
            var a = this;
            if (b) {
                if (!a.disabledDiv) a.disabledDiv = a._createDisabledDiv(c);
                a.disabledDiv.appendTo(a.domObject.menucontainer)
            } else if (a.disabledDiv) {
                a.disabledDiv.remove();
                a.disabledDiv = null
            }
        },
        _getDisabled: function () {
            var b = this,
                a = b.options;
            return a.disabledState === true || a.disabled === true
        },
        _createDisabledDiv: function () {
            return a("<div></div>").addClass("ui-disabled").css({
                "z-index": "99999",
                position: "absolute",
                width: "100%",
                height: "100%",
                left: 0,
                top: 0
            })
        },
        _innerDestroy: function () {
            var a = this,
                b = a.options;
            a.destroying = true;
            a[b.mode === "flyout" ? "_killFlyout" : "_killDrilldown"]();
            a._killMenuItems();
            a._killtrigger();
            a._killElement();
            a.destroying = false
        },
        destroy: function () {
            var b = this;
            this._innerDestroy();
            if (b.disabledDiv) {
                b.disabledDiv.remove();
                b.disabledDiv = null
            }
            a.Widget.prototype.destroy.apply(this)
        },
        activate: function (i, e) {
            if (!e) return;
            var b = this,
                h = b.domObject.scrollcontainer,
                c, d, g = false,
                f = true;
            c = (e.jquery ? e : e.element).eq(0);
            if (b.activeItem && b.activeItem.element.get(0) === c.get(0)) return;
            b.deactivate(i);
            b.activeItem = a.wijmo.wijmenu._getItemWidget(c);
            d = c.children(":first");
            b._trigger("focus", i, {
                item: b.activeItem
            });
            if (b.options.mode === "sliding") {
                f = c.parent().is(".wijmo-wijmenu-current");
                g = f && b._hasScroll() && h.wijsuperpanel("needToScroll", c);
                if (g) {
                    b._linkContainer.link = d;
                    b._linkContainer.needToFocus = true;
                    h.wijsuperpanel("scrollChildIntoView", c)
                }
            }
            d.addClass("ui-state-focus").end();
            b.element.removeAttr("aria-activedescendant");
            b.element.attr("aria-activedescendant", c.attr("id"));
            f && !g && d.is("a") && d.focus()
        },
        deactivate: function () {
            var a = this,
                b = a.activeItem;
            if (!b) return;
            setTimeout(function () {
                b._getLink().removeClass("ui-state-focus").removeAttr("id");
                a._trigger("blur")
            }, 0);
            a.activeItem = null
        },
        next: function (a) {
            this._move("next", function (a) {
                return a._getFirstSelectableSubItem()
            }, a)
        },
        previous: function (a) {
            this._move("previous", function (a) {
                return a._getLastSelectableSubItem()
            }, a)
        },
        first: function () {
            var b = this,
                c, d, a;
            if (!b.activeItem) return false;
            c = b._getActiveItemElement();
            d = b.activeItem._getParentOrMenu();
            a = d._getFirstSelectableSubItem();
            return a && c[0] === a.element[0]
        },
        last: function () {
            var b = this,
                c, d, a;
            if (!b.activeItem) return false;
            c = b._getActiveItemElement();
            d = b.activeItem._getParentOrMenu();
            a = d._getLastSelectableSubItem();
            return a && c[0] === a.element[0]
        },
        nextPage: function (g) {
            var b = this,
                e = b._getActiveItemElement(),
                i, h, c, d, f;
            if (e) d = b.activeItem._getParentOrMenu();
            else {
                d = b;
                e = b._getFirstSelectableSubItem()
            }
            if (b.options.mode === "sliding" && b._hasScroll()) {
                if (!e || b.last()) {
                    b.activate(g, d._getFirstSelectableSubItem());
                    return
                }
                i = e.offset().top;
                h = b.options.maxHeight;
                c = a.wijmo.wijmenu._getSelectableSubItems(d, function (e) {
                    var b = a(e.element),
                        d = h - (b.offset().top - i + b.height()),
                        c = b.height();
                    return d < c && d > -c
                });
                if (!c.length) c = d._getLastSelectableSubItem();
                else c = c[c.length - 1];
                b.activate(g, c)
            } else {
                if (!e || b.last()) f = d._getFirstSelectableSubItem();
                else f = d._getLastSelectableSubItem();
                b.activate(g, f)
            }
        },
        previousPage: function (g) {
            var b = this,
                e = b._getActiveItemElement(),
                i, h, d, c, f;
            if (e) c = b.activeItem._getParentOrMenu();
            else {
                c = b;
                e = b._getFirstSelectableSubItem()
            }
            if (b.options.mode === "sliding" && b._hasScroll()) {
                if (!e || b.first()) {
                    b.activate(g, c._getLastSelectableSubItem());
                    return
                }
                i = e.offset().top;
                h = b.options.maxHeight;
                d = a.wijmo.wijmenu._getSelectableSubItems(c, function (e) {
                    var b = a(e.element),
                        d = b.offset().top - i + h - b.height(),
                        c = b.height();
                    return d < c && d > -c
                });
                if (!d.length) d = c._getFirstSelectableSubItem();
                else d = d[0];
                b.activate(g, d)
            } else {
                if (!e || b.first()) f = c._getLastSelectableSubItem();
                else f = c._getFirstSelectableSubItem();
                b.activate(g, f)
            }
        },
        select: function (d) {
            var b = this,
                a = b.activeItem,
                c;
            b._trigger("select", d, {
                item: a
            });
            if (b.options.checkable) {
                c = !a.options.selected;
                a._setOption("selected", c)
            }
        },
        _getActiveItemElement: function () {
            return this.activeItem ? this.activeItem.element : null
        },
        setItemDisabled: function (d, b) {
            var c = a(d, this.element);
            c.find(".wijmo-wijmenu-item>a").attr("disabled", b);
            c.find(">a").toggleClass("ui-state-disabled", b)
        },
        _setOption: function (b, c) {
            var a = this;
            if (a.destroying) return;
            a["_set_" + b] && a["_set_" + b](c);
            a.options[b] = c;
            b === "disabled" && a._handleDisabledOption(c, a.domObject.menucontainer)
        },
        _set_items: function (b) {
            var a = this;
            a._getSublist().children().remove();
            a.options.items = b;
            a.refresh()
        },
        _set_mode: function (b) {
            var a = this;
            a._innerDestroy();
            a.options.mode = b;
            a.refresh()
        },
        _set_backLink: function (d) {
            var b = this,
                c;
            this.options.backLink = d;
            if (b.options.mode === "sliding") {
                b._killDrilldown();
                b._drilldown();
                c = a(".wijmo-wijmenu-breadcrumb", b.domObject.menucontainer);
                b._resetDrilldownMenu(c)
            }
        },
        _set_direction: function () {
            var a = this;
            a._innerDestroy();
            a.refresh()
        },
        _set_orientation: function (e) {
            var b = this,
                d = b.domObject.menucontainer,
                i = b.options.direction,
                c = "ui-icon-triangle-1-",
                f = i === "rtl" ? "w" : "e",
                h = e === "horizontal" ? f : "s",
                g = e === "horizontal" ? "s" : f;
            d.removeClass(b.cssPre + "-vertical " + b.cssPre + "-horizontal");
            if (b.options.mode === "flyout") {
                d.addClass(b.cssPre + "-" + e);
                a.each(b.getItems(), function (b, a) {
                    if (a.getItems().length === 0) return;
                    a._getLink().find("." + c + h).removeClass(c + h + " " + c + g).addClass(c + g)
                })
            } else d.addClass(b.cssPre + "-vertical")
        },
        _getTriggerEle: function () {
            return a.wijmo.wijmenu._getOuterElement(this.options.trigger, ".wijmo-wijmenu")
        },
        _set_triggerEvent: function (d) {
            var a = this,
                c = a.options,
                b = a._getTriggerEle();
            a._killtrigger();
            c.triggerEvent = d;
            b.length > 0 && a._initTrigger(b);
            if (c.mode === "flyout") {
                a._killFlyout();
                a._flyout()
            }
        },
        _set_trigger: function (d) {
            var a = this,
                c = a.options,
                b;
            a._killtrigger();
            c.trigger = d;
            b = a._getTriggerEle();
            b.length > 0 && a._initTrigger(b);
            if (c.mode === "flyout") {
                a._killFlyout();
                a._flyout()
            }
        },
        _initTrigger: function (b) {
            var f = this.options,
                e = f.triggerEvent,
                c = this,
                g = c.domObject.menucontainer,
                d = ".wijmenuEvent";
            if (b.is("iframe")) b = a(b.get(0).contentWindow.document);
            switch (e) {
                case "click":
                    b.bind(e + d, function (a) {
                        f.mode !== "popup" && c._displayMenu(a);
                        a.stopPropagation()
                    });
                    break;
                case "mouseenter":
                    b.bind(e + d, function (a) {
                        c._displayMenu(a);
                        a.stopPropagation()
                    });
                    break;
                case "dblclick":
                    b.bind(e + d, function (a) {
                        c._displayMenu(a);
                        a.stopPropagation()
                    });
                    break;
                case "rtclick":
                    b.bind("contextmenu" + d, function (a) {
                        g.hide();
                        c._displayMenu(a);
                        a.preventDefault();
                        a.stopPropagation()
                    })
            }
        },
        _killtrigger: function () {
            var c = this.options,
                b;
            if (c.trigger !== "") {
                b = a(c.trigger);
                if (b.is("iframe")) b = a(b.get(0).contentWindow.document);
                b && b.length > 0 && b.unbind(".wijmenuEvent").unbind("wijmenuEvent")
            }
        },
        _move: function (i, g, e) {
            var b = this,
                c = b._getActiveItemElement(),
                f, h, d;
            if (!c || !c.length) {
                b.activate(e, g(b));
                return
            }
            d = a.wijmo.wijmenu._getItemWidget(c);
            f = d[i]();
            h = d._getParentOrMenu();
            if (f) b.activate(e, f);
            else b.activate(e, g(h))
        },
        refresh: function () {
            var b = this,
                d = b.element,
                h = "wijmo-wijmenu",
                c = b.options,
                k = c.direction,
                f, e, j, g, i;
            b.domObject && b._innerDestroy();
            if (d.is("ul")) {
                b._rootMenu = d;
                f = d.wrap("<div></div>").parent();
                e = f.wrap("<div></div>").parent()
            } else if (d.is("div")) {
                b._rootMenu = a("ul:first", d);
                f = d;
                e = d.wrap("<div></div>").parent()
            } else return;
            k === "rtl" && b._rootMenu.addClass(h + "-rtl");
            f.addClass("scrollcontainer checkablesupport");
            e.addClass("ui-widget ui-widget-header " + h + " ui-corner-all ui-helper-clearfix").attr("aria-activedescendant", "ui-active-menuitem");
            c.orientation === "horizontal" && c.mode === "flyout" && e.addClass(h + "-" + c.orientation);
            j = {
                scrollcontainer: f,
                menucontainer: e
            };
            b.domObject = j;
            b._getSublist().data("topmenu", true);
            !b._getSublist().hasClass(h + "-list ui-helper-reset") && b._getSublist().addClass(h + "-list ui-helper-reset");
            b._items = b._createMenuItems();
            d.show();
            d.delegate("li>.wijmo-wijmenu-link", "mouseenter.wijmenuEvent", function () {
                var c = a(this).hasClass("ui-state-disabled");
                if (b._getDisabled() || c) return;
                a(this).addClass("ui-state-hover")
            }).delegate("li>.wijmo-wijmenu-link", "mouseleave.wijmenuEvent", function () {
                var c = a(this).hasClass("ui-state-disabled");
                if (b._getDisabled() || c) return;
                a(this).removeClass("ui-state-hover");
                a(this).data("subMenuOpened") && a(this).addClass("ui-state-active")
            });
            this[c.mode === "flyout" ? "_flyout" : "_drilldown"]();
            if (c.trigger !== "") {
                g = b._getTriggerEle();
                if (g.length > 0) {
                    e.hide();
                    b._initTrigger(g)
                }
            }
            a(document).bind(b.clickNameSpace, function (d) {
                if (a(d.target).parent().is(".wijmo-wijmenu-all-lists")) return;
                if (a(d.target).closest(c.trigger).is(c.trigger)) return;
                var f = a(d.target).closest(".wijmo-wijmenu");
                if (f.length === 0) {
                    if (c.mode === "sliding") {
                        i = a(".wijmo-wijmenu-breadcrumb", e);
                        if (c.trigger === "") return;
                        b._resetDrilldownMenu(i)
                    } else if (c.mode === "flyout" && c.triggerEvent !== "mouseenter") {
                        b._hideAllMenus(d);
                        return
                    }
                    g && g.length > 0 && b._hideMenu(d)
                }
            })
        },
        _flyout: function () {
            var b = this,
                c = b.domObject.menucontainer,
                d = b.options;
            c.attr("role", "menu");
            d.orientation === "horizontal" && c.attr("role", "menubar");
            a.each(b.getItems(), function () {
                this._flyout()
            })
        },
        _hideAllMenus: function (f) {
            var b = this,
                e, d, c = function (b) {
                    if (b.getItems().length > 0) {
                        a.each(b.getItems(), function (b, a) {
                            c(a)
                        });
                        b._hideSubmenu(false, f)
                    }
                };
            a.each(b._items, function (b, a) {
                c(a)
            });
            if (b.options.trigger !== "") {
                e = b.domObject.menucontainer;
                if (e.data("isAnimated")) return;
                d = b._getTriggerEle();
                if (d.length === 0) return;
                b._hideMenu(f)
            }
        },
        hideAllMenus: function (a) {
            this._hideAllMenus(a)
        },
        _killFlyout: function () {
            a.each(this.getItems(), function () {
                this._killFlyout()
            })
        },
        _killElement: function () {
            var b = this,
                c = b._getSublist();
            c.removeClass("wijmo-wijmenu-list ui-helper-reset wijmo-wijmenu-content ui-helper-clearfix");
            a(document).unbind(b.clickNameSpace);
            if (b.element.is("ul")) b.element.unwrap().unwrap();
            else b.element.unwrap();
            b.domObject = null;
            b.element.removeData("topmenu").removeData("firstLeftValue").removeData("domObject");
            c.undelegate(".wijmenuEvent")
        },
        _killMenuItems: function () {
            for (var c = this, b = c.getItems(), a = b.length - 1; a >= 0; a--) b[a].destroy(true);
            c._items.length = 0
        },
        _sroll: function () {
            var a = this.domObject.scrollcontainer,
                b = this.options.superPanelOptions || {};
            a.height(this.options.maxHeight);
            a.wijsuperpanel(b)
        },
        _initScrollCallback: function () {
            var a = this,
                b = a.domObject.scrollcontainer;
            a._linkContainer = {
                link: null,
                needToFocus: false
            };
            b.wijsuperpanel({
                scrolled: function () {
                    var b = a._linkContainer.link;
                    if (a._linkContainer.needToFocus && b && b.is("a")) {
                        b.focus();
                        a._linkContainer.needToFocus = false
                    }
                }
            })
        },
        _resetScroll: function (f) {
            var c = this,
                d = c._rootMenu.parent(),
                e = 5,
                a = c.domObject.scrollcontainer,
                b = f._getSublist();
            d.height(b.height());
            a.wijsuperpanel("option", "hScroller", {
                scrollValue: 0
            });
            a.wijsuperpanel("option", "vScroller", {
                scrollValue: 0
            });
            a.wijsuperpanel("paintPanel");
            if (c._hasScroll()) {
                if (b.prev().length > 0) e = b.prev().css("padding-left").replace(/px/g, "");
                b.width(a.find(".wijmo-wijsuperpanel-contentwrapper:first").width() - e);
                d.height(b.height());
                a.wijsuperpanel("paintPanel")
            }
        },
        _hasScroll: function () {
            var a = this.domObject.scrollcontainer;
            return a.data("wijsuperpanel").vNeedScrollBar
        },
        _resetDrillChildMenu: function (a) {
            a.removeClass("wijmo-wijmenu-scroll wijmo-wijmenu-current").height("auto")
        },
        _resetDrilldownMenu: function (i, e) {
            var b = this,
                g = b.options,
                f = b._getSublist(),
                c = b.domObject.menucontainer,
                h = a('<li class="wijmo-wijmenu-breadcrumb-text">' + g.crumbDefaultText + "</li>"),
                d = function (c) {
                    a.each(c, function (f, e) {
                        var c = e._getSublist(),
                            a = e.getItems();
                        c.hide();
                        b._resetDrillChildMenu(c);
                        a.length > 0 && d(a)
                    })
                };
            a(".wijmo-wijmenu-current", c).removeClass("wijmo-wijmenu-current");
            f.animate({
                left: 0
            }, g.showDuration, function () {
                d(b.getItems());
                f.addClass("wijmo-wijmenu-current");
                e && e()
            });
            a(".wijmo-wijmenu-all-lists", c).find("span").remove();
            i.empty().append(h);
            a(".wijmo-wijmenu-footer", c).empty().hide();
            b._resetScroll(b)
        },
        _drilldown: function () {
            var b = this,
                c = b._getSublist(),
                e = b.domObject.menucontainer.attr("role", "menu"),
                g, d = b.options,
                h = d.direction,
                f = a('<ul class="wijmo-wijmenu-breadcrumb ui-state-default ui-corner-all ui-helper-clearfix"></ul>'),
                k = a('<li class="wijmo-wijmenu-breadcrumb-text">' + d.crumbDefaultText + "</li>"),
                n = d.backLink ? d.backLinkText : d.topLinkText,
                l = d.backLink ? "wijmo-wijmenu-prev-list" : "wijmo-wijmenu-all-lists",
                j = d.backLink ? "ui-state-default ui-corner-all" : "",
                m = d.backLink ? '<span class="ui-icon ui-icon-triangle-1-w"></span>' : "",
                i = a('<li class="' + l + '"><a href="#" class="' + j + '">' + m + n + "</a></li>");
            c.wrap("<div>").parent().css("position", "relative");
            e.addClass("wijmo-wijmenu-ipod wijmo-wijmenu-container");
            if (d.backLink) f.addClass("wijmo-wijmenu-footer").appendTo(e).hide();
            else f.addClass("wijmo-wijmenu-header").prependTo(e);
            !d.backLink && f.append(k);
            g = e.width();
            c.addClass("wijmo-wijmenu-content wijmo-wijmenu-current ui-widget-content ui-helper-clearfix").css({
                width: g
            });
            a.each(b.getItems(), function (b, a) {
                a._setDrilldownUlStyle()
            });
            b._sroll();
            b._initScrollCallback();
            b._resetScroll(b);
            b.element.data("firstLeftValue", parseFloat(c.css("left")));
            c.delegate("li>.wijmo-wijmenu-link", "click", function (m, v) {
                var u = a(this).parent(),
                    w = u.attr("disabled"),
                    q, r, l, t, p, n, k, o, s, j = a.wijmo.wijmenu._getItemWidget(u);
                if (b._getDisabled() || w) return;
                c.stop(true, true);
                s = a.wijmo.wijmenu._hasVisibleSubMenus(j);
                if (!s) {
                    b._leafNodeClick(m, j, f);
                    return
                }
                q = j._getSublist();
                if (q.hasClass("wijmo-wijmenu-current")) return;
                r = j._getParentOrMenu()._getSublist();
                l = r.data("topmenu") ? 0 : parseFloat(c.css("left"));
                if (h === "rtl") n = Math.round(l + parseFloat(e.width()));
                else n = Math.round(l - parseFloat(e.width()));
                k = a(".wijmo-wijmenu-footer", e);
                o = function (h, f) {
                    var i = h,
                        c = a(".wijmo-wijmenu-current", e),
                        d, g;
                    if (c.get(0) === b._getSublist().get(0)) return;
                    if (f) {
                        d = f._getSublist();
                        g = f
                    } else {
                        d = c.parents("ul:eq(0)");
                        g = a.wijmo.wijmenu._getItemWidget(c.parent())._getParentOrMenu()
                    }
                    c.hide().attr("aria-expanded", "false");
                    b._resetDrillChildMenu(c);
                    b._resetScroll(g);
                    d.addClass("wijmo-wijmenu-current").attr("aria-expanded", "true");
                    if (d.hasClass("wijmo-wijmenu-content")) {
                        i.remove();
                        k.hide()
                    }
                };
                b._resetDrillChildMenu(r);
                b._resetScroll(j);
                b._slidingAnimation(c, n, function () {
                    b.activate(m, v || j);
                    b.select(m)
                });
                q.show().addClass("wijmo-wijmenu-current").attr("aria-expanded", "true");
                if (d.backLink) {
                    if (k.find("a").size() === 0) {
                        k.show();
                        b._backLink = a('<a href="#"><span class="ui-icon ui-icon-triangle-1-w"></span> <span>' + d.backLinkText + "</span></a>").appendTo(k).click(function (i, f) {
                            if (b._getDisabled()) return;
                            var g = a(this),
                                d;
                            c.stop(true, true);
                            if (h === "rtl") d = Math.round(c.css("left").replace("px", "")) - Math.round(e.width());
                            else {
                                d = Math.round(c.css("left").replace("px", "")) + Math.round(e.width());
                                if (d > l) return
                            }
                            b._slidingAnimation(c, d, function () {
                                o(g);
                                f && f()
                            });
                            i.preventDefault()
                        })
                    }
                } else {
                    if (f.find("li").size() === 1) {
                        f.empty().append(i);
                        i.find("a").click(function (c, a) {
                            b._resetDrilldownMenu(f, a);
                            c.preventDefault()
                        })
                    }
                    a(".wijmo-wijmenu-current-crumb", e).removeClass("wijmo-wijmenu-current-crumb");
                    t = j._getLink().text();
                    p = a('<li class="wijmo-wijmenu-current-crumb"><a href="#" class="wijmo-wijmenu-crumb">' + t + "</a></li>");
                    p.appendTo(f).find("a").click(function (i, f) {
                        if (b._getDisabled()) return;
                        var d = a(this).parent(),
                            e;
                        if (!d.is(".wijmo-wijmenu-current-crumb")) {
                            if (h === "rtl") e = +d.prevAll().length * g;
                            else e = -d.prevAll().length * g;
                            b._slidingAnimation(c, e, function () {
                                o(null, j);
                                f && f()
                            });
                            d.addClass("wijmo-wijmenu-current-crumb").find("span").remove();
                            d.nextAll().remove();
                            i.preventDefault()
                        }
                    });
                    p.prev().append(' <span class="ui-icon ui-icon-carat-1-e"></span>')
                }
                a(this).attr("href") === "#" && m.preventDefault()
            })
        },
        _leafNodeClick: function (b, c, e) {
            var a = this,
                f = a.options,
                d;
            a.activate(b, c);
            a.select(b);
            if (f.trigger) {
                d = a._getTriggerEle();
                if (d.length) {
                    a._hideMenu(b);
                    a._resetDrilldownMenu(e)
                }
            }
            c._getLink().attr("href") === "#" && b.preventDefault()
        },
        _slidingAnimation: function (d, c, b) {
            var a = this.options.slidingAnimation;
            if (a && !a.disabled) d.stop(true, true).animate({
                left: c
            }, a.duration, a.easing, b);
            else {
                d.css("left", c);
                b.call(this)
            }
        },
        _killDrilldown: function () {
            var c = this._getSublist(),
                b = this.domObject,
                d = {
                    width: "",
                    height: ""
                };
            c.css(d).removeClass("ui-widget-content");
            if (b.scrollcontainer && b.scrollcontainer.parent().length > 0) {
                b.scrollcontainer.css(d);
                b.scrollcontainer.wijsuperpanel("destroy");
                b.scrollcontainer.removeClass("wijmo-wijsuperpanel").append(c)
            }
            c.prevAll().remove();
            b.menucontainer.removeClass("wijmo-wijmenu-ipod wijmo-wijmenu-container");
            a(".wijmo-wijmenu-current", b.menucontainer).removeClass("wijmo-wijmenu-current");
            a(".wijmo-wijmenu-breadcrumb", b.menucontainer).remove();
            c.undelegate("li>.wijmo-wijmenu-link", "click");
            a("ul", c).css({
                left: "",
                width: ""
            });
            c.css("left", "");
            b.scrollcontainer = b.menucontainer.children(":first")
        },
        _displayMenu: function (e) {
            var b = this,
                d = b.options,
                f, h, g, c = b.domObject.menucontainer,
                j = a(e.target),
                i = !a.wijmo.wijmenu._hasVisibleSubMenus(b);
            if (c.is(":visible") || i) return;
            if (!b._trigger("showing", e, b)) return;
            c.show();
            b._setPosition(j);
            b.nowIndex++;
            b._setZindex(c, b.nowIndex);
            c.hide();
            f = {
                context: c,
                show: true
            };
            h = d.direction === "rtl" ? "right" : "left";
            g = a.extend({}, {
                option: {
                    direction: h
                }
            }, d.animation, d.showAnimation);
            a.wijmo.wijmenu._animateFlyoutMenu(g, f, function () {
                b._trigger("shown", e, b)
            });
            b._isClickToOpen = d.triggerEvent === "click";
            this.element.data("shown", true)
        },
        _hideMenu: function (d) {
            var b = this,
                g = b.options,
                c = this.domObject.menucontainer,
                h = a.wijmo.wijmenu.animations,
                e, f;
            if (!this.element.data("shown")) return;
            if (!b._trigger("hidding", d, b)) return;
            this.element.data("shown", false);
            if (a.fn.wijhide) {
                e = {
                    context: c,
                    show: false
                };
                f = a.extend({}, g.animation, g.hideAnimation);
                c.wijhide(f, h, e, null, function () {
                    b._setZindex(c);
                    c.attr("aria-hidden", true);
                    b._trigger("hidden", d, b)
                })
            } else {
                c.hide().attr("aria-hidden", true);
                b._setZindex(c);
                b._trigger("hidden", d, b)
            }
        },
        _setZindex: function (c, d) {
            var e = this.domObject,
                b;
            if (!e) return;
            b = e.menucontainer;
            if (c.get(0) === b.get(0)) {
                if (d) b.css("z-index", d);
                else b.css("z-index", "");
                return
            }
            if (d) {
                c.parent().css("z-index", 999);
                c.css("z-index", d);
                a.browser.msie && a.browser.version < 8 && b.css("z-index") === 0 && b.css("z-index", 9950)
            } else {
                c.css("z-index", "");
                c.parent().css("z-index", "");
                a.browser.msie && a.browser.version < 8 && a("ul:visible", this._getSublist()).length === 0 && b.css("z-index") === 9950 && b.css("z-index", "")
            }
        },
        _setPosition: function (c) {
            var d = this._getPosition(),
                e = {
                    of: c
                }, b = this.domObject.menucontainer;
            b.css({
                left: "0",
                top: "0",
                position: "absolute"
            });
            b.position(a.extend(e, d))
        },
        _getPosition: function () {
            var c = this.options,
                d = c.direction,
                b = d === "rtl" ? {
                    my: "right top",
                    at: "right bottom"
                } : {
                    my: "left top",
                    at: "left bottom"
                };
            b = a.extend(b, c.position);
            return b
        },
        _getFirstSelectableSubItem: function () {
            return a.wijmo.wijmenu._getFirstSelectableSubItem(this)
        },
        _getLastSelectableSubItem: function () {
            return a.wijmo.wijmenu._getLastSelectableSubItem(this)
        },
        add: function (b, c) {
            a.wijmo.wijmenu._add(this, b, c)
        },
        _getSublist: function () {
            return this._rootMenu
        },
        getItems: function () {
            return this._items
        },
        remove: function (b) {
            a.wijmo.wijmenu._remove(this, b)
        },
        _newId: function () {
            for (var c = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"], a = "", b = 0; b < 16; b++) a += c[Math.round(Math.random() * 25)];
            return a
        }
    });
    a.widget("wijmo.wijmenuitem", {
        options: {
            header: false,
            separator: false,
            value: "",
            text: "",
            navigateUrl: "",
            target: "",
            iconClass: "",
            imagePosition: "",
            displayVisible: true,
            selected: false,
            items: null
        },
        _initState: function () {
            this._items = [];
            this._resetMarkupValue();
            if (!this.options.items) this.options.items = []
        },
        _create: function () {
            var b = this;
            b.element.data("wijmomenuitem", b.widgetName);
            b._initState();
            b._getOrSetOptionsValues();
            b._createChildMenuItems();
            b._initCssClass();
            a.Widget.prototype._create.apply(b, arguments)
        },
        _refresh: function () {
            var a = this,
                b = a.options;
            a._set_navigateUrl(b.navigateUrl);
            a._set_target(b.target);
            a._set_displayVisible(b.displayVisible);
            a._createChildMenuItems();
            a._initCssClass()
        },
        _setOption: function (c, e) {
            var b = this,
                f = b.options,
                d;
            if (c === "items") {
                a.Widget.prototype._setOption.apply(b, arguments);
                b._set_items(e);
                return
            }
            if (e === f[c]) return;
            a.Widget.prototype._setOption.apply(b, arguments);
            if (!a.isFunction(b["_set_" + c])) return;
            b["_set_" + c](e, true);
            switch (c) {
                case "header":
                case "separator":
                    b._refresh();
                    break;
                case "displayVisible":
                    d = b.getParent();
                    d && d._setSubmenuIcon()
            }
        },
        index: function () {
            return this.element.index()
        },
        _set_selected: function (c) {
            var a = this,
                b = a._getMenuItemType();
            if (b === a._markupType.link) a._getLink().toggleClass("ui-state-active", c);
            else a.options.selected = false
        },
        _set_items: function (b) {
            var a = this;
            a._getSublist().remove();
            a._items = [];
            if (b.length > 0) {
                a._createChildMenuItems();
                a._initUlCssClass()
            }
            a._setSubmenuIcon(b.length > 0);
            a._bindModeEvents(a, true);
            a._resetMarkupValue()
        },
        _bindModeEvents: function (b, c) {
            var a = this,
                d = b._getMenu(),
                e = d.options;
            if (c) {
                a._initUlCssClass();
                a._setSubmenuIcon();
                a._resetMarkupValue()
            }
            if (e.mode === "flyout") if (c) {
                a._killFlyout();
                a._flyout()
            } else b._flyout();
            else {
                a._setDrilldownUlStyle();
                b.element.parent().is(":visible") && d._resetScroll(b._getParentOrMenu())
            }
        },
        _set_value: function (a) {
            this.options.value = a
        },
        _set_text: function (b, c) {
            var a = this,
                d = a.options;
            if (b || c) a._setText(b);
            else d.text = a._getText()
        },
        _set_navigateUrl: function (b, d) {
            var c = this,
                e = c.options,
                a = c._getLink();
            if (a.is("a")) if (b || d) a.attr("href", b);
            else e.navigateUrl = a.attr("href")
        },
        _set_target: function (e, d) {
            var b = this,
                c = b.options,
                a = b._getLink();
            if (a.is("a")) if (c.target || d) a.attr("target", e);
            else c.target = a.attr("target") || ""
        },
        _set_iconClass: function (g, i) {
            var e = this,
                f = e.options,
                d, b, c, h;
            if (f.header === true || f.separator === true) return;
            d = e._getLink();
            b = d.find("span.wijmenuitem-icon");
            if (g) {
                if (b.length === 0) {
                    b = a("<span>");
                    c = d.children(".wijmo-wijmenu-text").wrap("<span>").parent();
                    c.addClass("wijmo-wijmenu-text");
                    c.prepend(b)
                }
                b.attr("class", g + " wijmo-wijmenu-icon-left wijmenuitem-icon");
                i && e._set_imagePosition(f.imagePosition)
            } else if (b.length !== 0) {
                b.remove();
                c = d.children(".wijmo-wijmenu-text");
                h = c.text();
                c.html("");
                c.text(h)
            }
            e._getMenuItemType() === e._markupType.other && d.addClass("wijmo-wijmenu-link ui-corner-all")
        },
        _set_imagePosition: function (c) {
            var e = this,
                d = e._getLink(),
                a = d.find(">span>span.wijmenuitem-icon"),
                b = c === "right" ? "right" : "left";
            if (a.length === 0) return;
            a.removeClass("wijmo-wijmenu-icon-right").removeClass("wijmo-wijmenu-icon-left").addClass("wijmo-wijmenu-icon-" + b)
        },
        _set_separator: function (d, i) {
            var a = this,
                e = a.element,
                c = a.options,
                j = a._getLink(),
                f = "wijmo-wijmenu",
                g = f + "-separator ui-state-default ui-corner-all",
                h = "ui-widget " + b + " ui-state-default ui-corner-all";
            if (i && d === false) {
                e.html("").removeClass(g).removeClass(h);
                a._createMenuItemMarkup(a._markupType.link).appendTo(e)
            } else if (d === true || j.length === 0) {
                c.separator = true;
                c.header = false;
                a._createMenuItemMarkup(a._markupType.separator)
            } else c.separator = false;
            a._resetMarkupValue()
        },
        _set_header: function (f, i) {
            var a = this,
                e = a.element,
                d = a.options,
                c = a._getLink(),
                h = "ui-widget-header ui-corner-all",
                g = "ui-widget " + b + " ui-state-default ui-corner-all";
            if (i && f === false) {
                d.header = false;
                e.html("").removeClass(h).removeClass(g);
                a._createMenuItemMarkup(a._markupType.link).appendTo(e)
            } else if (f === true || c.is("h1,h2,h3,h4,h5")) {
                d.header = true;
                d.separator = false;
                if (!c.is("h1,h2,h3,h4,h5")) {
                    c.remove();
                    c = a._createMenuItemMarkup(a._markupType.header);
                    e.append(c)
                }
            } else d.header = false;
            a._resetMarkupValue()
        },
        _set_displayVisible: function (b) {
            var c = this,
                a = c.element;
            if (b) a.show();
            else a.hide()
        },
        _markupType: {
            link: 0,
            separator: 1,
            header: 2,
            other: 3
        },
        _createMenuItemMarkup: function (d) {
            var b = this,
                e = b.options,
                f = b.element,
                c;
            if (d === b._markupType.separator) {
                f.html("");
                return null
            } else if (d === b._markupType.header) c = a("<h3></h3>").text(e.text);
            else c = a("<a>").text(e.text);
            return c
        },
        _getMenuItemType: function (e) {
            var b = this,
                c = b.options,
                d = b._getLink();
            if (e) c = a.extend({}, c, e);
            return c.separator === true ? b._markupType.separator : c.header === true ? b._markupType.header : d.length === 0 ? c.text ? b._markupType.link : b._markupType.separator : d.is("a") ? b._markupType.link : d.is("h1,h2,h3,h4,h5") ? b._markupType.header : b._markupType.other
        },
        _getOrSetOptionsValues: function () {
            var a = this,
                e = a.element,
                b = a.options,
                c = a._getLink(),
                d = a._getMenuItemType();
            if (d === a._markupType.header) {
                a._set_header(b.header);
                a._set_text(b.text)
            } else if (d === a._markupType.separator) a._set_separator(b.separator);
            else {
                if (c.length === 0) {
                    c = a._createMenuItemMarkup(d);
                    e.append(c)
                } else a._set_text(b.text);
                a._resetMarkupValue();
                a._set_navigateUrl(b.navigateUrl);
                a._set_target(b.target)
            }
            a._set_displayVisible(b.displayVisible);
            a._set_selected(b.selected)
        },
        _getText: function () {
            return this._getLink().text()
        },
        _setText: function (b) {
            var c = this.element,
                a;
            a = c.find(":not(ul)a .wijmo-wijmenu-text:first");
            if (a.length !== 0) {
                a.text(b);
                return
            }
            a = c.children("h1,h2,h3,h4,h5").filter(":first");
            if (a.length !== 0) {
                a.text(b);
                return
            }
            a = c.children("a:first");
            if (a.length !== 0) {
                a.text(b);
                return
            }
        },
        _createChildMenuItems: function () {
            var b = this,
                j = b.element,
                i = b._items,
                g = b.options,
                d, c, e, f, h;
            if (g.header === true || g.separator === true) return;
            d = g.items.length;
            c = b._getSublist();
            e = c.children("li").length;
            if (d > e) {
                if (c.length === 0) {
                    c = a("<ul>").appendTo(j);
                    b._resetMarkupValue()
                }
                for (f = 0; f < d - e; f++) c.append("<li>")
            }
            a.each(b._getChildren(), function (d, e) {
                var f = a(e),
                    c;
                c = a.wijmo.wijmenu._getMenuItemOptions(b.options, d);
                h = b._createItemWidget(f, c);
                i.push(h);
                b.options.items[d] = h.options
            })
        },
        _createItemWidget: function (b, d) {
            var a = this,
                c = a.widgetName;
            b[c](d);
            return b.data(a.widgetName)
        },
        _initCssClass: function () {
            var a = this,
                c = this.element,
                h = a.options,
                g = a._getLink(),
                e = "wijmo-wijmenu",
                i = e + "-separator ui-state-default ui-corner-all",
                k = "ui-widget-header ui-corner-all",
                f = "ui-widget " + b + " ui-state-default ui-corner-all",
                j = e + "-link ui-corner-all",
                d = a._getMenuItemType();
            d !== a._markupType.separator && c.attr("role", "menuitem");
            if (d === a._markupType.separator) c.addClass(i);
            else if (d === a._markupType.header) c.addClass(k);
            else {
                if (d === a._markupType.link) {
                    if (!c.hasClass(b)) {
                        c.addClass(f);
                        g.addClass(j);
                        g.wrapInner("<span>").children("span").addClass(e + "-text")
                    }
                } else c.addClass(f);
                a._setSubmenuIcon()
            }
            a._set_iconClass(h.iconClass);
            a._set_imagePosition(h.imagePosition);
            a._initUlCssClass()
        },
        _initUlCssClass: function () {
            var a = "wijmo-wijmenu";
            this._getSublist().addClass(a + "-list ui-widget-content ui-corner-all ui-helper-clearfix " + a + "-child ui-helper-reset").hide()
        },
        _setSubmenuIcon: function (e) {
            var d = this,
                c = d._getLink(),
                g = d._getMenu(),
                f = g.options.direction,
                b = f === "rtl" ? c.children("span.ui-icon:first") : c.children("span.ui-icon:last");
            if (e === undefined) e = a.wijmo.wijmenu._hasVisibleSubMenus(d);
            if (e && !c.is(":input")) {
                if (b.length === 0) if (f === "rtl") b = a("<span>").prependTo(c);
                else b = a("<span>").appendTo(c);
                if (d._isRoot() && g.options.orientation === "horizontal" && g.options.mode === "flyout") b.attr("class", "ui-icon ui-icon-triangle-1-s");
                else if (f === "rtl") b.attr("class", "ui-icon ui-icon-triangle-1-w");
                else b.attr("class", "ui-icon ui-icon-triangle-1-e")
            } else b.remove()
        },
        _killFlyout: function () {
            var b = this.element.attr("role", "");
            b.removeClass("wijmo-wijmenu-parent").unbind(".wijmenuEvent").unbind(".wijmenuitem").children(":first").unbind(".wijmenuEvent").unbind(".wijmenuitem").attr("aria-haspopup", "");
            this._getSublist().unbind(".wijmenuEvent").unbind(".wijmenuitem");
            a.each(this.getItems(), function () {
                this._killFlyout()
            })
        },
        _getItemTriggerEvent: function () {
            var d = this,
                e = d.element,
                f = d._getMenu(),
                b = f.options,
                c = "default";
            if (b.trigger !== "") if (e.is(b.trigger) || f.element.is(b.trigger)) c = b.triggerEvent;
            else {
                e.parents(".wijmo-wijmenu-parent").each(function (e, d) {
                    if (a(d).is(b.trigger)) {
                        c = b.triggerEvent;
                        return false
                    }
                });
                if (c === "default" && d._isOuterTirggerEle()) c = b.triggerEvent
            }
            e.data("triggerEvent", c);
            return c
        },
        _isOuterTirggerEle: function () {
            var b = this._getMenu();
            return a.wijmo.wijmenu._getOuterElement(b.options.trigger, ".wijmo-wijmenu").length > 0
        },
        _flyout: function () {
            var b = this,
                e = b._getMenu(),
                n = "wijmo-wijmenu-link",
                k = "wijmo-wijmenu-parent",
                c = e.options,
                f = ".wijmenuitem",
                j = a(b.element).attr("aria-haspopup", true),
                l, i, m = b._getItemTriggerEvent(),
                d = j.children("a." + n),
                g = b._getSublist(),
                h;
            if (b.getItems().length > 0) {
                g.bind("mouseleave" + f, function (a) {
                    if (c.disabled) return;
                    i = setTimeout(function () {
                        b._hideCurrentSubmenu(a)
                    }, c.hideDelay)
                });
                j.removeClass(k).addClass(k);
                if (m !== "default" && c.triggerEvent !== "mouseenter") {
                    switch (c.triggerEvent) {
                        case "click":
                            d.bind("click" + f, function (d) {
                                if (c.disabled || a(this).hasClass("ui-state-disabled")) return;
                                b._showFlyoutSubmenu(d)
                            });
                            break;
                        case "dblclick":
                            d.bind("dblclick" + f, function (d) {
                                if (c.disabled || a(this).hasClass("ui-state-disabled")) return;
                                b._showFlyoutSubmenu(d)
                            });
                            break;
                        case "rtclick":
                            d.bind("contextmenu" + f, function (d) {
                                if (c.disabled || a(this).hasClass("ui-state-disabled")) return;
                                b._showFlyoutSubmenu(d);
                                d.preventDefault()
                            })
                    }
                    g.data("notClose", true)
                } else {
                    d.bind("mouseenter.wijmenuEvent", function (d) {
                        if (c.disabled || a(this).hasClass("ui-state-disabled")) return;
                        clearTimeout(i);
                        l = setTimeout(function () {
                            b._displaySubmenu(d)
                        }, c.showDelay)
                    }).bind("mouseleave" + f, function (d) {
                        if (c.disabled || a(this).hasClass("ui-state-disabled")) return;
                        clearTimeout(l);
                        if (!g.is("ul")) g = g.children("ul:first");
                        i = setTimeout(function () {
                            b._hideSubmenu(false, d)
                        }, c.hideDelay)
                    });
                    b.getItems().length > 0 && b._getSublist().bind("mouseenter" + f, function () {
                        if (c.disabled) return;
                        clearTimeout(i)
                    })
                }
            }
            d.bind("click.wijmenuEvent", function (a) {
                h = d.hasClass("ui-state-disabled");
                if (c.disabled || h) return;
                if (d.is("a")) {
                    if (b._getSublist().length === 0) e._hideAllMenus(a);
                    else if (!(c.trigger !== "" && j.data("triggerEvent") !== "default" && c.triggerEvent !== "mouseenter")) e._hideAllMenus(a);
                    else {
                        var g = e._currentMenuList,
                            i, f;
                        if (g !== undefined) {
                            i = j;
                            if (b._getSublist().length === 0) for (f = g.length; f > 0; f--) if (g[f - 1] === b) break;
                            else g[f - 1]._hideSubmenu(false, a)
                        }
                    }
                    e.activate(a, b)
                }
                e.select(a);
                d.attr("href") === "#" && a.preventDefault()
            }).bind("focusin.wijmenuEvent", function (a) {
                h = d.hasClass("ui-state-disabled");
                if (c.disabled || h) return;
                d.is("a") && e.activate(a, b)
            });
            a.each(b.getItems(), function () {
                this._flyout()
            })
        },
        _hideSubmenu: function (k, g) {
            var c = this,
                b = c._getMenu(),
                j = b.options,
                l = a.wijmo.wijmenu.animations,
                h, i, e, d = c._getSublist(),
                f = c._getLink();
            if (!f.data("subMenuOpened")) return;
            if (!b._trigger("hidding", g, c)) return;
            if (f.is(".wijmo-wijmenu-link")) {
                f.data("subMenuOpened", false);
                f.removeClass("ui-state-active")
            }
            if (a.fn.wijhide && k !== true) {
                h = {
                    context: d,
                    show: false
                };
                i = a.extend({}, j.animation, j.hideAnimation);
                d.wijhide(i, l, h, null, function () {
                    b._setZindex(d);
                    d.attr("aria-hidden", true);
                    b._trigger("hidden", g, c)
                })
            } else {
                d.hide().attr("aria-hidden", true);
                b._setZindex(d);
                b._trigger("hidden", g, c)
            }
            e = b._currentMenuList;
            if (e) {
                e = a.map(e, function (a) {
                    return a && a === c ? null : a
                });
                b._currentMenuList = a.makeArray(e)
            }
        },
        _displaySubmenu: function (g, k) {
            var c = this,
                b = c._getMenu(),
                e = b.options,
                i, f, j, h, l = c._getLink(),
                d = c._getSublist();
            h = !a.wijmo.wijmenu._hasVisibleSubMenus(c);
            if (d.is(":visible") || h) return;
            if (!b._trigger("showing", g, c)) return;
            l.is("a.wijmo-wijmenu-link") && l.data("subMenuOpened", true);
            d.show();
            this._setMenuItemPosition();
            b.nowIndex++;
            b._setZindex(d, b.nowIndex);
            d.hide();
            i = {
                context: d,
                show: true
            };
            f = e.direction === "rtl" ? "right" : "left";
            if (e.orientation === "horizontal") if (c._isRoot()) f = "up";
            j = a.extend({}, {
                option: {
                    direction: f
                }
            }, e.animation, e.showAnimation);
            a.wijmo.wijmenu._animateFlyoutMenu(j, i, function () {
                d.is(":hidden") && c._hideSubmenu(true, g);
                b._trigger("shown", g, c);
                k && k()
            });
            b._isClickToOpen = e.triggerEvent === "click";
            if (b._currentMenuList === undefined) b._currentMenuList = [];
            b._currentMenuList.push(c)
        },
        _setMenuItemPosition: function () {
            var c = this,
                b = c._getSublist(),
                d = c._getMenuItemPosition(),
                e = {
                    of: this._getLink()
                };
            b.css({
                left: "0",
                top: "0",
                position: "absolute"
            });
            b.position(a.extend(e, d))
        },
        _getMenuItemPosition: function () {
            var f = this,
                e = this._getMenu(),
                c = e.options,
                d = c.direction,
                b = d === "rtl" ? {
                    my: "right top",
                    at: "left top"
                } : {
                    my: "left top",
                    at: "right top"
                };
            if (c.orientation === "horizontal") if (f._isRoot()) b = d === "rtl" ? {
                my: "right top",
                at: "right bottom"
            } : {
                my: "left top",
                at: "left bottom"
            };
            b = a.extend(b, c.position);
            return b
        },
        _getChildren: function () {
            return this._getSublist().children("li")
        },
        _setDrilldownUlStyle: function () {
            var d = this,
                c = d._getSublist(),
                e = d._getMenu(),
                b = e.domObject.menucontainer.width();
            if (e.options.direction === "rtl") c.css({
                width: b,
                left: -b
            });
            else c.css({
                width: b,
                left: b
            });
            c.addClass("ui-widget-content");
            a.each(d.getItems(), function (b, a) {
                a.getItems().length && this._setDrilldownUlStyle()
            })
        },
        _getMenu: function () {
            var c = this,
                b = c._menu,
                a, d;
            if (!b) {
                a = c.element.parent();
                while (!a.is("body") && a.length > 0) {
                    d = a.data("wijmomenu");
                    if (d) {
                        b = a.data(d);
                        c._menu = b;
                        return b
                    }
                    a = a.parent()
                }
                throw "An menuitem must be a child of menu";
            }
            return b
        },
        getParent: function () {
            var c = this,
                f = c.element,
                e, b, d;
            b = c._parent;
            if (b !== undefined) return b;
            d = f.parents("li:first");
            if (d.length > 0) {
                b = a.wijmo.wijmenu._getItemWidget(d);
                if (b !== undefined) {
                    c._parent = b;
                    return b
                }
            }
            e = c._getMenu();
            if (e._getSublist().get(0) === f.parent().get(0)) {
                c._parent = null;
                return null
            }
            throw "An menuitem must be a child of menu or another menuitem";
        },
        _getParentOrMenu: function () {
            return this.getParent() || this._getMenu()
        },
        _getField: function (a) {
            return this.element.data(a)
        },
        _setField: function (b, a) {
            return this.element.data(b, a)
        },
        _innerDestroy: function (g) {
            var c = this,
                a = c.element,
                d, f = c.getItems(),
                e = f.length - 1;
            a.removeClass("ui-widget " + b + " ui-state-default ui-corner-all wijmo-wijmenu-parent ui-widget-header wijmo-wijmenu-separator");
            d = a.children(".wijmo-wijmenu-link");
            d.removeClass("wijmo-wijmenu-link ui-corner-all ui-state-focus ui-state-hover ui-state-active").html(d.children(".wijmo-wijmenu-text").html()).unbind(".wijmenuitem").unbind(".wijmenuEvent");
            a.children("ul").removeClass("wijmo-wijmenu-list ui-widget-content ui-corner-all ui-helper-clearfix wijmo-wijmenu-child ui-helper-reset").attr("role", "").attr("aria-activedescendant", "").show().css({
                left: "",
                top: "",
                position: ""
            }).attr("hidden", "");
            a.removeAttr("role");
            d.removeAttr("aria-haspopup");
            !g && c._removeFromParentCollection();
            a.removeData("menu").removeData("parent");
            for (; e >= 0; e--) f[e].destroy(true);
            c._items.length = 0;
            c._resetMarkupValue()
        },
        destroy: function (c) {
            var b = this;
            b._innerDestroy(c);
            a.Widget.prototype.destroy.apply(b)
        },
        _getFirstSelectableSubItem: function () {
            return a.wijmo.wijmenu._getFirstSelectableSubItem(this)
        },
        _getLastSelectableSubItem: function () {
            return a.wijmo.wijmenu._getLastSelectableSubItem(this)
        },
        next: function () {
            var f = this,
                c = f._getParentOrMenu().getItems(),
                b, d, e = a.inArray(f, c);
            if (e === -1) throw "cannot find item from the parent collection";
            for (b = e + 1; b < c.length; b++) {
                d = c[b].options;
                if (d.displayVisible !== false && !d.header && !d.separator) return c[b].element
            }
            return null
        },
        previous: function () {
            var f = this,
                d = f._getParentOrMenu().getItems(),
                b, c, e = a.inArray(f, d);
            if (e === -1) throw "cannot find item from the parent collection";
            for (b = e - 1; b >= 0; b--) {
                c = d[b].options;
                if (c.displayVisible !== false && !c.header && !c.separator) return d[b].element
            }
            return null
        },
        _removeFromParentCollection: function () {
            var d = this,
                b, e = false,
                c;
            b = d.getParent();
            if (b === null) {
                b = d._getMenu();
                e = true
            }
            c = a.inArray(d, b.getItems());
            if (c === -1) return;
            a.wijmo.wijmenu._changeCollection(c, b.getItems(), b.options.items);
            if (b.getItems().length === 0) {
                if (!e) {
                    b._setSubmenuIcon(false);
                    b._resetMarkupValue()
                }
                b.element.children("ul").remove()
            }
        },
        _resetMarkupValue: function () {
            this._sublist = null;
            this._link = null
        },
        _hideCurrentSubmenu: function (d) {
            var b = this,
                c = b._getSublist();
            if (c.length === 0) return;
            !c.data("notClose") && b._hideSubmenu(false, d);
            a.each(b.getItems(), function () {
                this._hideCurrentSubmenu(d)
            })
        },
        _showFlyoutSubmenu: function (d, e) {
            var c = this,
                f = this._getMenu(),
                b = f._currentMenuList,
                a;
            if (b !== undefined) for (a = b.length; a > 0; a--) if (b[a - 1] === c.getParent()) break;
            else b[a - 1]._hideSubmenu(false, d);
            c._displaySubmenu(d, e)
        },
        getItems: function () {
            return this._items
        },
        _getSublist: function () {
            var a = this;
            if (!a._sublist) a._sublist = this.element.children("ul:first");
            return a._sublist
        },
        _getLink: function () {
            var a = this;
            if (!a._link) a._link = this.element.children(":first");
            return a._link
        },
        _isRoot: function () {
            return this.getParent() === null
        },
        add: function (b, c) {
            a.wijmo.wijmenu._add(this, b, c)
        },
        remove: function (b) {
            a.wijmo.wijmenu._remove(this, b)
        }
    });
    a.extend(a.wijmo.wijmenu, {
        animations: {
            slide: function (b, c) {
                b = a.extend({
                    duration: 400,
                    easing: "swing"
                }, b, c);
                if (b.show) b.context.stop(true, true).animate({
                    height: "show"
                }, b).attr("aria-hidden", false);
                else b.context.stop(true, true).animate({
                    height: "hide"
                }, b).attr("aria-hidden", true)
            }
        },
        _animateFlyoutMenu: function (e, c, d) {
            var b = c.context;
            if (a.fn.wijshow) {
                b.data("isAnimated", true);
                b.wijshow(e, a.wijmo.wijmenuanimations, c, null, function () {
                    b.data("isAnimated", false);
                    var c = a.browser;
                    if (c.msie && c.version === "9.0") {
                        b.wrap("<div></div>");
                        b.unwrap()
                    } else c.msie && c.version === "6.0" && b.css("overflow", "");
                    b.attr("aria-hidden", false);
                    d && d()
                })
            } else b.show().attr("aria-hidden", false)
        },
        _getMenuItemOptions: function (b, c) {
            return !b ? {} : !b.items || !a.isArray(b.items) ? {} : c >= b.items.length ? {} : b.items[c]
        },
        _getOuterElement: function (c, b) {
            return a(c).filter(function () {
                return a(this).closest(b).length === 0
            })
        },
        _hasVisibleSubMenus: function (a) {
            var b, c, d;
            if (a.jquery) {
                if (a.data("wijmomenu")) b = a.data(a.data("wijmomenu"));
                else if (a.data("wijmomenuitem")) b = a.data(a.data("wijmomenuitem"))
            } else b = a;
            if (!b) throw "the arugment 'menuItem' must be an wijmenu or wijmenuitem";
            c = b.getItems();
            if (!c.length) return false;
            for (d = 0; d < c.length; d++) if (c[d].options.displayVisible) return true;
            return false
        },
        _getFirstSelectableSubItem: function (d) {
            for (var c = d.getItems(), b, a = 0; a < c.length; a++) {
                b = c[a].options;
                if (b.displayVisible !== false && !b.header && !b.separator) return c[a]
            }
            return null
        },
        _getLastSelectableSubItem: function (d) {
            for (var c = d.getItems(), b, a = c.length - 1; a >= 0; a--) {
                b = c[a].options;
                if (b.displayVisible !== false && !b.header && !b.separator) return c[a]
            }
            return null
        },
        _getSelectableSubItems: function (c, b) {
            return a.grep(c.getItems(), function (c, d) {
                var a = c.options;
                return a.header || a.separator || a.displayVisible === false ? false : b(c, d)
            })
        },
        _add: function (b, e, c) {
            var d = null,
                i = a("<li></li>"),
                g = b._getSublist(),
                f = b.getItems(),
                j, k, h = false;
            if (typeof e === "string") /<(h[1-5]|a)[\s\S]*>[\s\S]*<\/\1>/.test(e) && i.append(e);
            else if (a.isPlainObject(e)) k = jQuery.extend(true, {}, e);
            if (!g || g.length <= 0) {
                g = a("<ul></ul>");
                b.element.append(g);
                h = true
            }
            if (!c || isNaN(c) || c > f.length) if (c !== 0) c = f.length;
            if (f.length > 0 && f.length !== c) {
                j = f[c].element;
                i.insertBefore(j)
            } else g.append(i);
            d = b._createItemWidget(i, k);
            if (d === null || d === undefined) return;
            a.wijmo.wijmenu._changeCollection(c, b.getItems(), b.options.items, d);
            if (b._bindModeEvents) b._bindModeEvents(d, h);
            else d._bindModeEvents(d, h);
            h && b._initUlCssClass()
        },
        _changeCollection: function (a, c, d, b) {
            if (!b) {
                c.splice(a, 1);
                d.splice(a, 1);
                return
            }
            c.splice(a, 0, b);
            d.splice(a, 0, b.options)
        },
        _remove: function (c, b) {
            var a = c.getItems()[b];
            a && a.element && a.element.remove()
        },
        _getItemWidget: function (a) {
            return a.data(a.data("wijmomenuitem"))
        }
    })
})(jQuery);
(function (a) {
    "use strict";
    var e = 0,
        d = 0;

    function c() {
        return ++e
    }
    function b() {
        return ++d
    }
    a.widget("wijmo.wijtabs", {
        options: {
            alignment: "top",
            sortable: false,
            scrollable: false,
            ajaxOptions: null,
            cache: false,
            cookie: null,
            collapsible: false,
            hideOption: null,
            showOption: null,
            disabledIndexes: [],
            event: "click",
            idPrefix: "ui-tabs-",
            panelTemplate: "",
            spinner: "",
            tabTemplate: "",
            add: null,
            remove: null,
            select: null,
            beforeShow: null,
            show: null,
            load: null,
            disable: null,
            enable: null
        },
        _defaults: {
            panelTemplate: "<div></div>",
            spinner: "<em>Loading&#8230;</em>",
            tabTemplate: '<li><a href="#{href}"><span>#{label}</span></a></li>'
        },
        _create: function () {
            var b = this,
                c = b.options;
            if (window.wijmoApplyWijTouchUtilEvents) a = window.wijmoApplyWijTouchUtilEvents(a);
            b.element.is(":hidden") && b.element.wijAddVisibilityObserver && b.element.wijAddVisibilityObserver(function () {
                b.destroy();
                b._tabify(true);
                b.element.wijRemoveVisibilityObserver && b.element.wijRemoveVisibilityObserver()
            }, "wijtabs");
            b._tabify(true);
            (c.disabledstate || c.disabled) && b.disable();
            a.Widget.prototype._create.apply(b, arguments)
        },
        _setOption: function (c, b) {
            a.Widget.prototype._setOption.apply(this, arguments);
            switch (c) {
                case "selected":
                    if (this.options.collapsible && b === this.options.selected) return;
                    this.select(b);
                    break;
                case "alignment":
                    this._innerDestroy();
                    this._tabify(true);
                    break;
                default:
                    this._tabify()
            }
        },
        _initScroller: function () {
            var c = a.inArray(this._getAlignment(), ["top", "bottom"]) !== -1,
                b = 0;
            if (!c) return;
            this.lis.each(function () {
                b += a(this).outerWidth(true)
            });
            if ( !! this.options.scrollable && this.element.innerWidth() < b) {
                if (this.scrollWrap === undefined) {
                    this.list.wrap("<div class='scrollWrap'></div>");
                    this.scrollWrap = this.list.parent();
                    a.effects.save(this.list, ["width", "height", "overflow"])
                }
                this.list.width(b + 2);
                this.scrollWrap.height(this.list.outerHeight(true));
                this.scrollWrap.wijsuperpanel({
                    allowResize: false,
                    hScroller: {
                        scrollMode: "edge"
                    },
                    vScroller: {
                        scrollBarVisibility: "hidden"
                    }
                })
            } else this._removeScroller()
        },
        _removeScroller: function () {
            if (this.scrollWrap) {
                this.scrollWrap.wijsuperpanel("destroy").replaceWith(this.scrollWrap.contents());
                this.scrollWrap = undefined;
                a.effects.restore(this.list, ["width", "height", "overflow"])
            }
        },
        _tabId: function (d) {
            var e = a(d),
                b, f;
            if (e.data && e.data("tabid")) return e.data("tabid");
            if (d.href && d.href.length) {
                f = this._getURLParameters(d.href);
                if (f.tabId) {
                    b = f.tabId;
                    e.data("tabid", b);
                    return b
                }
            }
            b = d.title && d.title.replace(/\s/g, "_").replace(/[^A-Za-z0-9\-_:\.]/g, "") || this.options.idPrefix + c();
            e.data("tabid", b);
            return b
        },
        _getURLParameters: function (e) {
            var d = {}, b, c;
            if (e.indexOf("?") > -1) {
                b = e.split("?")[1];
                c = b.split("&");
                a.each(c, function (c, b) {
                    var a = b.split("=");
                    if (a.length > 1) d[a[0]] = a[1]
                })
            }
            return d
        },
        _sanitizeSelector: function (a) {
            return a.replace(/:/g, "\\:")
        },
        _cookie: function () {
            var c = this.cookie || (this.cookie = this.options.cookie.name || "ui-tabs-" + b());
            return a.cookie.apply(null, [c].concat(a.makeArray(arguments)))
        },
        _ui: function (a, b) {
            return {
                tab: a,
                panel: b,
                index: this.anchors.index(a)
            }
        },
        _cleanup: function () {
            this.lis.filter(".ui-state-processing").removeClass("ui-state-processing").find("span:data(label.tabs)").each(function () {
                var b = a(this);
                b.html(b.data("label.tabs")).removeData("label.tabs")
            })
        },
        _getAlignment: function (b) {
            b = b === undefined ? true : b;
            var a = this.options.alignment || "top";
            if (b) return a;
            switch (a) {
                case "top":
                    a = "bottom";
                    break;
                case "bottom":
                    a = "top";
                    break;
                case "left":
                    a = "right";
                    break;
                case "right":
                    a = "left"
            }
            return a
        },
        _saveLayout: function () {
            var b = ["width", "height", "overflow"],
                c = this.panels.filter(":not(.ui-tabs-hide)");
            a.effects.save(this.element, b);
            a.effects.save(this.list, b);
            a.effects.save(this.element.find(".wijmo-wijtabs-content"), b);
            this.list.width(this.list.width());
            this.element.data("panel.width", c.width());
            this.element.data("panel.outerWidth", c.outerWidth(true))
        },
        _restoreLayout: function () {
            var b = ["width", "height", "overflow"];
            a.effects.restore(this.element, b);
            a.effects.restore(this.list, b);
            a.effects.restore(this.element.find(".wijmo-wijtabs-content"), b)
        },
        _hideContent: function () {
            var a = this.element.find(".wijmo-wijtabs-content");
            if (a.length) {
                this._saveLayout();
                a.addClass("ui-tabs-hide").attr("aria-hidden", true);
                this.element.width(this.list.outerWidth(true))
            }
        },
        _showContent: function () {
            var a = this.element.find(".wijmo-wijtabs-content");
            if (a.length) {
                this._restoreLayout();
                a.removeClass("ui-tabs-hide").attr("aria-hidden", false)
            }
        },
        _blindPanel: function (b, c) {
            var j = this.options,
                h = b.parent(".wijmo-wijtabs-content"),
                k = ["position", "top", "left", "width"],
                f = c === "show" ? j.showOption : j.hideOption,
                e, i, g, d = this;
            if (!h.length) return;
            this.list.width(this.list.width());
            a.effects.save(b, k);
            b.show();
            if (c === "show") {
                b.removeClass("ui-tabs-hide").attr("aria-hidden", false);
                b.width(this.element.data("panel.width"))
            } else b.width(b.width());
            e = a.effects.createWrapper(b).css({
                overflow: "hidden"
            });
            c === "show" && e.css(a.extend({
                width: 0
            }, f.fade ? {
                opacity: 0
            } : {}));
            i = a.extend({
                width: c === "show" ? this.element.data("panel.outerWidth") : 0
            }, f.fade ? {
                opacity: c === "show" ? 1 : 0
            } : {});
            g = this.list.outerWidth(true);
            e.animate(i, {
                duration: f.duration,
                step: function () {
                    var a = e.outerWidth(true);
                    d.element.width(g + a);
                    h.width(Math.max(0, d.element.innerWidth() - g - 6))
                },
                complete: function () {
                    if (c === "hide") {
                        d.lis.removeClass("ui-tabs-selected ui-state-active").attr("aria-selected", false);
                        b.addClass("ui-tabs-hide").attr("aria-hidden", true)
                    } else b.css("width", "");
                    a.effects.removeWrapper(b);
                    c === "show" && d._restoreLayout();
                    d._resetStyle(b);
                    b.dequeue();
                    d.element.dequeue("tabs")
                }
            })
        },
        _resetStyle: function (b) {
            b.css({
                display: ""
            });
            !a.support.opacity && b[0].style.removeAttribute("filter")
        },
        _normalizeBlindOption: function (a) {
            if (a.blind === undefined) a.blind = false;
            if (a.fade === undefined) a.fade = false;
            if (a.duration === undefined) a.duration = 200;
            if (typeof a.duration === "string") try {
                a.duration = parseInt(a.duration, 10)
            } catch (b) {
                a.duration = 200
            }
        },
        _tabify: function (n) {
            this.list = this.element.children("ol,ul").eq(0);
            this.lis = a("li:has(a)", this.list);
            this.anchors = this.lis.map(function () {
                return a("a", this)[0]
            });
            this.panels = a([]);
            var c = this,
                b = this.options,
                m = /^#.+/,
                d, l, f, g, e, i, h, k, j;
            this.anchors.each(function (j, e) {
                var d = a(e).attr("href") || "",
                    h = d.split("#")[0],
                    i, g, f;
                if (h && (h === location.toString().split("#")[0] || (i = a("base")[0]) && h === i.href)) {
                    d = e.hash;
                    e.href = d
                }
                if (m.test(d)) c.panels = c.panels.add(c._sanitizeSelector(d), c.element);
                else if (d !== "#") {
                    a.data(e, "href.tabs", d);
                    a.data(e, "load.tabs", d.replace(/#.*$/, ""));
                    g = c._tabId(e);
                    e.href = "#" + g;
                    f = a("#" + g);
                    if (!f.length) {
                        f = a(b.panelTemplate || c._defaults.panelTemplate).attr("id", g).addClass("ui-tabs-panel ui-widget-content ui-corner-bottom").insertAfter(c.panels[j - 1] || c.list);
                        f.data("destroy.tabs", true)
                    }
                    c.panels = c.panels.add(f)
                } else b.disabledIndexes.push(j)
            });
            d = this._getAlignment();
            l = this._getAlignment(false);
            if (n) {
                this.list.attr("role", "tablist");
                this.lis.attr("role", "tab");
                this.panels.attr("role", "tabpanel");
                this.element.addClass("ui-tabs wijmo-wijtabs ui-tabs-" + d + " ui-widget ui-widget-content ui-corner-all ui-helper-clearfix");
                this.list.addClass("ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all");
                this.lis.addClass("ui-state-default ui-corner-" + d);
                this.panels.addClass("ui-tabs-panel ui-widget-content ui-corner-" + l);
                switch (d) {
                    case "bottom":
                        this.list.appendTo(this.element);
                        break;
                    case "left":
                        f = a("<div/>").addClass("wijmo-wijtabs-content").appendTo(this.element);
                        this.panels.appendTo(f);
                        break;
                    case "right":
                        f = a("<div/>").addClass("wijmo-wijtabs-content").insertBefore(this.list);
                        this.panels.appendTo(f);
                        break;
                    case "top":
                        this.list.prependTo(this.element)
                }
                b.sortable && this.list.sortable({
                    axis: d === "top" || d === "bottom" ? "x" : "y"
                });
                if (b.selected === undefined) {
                    location.hash && this.anchors.each(function (c, a) {
                        if (a.hash === location.hash) {
                            b.selected = c;
                            return false
                        }
                    });
                    if (typeof b.selected !== "number" && b.cookie) b.selected = parseInt(c._cookie(), 10);
                    if (typeof b.selected !== "number" && this.lis.filter(".ui-tabs-selected").length) b.selected = this.lis.index(this.lis.filter(".ui-tabs-selected"));
                    b.selected = b.selected || (this.lis.length ? 0 : -1)
                } else if (b.selected === null) b.selected = -1;
                b.selected = b.selected >= 0 && this.anchors[b.selected] || b.selected < 0 ? b.selected : 0;
                b.disabledIndexes = a.unique(b.disabledIndexes.concat(a.map(this.lis.filter(".ui-state-disabled"), function (a) {
                    return c.lis.index(a)
                }))).sort();
                a.inArray(b.selected, b.disabledIndexes) !== -1 && b.disabledIndexes.splice(a.inArray(b.selected, b.disabledIndexes), 1);
                this.panels.addClass("ui-tabs-hide").attr("aria-hidden", true);
                this.lis.removeClass("ui-tabs-selected ui-state-active").attr("aria-selected", false);
                if (b.selected >= 0 && this.anchors.length) {
                    this.panels.eq(b.selected).removeClass("ui-tabs-hide").attr("aria-hidden", false);
                    this.lis.eq(b.selected).addClass("ui-tabs-selected ui-state-active").attr("aria-selected", true);
                    c.element.queue("tabs", function () {
                        c.element.wijTriggerVisibility && a(c.panels[b.selected]).wijTriggerVisibility();
                        c._trigger("show", null, c._ui(c.anchors[b.selected], c.panels[b.selected]))
                    });
                    this.load(b.selected)
                }
                a(window).bind("unload", function () {
                    c.lis && c.lis.add(c.anchors).unbind(".tabs");
                    c.lis = c.anchors = c.panels = null
                })
            } else b.selected = this.lis.index(this.lis.filter(".ui-tabs-selected"));
            this.element[b.collapsible ? "addClass" : "removeClass"]("ui-tabs-collapsible");
            b.cookie && this._cookie(b.selected, b.cookie);
            for (g = 0; e = this.lis[g]; g++) {
                a(e)[a.inArray(g, b.disabledIndexes) !== -1 && !a(e).hasClass("ui-tabs-selected") ? "addClass" : "removeClass"]("ui-state-disabled");
                a(e).hasClass("ui-state-disabled") && a(e).attr("aria-disabled", true)
            }
            b.cache === false && this.anchors.removeData("cache.tabs");
            this.lis.add(this.anchors).unbind(".tabs");
            if (!b.disabledState && !b.disabled && b.event !== "mouseover") {
                i = function (b, a) {
                    a.is(":not(.ui-state-disabled)") && a.addClass("ui-state-" + b)
                };
                h = function (a, b) {
                    b.removeClass("ui-state-" + a)
                };
                this.lis.bind("mouseover.tabs", function () {
                    i("hover", a(this))
                });
                this.lis.bind("mouseout.tabs", function () {
                    h("hover", a(this))
                });
                this.anchors.bind("focus.tabs", function () {
                    i("focus", a(this).closest("li"))
                });
                this.anchors.bind("blur.tabs", function () {
                    h("focus", a(this).closest("li"))
                })
            }
            if (b.showOption === undefined || b.showOption === null) b.showOption = {};
            this._normalizeBlindOption(b.showOption);
            if (b.hideOption === undefined || b.hideOption === null) b.hideOption = {};
            this._normalizeBlindOption(b.hideOption);
            k = (b.showOption.blind || b.showOption.fade) && b.showOption.duration > 0 ? function (g, e) {
                a(g).closest("li").addClass("ui-tabs-selected ui-state-active").attr("aria-selected", true);
                c._showContent();
                e.removeClass("ui-tabs-hide").attr("aria-hidden", false);
                if (d === "top" || d === "bottom") {
                    var f = {
                        duration: b.showOption.duration
                    };
                    if (b.showOption.blind) f.height = "toggle";
                    if (b.showOption.fade) f.opacity = "toggle";
                    e.hide().removeClass("ui-tabs-hide").attr("aria-hidden", false).animate(f, b.showOption.duration || "normal", function () {
                        c._resetStyle(e);
                        e.wijTriggerVisibility && e.wijTriggerVisibility();
                        c._trigger("show", null, c._ui(g, e[0]))
                    })
                } else {
                    c._showContent();
                    c._blindPanel(e, "show")
                }
            } : function (d, b) {
                a(d).closest("li").addClass("ui-tabs-selected ui-state-active").attr("aria-selected", true);
                c._showContent();
                b.removeClass("ui-tabs-hide").attr("aria-hidden", false);
                b.wijTriggerVisibility && b.wijTriggerVisibility();
                c._trigger("show", null, c._ui(d, b[0]))
            };
            j = (b.hideOption.blind || b.hideOption.fade) && b.hideOption.duration > 0 ? function (f, a) {
                if (d === "top" || d === "bottom") {
                    var e = {
                        duration: b.hideOption.duration
                    };
                    if (b.hideOption.blind) e.height = "toggle";
                    if (b.hideOption.fade) e.opacity = "toggle";
                    a.animate(e, b.hideOption.duration || "normal", function () {
                        c.lis.removeClass("ui-tabs-selected ui-state-active").attr("aria-selected", false);
                        a.addClass("ui-tabs-hide").attr("aria-hidden", true);
                        c._resetStyle(a);
                        c.element.dequeue("tabs")
                    })
                } else {
                    c._saveLayout();
                    c._blindPanel(a, "hide")
                }
            } : function (b, a) {
                c.lis.removeClass("ui-tabs-selected ui-state-active").attr("aria-selected", false);
                c._hideContent();
                a.addClass("ui-tabs-hide").attr("aria-hidden", true);
                c.element.dequeue("tabs")
            };
            !b.disabledState && !b.disabled && this.anchors.bind(b.event + ".tabs", function () {
                var g = this,
                    f = a(this).closest("li"),
                    d = c.panels.filter(":not(.ui-tabs-hide)"),
                    e = a(c._sanitizeSelector(this.hash), c.element);
                if (f.hasClass("ui-tabs-selected") && !b.collapsible || f.hasClass("ui-state-disabled") || f.hasClass("ui-state-processing") || c._trigger("select", null, c._ui(this, e[0])) === false) {
                    this.blur();
                    return false
                }
                b.selected = c.anchors.index(this);
                c.abort();
                if (b.collapsible) if (f.hasClass("ui-tabs-selected")) {
                    b.selected = -1;
                    b.cookie && c._cookie(b.selected, b.cookie);
                    c.element.queue("tabs", function () {
                        j(g, d)
                    }).dequeue("tabs");
                    this.blur();
                    return false
                } else if (!d.length) {
                    b.cookie && c._cookie(b.selected, b.cookie);
                    c.element.queue("tabs", function () {
                        k(g, e)
                    });
                    c.load(c.anchors.index(this));
                    this.blur();
                    return false
                }
                b.cookie && c._cookie(b.selected, b.cookie);
                if (e.length) {
                    d.length && c.element.queue("tabs", function () {
                        j(g, d)
                    });
                    c.element.queue("tabs", function () {
                        k(g, e)
                    });
                    c.load(c.anchors.index(this))
                } else throw "jQuery UI Tabs: Mismatching fragment identifier.";
                a.browser.msie && this.blur()
            });
            this._initScroller();
            this.anchors.bind("click.tabs", function () {
                return false
            })
        },
        destroy: function () {
            this._innerDestroy();
            a.Widget.prototype.destroy.apply(this, arguments)
        },
        _innerDestroy: function () {
            var c = this.options,
                b = a(".wijmo-wijtabs-content");
            this.abort();
            this._removeScroller();
            this.element.unbind(".tabs").removeClass(["wijmo-wijtabs", "ui-tabs-top", "ui-tabs-bottom", "ui-tabs-left", "ui-tabs-right", "ui-tabs", "ui-widget", "ui-widget-content", "ui-corner-all", "ui-tabs-collapsible", "ui-helper-clearfix"].join(" ")).removeData("tabs").removeAttr("role");
            this.list.removeClass("ui-tabs-nav ui-helper-reset ui-helper-clearfixui-widget-header ui-corner-all").removeAttr("role");
            this.anchors.each(function () {
                var c = a.data(this, "href.tabs"),
                    b;
                if (c) this.href = c;
                b = a(this).unbind(".tabs");
                a.each(["href", "load", "cache"], function (c, a) {
                    b.removeData(a + ".tabs")
                })
            });
            this.lis.unbind(".tabs").add(this.panels).each(function () {
                if (a.data(this, "destroy.tabs")) a(this).remove();
                else a(this).removeClass(["ui-state-default", "ui-corner-top", "ui-corner-bottom", "ui-corner-left", "ui-corner-right", "ui-tabs-selected", "ui-state-active", "ui-state-hover", "ui-state-focus", "ui-state-disabled", "ui-tabs-panel", "ui-widget-content", "ui-tabs-hide"].join(" ")).css({
                    position: "",
                    left: "",
                    top: ""
                }).removeAttr("role").removeAttr("aria-hidden").removeAttr("aria-selected").removeAttr("aria-disabled")
            });
            b.length && b.replaceWith(b.contents());
            c.cookie && this._cookie(null, c.cookie);
            return this
        },
        add: function (h, l, b) {
            if (b === undefined) b = this.anchors.length;
            var c = this,
                f = this.options,
                e = a((f.tabTemplate || c._defaults.tabTemplate).replace(/#\{href\}/g, h).replace(/#\{label\}/g, l)),
                i = !h.indexOf("#") ? h.replace("#", "") : this._tabId(a("a", e)[0]),
                k = this._getAlignment(),
                j = this._getAlignment(false),
                d = a("#" + i),
                g;
            e.addClass("ui-state-default ui-corner-" + k).data("destroy.tabs", true).attr("role", "tab").attr("aria-selected", false);
            if (!d.length) d = a(f.panelTemplate || c._defaults.panelTemplate).attr("id", i).data("destroy.tabs", true).attr("role", "tabpanel");
            d.addClass("ui-tabs-panel ui-widget-content ui-corner-" + j + " ui-tabs-hide").attr("aria-hidden", true);
            if (b >= this.lis.length) {
                e.appendTo(this.list);
                if (this.panels.length > 0) d.insertAfter(this.panels[this.panels.length - 1]);
                else {
                    g = this.element.find(".wijmo-wijtabs-content");
                    if (g.length === 0) g = this.element;
                    d.appendTo(g)
                }
            } else {
                e.insertBefore(this.lis[b]);
                d.insertBefore(this.panels[b])
            }
            f.disabledIndexes = a.map(f.disabledIndexes, function (a) {
                return a >= b ? ++a : a
            });
            this._removeScroller();
            this._tabify();
            if (this.anchors.length === 1) {
                f.selected = 0;
                e.addClass("ui-tabs-selected ui-state-active").attr("aria-selected", true);
                d.removeClass("ui-tabs-hide").attr("aria-hidden", false);
                this.element.queue("tabs", function () {
                    c.element.wijTriggerVisibility && a(c.panels[0]).wijTriggerVisibility();
                    c._trigger("show", null, c._ui(c.anchors[0], c.panels[0]))
                });
                this.load(0)
            }
            this._trigger("add", null, this._ui(this.anchors[b], this.panels[b]));
            return this
        },
        remove: function (b) {
			
			
			var panel=this.panels.eq(b);
			
			var params={
				index:b,
				el:panel[0]
			}
			var res=this._trigger("beforeremove",params,params);
			
			if (res==false){
				return false;
			}
			
			
			
			
            var d = this.options,
                c = this.lis.eq(b).remove(),
                e = this.panels.eq(b).remove();
			
			
			
			
			
            c.hasClass("ui-tabs-selected") && this.anchors.length > 1 && this.select(b + (b + 1 < this.anchors.length ? 1 : -1));
            d.disabledIndexes = a.map(a.grep(d.disabledIndexes, function (a) {
                return a !== b
            }), function (a) {
                return a >= b ? --a : a
            });
            this._removeScroller();
            this._tabify();
            this._trigger("remove", null, this._ui(c.find("a")[0], e[0]));
            return this
        },
        enableTab: function (b) {
            var c = this.options;
            if (a.inArray(b, c.disabledIndexes) === -1) return;
            this.lis.eq(b).removeClass("ui-state-disabled").removeAttr("aria-disabled");
            c.disabledIndexes = a.grep(c.disabledIndexes, function (a) {
                return a !== b
            });
            this._trigger("enable", null, this._ui(this.anchors[b], this.panels[b]));
            return this
        },
        disableTab: function (a) {
            var b = this.options;
            if (a !== b.selected) {
                this.lis.eq(a).addClass("ui-state-disabled").attr("aria-disabled", true);
                b.disabledIndexes.push(a);
                b.disabledIndexes.sort();
                this._trigger("disable", null, this._ui(this.anchors[a], this.panels[a]))
            }
            return this
        },
        select: function (a) {
            if (typeof a === "string") a = this.anchors.index(this.anchors.filter("[href$=" + a + "]"));
            else if (a === null) a = -1;
            if (a === -1 && this.options.collapsible) a = this.options.selected;
            this.anchors.eq(a).trigger(this.options.event + ".tabs");
            return this
        },
        load: function (c) {
            var b = this,
                e = this.options,
                d = this.anchors.eq(c)[0],
                g = a.data(d, "load.tabs"),
                f = a("span", d);
            this.abort();
            if (!g || this.element.queue("tabs").length !== 0 && a.data(d, "cache.tabs")) {
                this.element.dequeue("tabs");
                return
            }
            this.lis.eq(c).addClass("ui-state-processing");
            (e.spinner || b._defaults.spinner) && f.data("label.tabs", f.html()).html(e.spinner || b._defaults.spinner);
            this.xhr = a.ajax(a.extend({}, e.ajaxOptions, {
                url: g,
                success: function (f, g) {
                    a(b._sanitizeSelector(d.hash), b.element).html(f);
                    b._cleanup();
                    e.cache && a.data(d, "cache.tabs", true);
                    b._trigger("load", null, b._ui(b.anchors[c], b.panels[c]));
                    try {
                        e.ajaxOptions.success(f, g)
                    } catch (h) {}
                },
                error: function (a, f) {
                    b._cleanup();
                    b._trigger("load", null, b._ui(b.anchors[c], b.panels[c]));
                    try {
                        e.ajaxOptions.error(a, f, c, d)
                    } catch (g) {}
                }
            }));
            b.element.dequeue("tabs");
            return this
        },
        abort: function () {
            this.element.queue([]);
            this.panels.stop(false, true);
            this.element.queue("tabs", this.element.queue("tabs").splice(-2, 2));
            if (this.xhr) {
                this.xhr.abort();
                delete this.xhr
            }
            this._cleanup();
            return this
        },
        url: function (a, b) {
            this.anchors.eq(a).removeData("cache.tabs").data("load.tabs", b);
            return this
        },
        length: function () {
            return this.anchors.length
        }
    })
})(jQuery);
(function (b) {
    "use strict";
    var a, c, d, j = false,
        i = false,
        h, f, e, g;
    b.widget("wijmo.wijvideo", {
        options: {
            fullScreenButtonVisible: true,
            showControlsOnHover: true,
            localization: null
        },
        _create: function () {
            var i = this,
                n, k, l, o = i.options,
                m;
            if (window.wijmoApplyWijTouchUtilEvents) b = window.wijmoApplyWijTouchUtilEvents(b);
            if (b(this.element).is("video")) a = b(this.element);
            else a = b(this.element).find("video");
            if (!a || a.length === 0 || b.browser.msie && b.browser.version < 9) return;
            l = a[0].canPlayType;
            if (!l) return;
            a.wrap('<div class="wijmo-wijvideo ui-widget-content ui-widget" />').after('<div class="wijmo-wijvideo-wrapper"><ul class="wijmo-wijvideo-controls ui-widget-header ui-helper-clearfix ui-helper-reset"><li class="wijmo-wijvideo-play ui-state-default ui-corner-all"><span class="ui-icon ui-icon-play"></span></li><li class="wijmo-wijvideo-index"><div class="wijmo-wijvideo-index-slider"></div></li><li class="wijmo-wijvideo-timer">00:00</li><li class="wijmo-wijvideo-volume ui-state-default ui-corner-all"><div class="wijmo-wijvideo-volume-container"><div class="wijmo-wijvideo-volumeslider ui-state-default ui-corner-top"></div></div><span class="ui-icon ui-icon-volume-on"></span></li><li class="wijmo-wijvideo-fullscreen ui-state-default ui-corner-all"><span class="ui-icon ui-icon-arrow-4-diag"></span></li></ul></div>');
            c = a.parent(".wijmo-wijvideo");
            c.width(a.outerWidth()).height(a.outerHeight());
            d = c.find(".wijmo-wijvideo-index-slider");
            i._volumnOn = true;
            e = c.find(".wijmo-wijvideo-volume");
            m = window.setInterval(function () {
                if (i._getVideoAttribute("readyState")) {
                    window.clearInterval(m);
                    c.width(a.outerWidth()).height(a.outerHeight());
                    a.parent().find(".wijmo-wijvideo-controls").show();
                    n = c.find(".wijmo-wijvideo-timer").position().left;
                    d.width(n - d.position().left - 15);
                    d.slider({
                        value: 0,
                        step: .01,
                        max: i._getVideoAttribute("duration"),
                        range: "min",
                        stop: function (b, a) {
                            j = false;
                            i._setVideoAttribute("currentTime", a.value)
                        },
                        slide: function () {
                            j = true
                        }
                    });
                    i._updateTime();
                    f = c.find(".wijmo-wijvideo-volumeslider");
                    f.slider({
                        min: 0,
                        max: 1,
                        value: i._getVideoAttribute("volume"),
                        step: .1,
                        orientation: "vertical",
                        range: "min",
                        slide: function (b, a) {
                            i._setVideoAttribute("volume", a.value);
                            if (a.value === 0) {
                                i._volumnOn = false;
                                e.find("span").removeClass("ui-icon-volume-on").addClass("ui-icon-volume-off")
                            } else {
                                i._volumnOn = true;
                                e.find("span").removeClass("ui-icon-volume-off").addClass("ui-icon-volume-on")
                            }
                        }
                    });
                    a.parent().find(".wijmo-wijvideo-controls").css("display", "none");
                    i._initialToolTip();
                    if (!o.showControlsOnHover) {
                        b(".wijmo-wijvideo-controls").show();
                        c.height(a.outerHeight() + b(".wijmo-wijvideo-controls").height())
                    }
                }
            }, 200);
            a.bind("click." + i.widgetName, function () {
                i._togglePlay()
            });
            o.showControlsOnHover && b(".wijmo-wijvideo").hover(function () {
                b(".wijmo-wijvideo-controls").stop(true, true).fadeIn()
            }, function () {
                b(".wijmo-wijvideo-controls").delay(300).fadeOut()
            });
            k = c.find(".wijmo-wijvideo-play > span");
            k.click(function () {
                i._togglePlay()
            }).parent().hover(function () {
                b(this).addClass("ui-state-hover")
            }, function () {
                b(this).removeClass("ui-state-hover")
            });
            c.find(".wijmo-wijvideo-volume").hover(function () {
                b(".wijmo-wijvideo-volume-container").stop(true, true).slideToggle()
            });
            g = c.find(".wijmo-wijvideo-fullscreen > span");
            g.click(function () {
                i._toggleFullScreen()
            }).parent().hover(function () {
                b(this).addClass("ui-state-hover")
            }, function () {
                b(this).removeClass("ui-state-hover")
            });
            !i.options.fullScreenButtonVisible && c.find(".wijmo-wijvideo-fullscreen").hide();
            e.hover(function () {
                b(this).addClass("ui-state-hover")
            }, function () {
                b(this).removeClass("ui-state-hover")
            }).click(function () {
                if (i._getVideoAttribute("readyState")) {
                    i._volumnOn = !i._volumnOn;
                    if (!i._volumnOn) {
                        h = f.slider("value");
                        f.slider("value", 0);
                        i._setVideoAttribute("volume", 0);
                        e.find("span").removeClass("ui-icon-volume-on").addClass("ui-icon-volume-off")
                    } else {
                        f.slider("value", h);
                        i._setVideoAttribute("volume", h);
                        e.find("span").removeClass("ui-icon-volume-off").addClass("ui-icon-volume-on")
                    }
                }
            });
            a.bind("play." + i.widgetName, function () {
                k.removeClass("ui-icon ui-icon-play").addClass("ui-icon ui-icon-pause")
            });
            a.bind("pause." + i.widgetName, function () {
                k.removeClass("ui-icon ui-icon-pause").addClass("ui-icon ui-icon-play")
            });
            a.bind("ended." + i.widgetName, function () {
                i.pause()
            });
            a.bind("timeupdate." + i.widgetName, function () {
                i._updateTime()
            });
            i._videoIsControls = false;
            if (i._getVideoAttribute("controls")) i._videoIsControls = true;
            a.removeAttr("controls");
            i.element.is(":hidden") && i.element.wijAddVisibilityObserver && i.element.wijAddVisibilityObserver(function () {
                i._refresh();
                i.element.wijRemoveVisibilityObserver && i.element.wijRemoveVisibilityObserver()
            }, "wijvideo");
            i.options.disabled && i._handleDisabledOption(true, i.element)
        },
        _setOption: function (f, d) {
            var e = this,
                g = e.options;
            b.Widget.prototype._setOption.apply(e, arguments);
            if (f === "fullScreenButtonVisible") {
                g.fullScreenButtonVisible = d;
                if (d) c.find(".wijmo-wijvideo-fullscreen").show();
                else c.find(".wijmo-wijvideo-fullscreen").hide()
            } else if (f === "disabled") e._handleDisabledOption(d, e.element);
            else if (f === "showControlsOnHover") if (!d) {
                b(".wijmo-wijvideo").unbind("mouseenter mouseleave");
                window.setTimeout(function () {
                    b(".wijmo-wijvideo-controls").show();
                    c.height(a.outerHeight() + b(".wijmo-wijvideo-controls").height())
                }, 200)
            } else {
                c.height(a.outerHeight());
                b(".wijmo-wijvideo-controls").hide();
                b(".wijmo-wijvideo").hover(function () {
                    b(".wijmo-wijvideo-controls").stop(true, true).fadeIn()
                }, function () {
                    b(".wijmo-wijvideo-controls").delay(300).fadeOut()
                })
            }
        },
        _handleDisabledOption: function (d, e) {
            var c = this;
            if (d) {
                if (!c.disabledDiv) c.disabledDiv = c._createDisabledDiv(e);
                c.disabledDiv.appendTo("body");
                if (b.browser.msie) {
                    b(".wijmo-wijvideo").unbind("mouseenter mouseleave");
                    a.unbind("click." + c.widgetName)
                }
            } else if (c.disabledDiv) {
                c.disabledDiv.remove();
                c.disabledDiv = null;
                if (b.browser.msie) {
                    b(".wijmo-wijvideo").hover(function () {
                        b(".wijmo-wijvideo-controls").stop(true, true).fadeIn()
                    }, function () {
                        b(".wijmo-wijvideo-controls").delay(300).fadeOut()
                    });
                    a.bind("click." + c.widgetName, function () {
                        c._togglePlay()
                    })
                }
            }
        },
        _createDisabledDiv: function () {
            var a = c,
                d = a.offset(),
                f = a.outerWidth(),
                e = a.outerHeight();
            return b("<div></div>").addClass("ui-disabled").css({
                "z-index": "99999",
                position: "absolute",
                width: f,
                height: e,
                left: d.left,
                top: d.top
            })
        },
        _getVideoAttribute: function (b) {
            return b === "" ? void 0 : a.attr(b) !== undefined ? a.attr(b) : a.prop(b)
        },
        _setVideoAttribute: function (b, c) {
            return b === "" ? void 0 : a.attr(b) !== undefined ? a.attr(b, c) : a.prop(b, c)
        },
        _initialToolTip: function () {
            var a = this;
            d.wijtooltip({
                mouseTrailing: true,
                showCallout: false,
                position: {
                    offset: "-60 -60"
                }
            });
            d.bind("mousemove", function (b) {
                a._changeToolTipContent(b)
            });
            e.wijtooltip({
                content: a._localizeString("volumeToolTip", "Volume"),
                showCallout: false
            });
            g.wijtooltip({
                content: a._localizeString("fullScreenToolTip", "Full Screen"),
                showCallout: false
            });
            d.wijtooltip("widget").addClass("wijmo-wijvideo");
            e.wijtooltip("widget").addClass("wijmo-wijvideo");
            e.wijtooltip("widget").addClass("wijmo-wijvideo")
        },
        _updateTime: function () {
            var g = this,
                i = g._getVideoAttribute("duration"),
                b = g._getVideoAttribute("currentTime"),
                a, e, f = "",
                h = "";
            a = this._truncate((i - b) / 60);
            e = this._truncate(i - b - a * 60);
            if (a < 10) f = "0";
            if (e < 10) h = "0";
            c.find(".wijmo-wijvideo-timer").html(f + a + ":" + h + e);
            !j && d.slider("value", b)
        },
        _truncate: function (a) {
            return Math[a > 0 ? "floor" : "ceil"](a)
        },
        _togglePlay: function () {
            var a = this;
            if (!a._getVideoAttribute("readyState")) return;
            if (a._getVideoAttribute("paused")) this.play();
            else this.pause()
        },
        _toggleFullScreen: function () {
            var d = this,
                h = d._getVideoAttribute("paused"),
                e = 0,
                f = b(window).width(),
                g = b(window).height();
            i = !i;
            if (i) {
                d._oriVidParentStyle = c.attr("style");
                d._oriWidth = a.outerWidth();
                d._oriHeight = a.outerHeight();
                d._oriDocOverFlow = b(document.documentElement).css("overflow");
                b(document.documentElement).css({
                    overflow: "hidden"
                });
                if (!d._replacedDiv) d._replacedDiv = b("<div />");
                c.after(d._replacedDiv);
                c.addClass("wijmo-wijvideo-container-fullscreen").css({
                    width: f,
                    height: g
                }).appendTo(b("body"));
                a.attr("width", f).attr("height", g);
                b(window).bind("resize.wijvideo", function () {
                    d._fullscreenOnWindowResize()
                });
                e = f - d._oriWidth
            } else {
                b(document.documentElement).css({
                    overflow: d._oriDocOverFlow
                });
                e = d._oriWidth - a.width();
                d._replacedDiv.after(c).remove();
                c.removeClass("wijmo-wijvideo-container-fullscreen").attr("style", "").attr("style", d._oriVidParentStyle);
                a.attr("width", d._oriWidth).attr("height", d._oriHeight);
                b(window).unbind("resize.wijvideo")
            }
            d._positionControls(e);
            d._hideToolTips();
            if (!h) d.play();
            else d.pause()
        },
        _fullscreenOnWindowResize: function () {
            var g = this,
                d = b(window).width(),
                e = b(window).height(),
                f = d - c.width();
            c.css({
                width: d,
                height: e
            });
            a.attr("width", d).attr("height", e);
            g._positionControls(f)
        },
        _positionControls: function (b) {
            var a = c.find(".wijmo-wijvideo-index-slider");
            a.width(a.width() + b)
        },
        _showToolTip: function (e) {
            var c = this,
                a = e.pageX,
                f = e.pageY,
                g = d.offset().left,
                h = d.width(),
                i = a - g,
                j = c._getVideoAttribute("duration"),
                b;
            b = j * (i / h);
            d.wijtooltip("option", "content", c._getToolTipContent(b));
            d.wijtooltip("showAt", {
                x: a,
                y: f - 10
            })
        },
        _changeToolTipContent: function (i) {
            var b = this,
                c = i.pageX,
                e = d.offset().left,
                f = d.width(),
                g = c - e,
                h = b._getVideoAttribute("duration"),
                a;
            a = h * (g / f);
            d.wijtooltip("option", "content", b._getToolTipContent(a))
        },
        _hideToolTips: function () {
            d.wijtooltip("hide");
            e.wijtooltip("hide");
            g.wijtooltip("hide")
        },
        _localizeString: function (b, c) {
            var a = this.options;
            return a.localization && a.localization[b] ? a.localization[b] : c
        },
        _getToolTipContent: function (c) {
            var a, b, d = "",
                e = "";
            a = parseInt(c / 60, 10);
            b = parseInt(c - a * 60, 10);
            if (a < 10) d = "0";
            if (b < 10) e = "0";
            return d + a + ":" + e + b
        },
        _refresh: function () {
            var e;
            a.parent().find(".wijmo-wijvideo-controls").show();
            e = c.find(".wijmo-wijvideo-timer").position().left;
            d.width(e - d.position().left - 15);
            a.parent().find(".wijmo-wijvideo-controls").css("display", "none");
            if (!this.options.showControlsOnHover) {
                b(".wijmo-wijvideo-controls", c).show();
                c.height(a.outerHeight() + b(".wijmo-wijvideo-controls").height())
            }
        },
        destroy: function () {
            var d = this;
            b.Widget.prototype.destroy.apply(this, arguments);
            c.after(a).remove();
            a.unbind("." + d.widgetName);
            d._videoIsControls && d._setVideoAttribute("controls", true)
        },
        play: function () {
            a[0].play()
        },
        pause: function () {
            a[0].pause()
        },
        getWidth: function () {
            return a.outerWidth()
        },
        setWidth: function (b) {
            b = b || 600;
            var d = this.getWidth();
            a.attr("width", b);
            c.width(a.outerWidth());
            this._positionControls(this.getWidth() - d)
        },
        getHeight: function () {
            return a.outerHeight()
        },
        setHeight: function (d) {
            d = d || 400;
            a.attr("height", d);
            if (this.options.showControlsOnHover) c.height(a.outerHeight());
            else c.height(a.outerHeight() + b(".wijmo-wijvideo-controls").height())
        }
    })
})(jQuery);