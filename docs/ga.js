      q.n = B;
      for (s = 0; s < e[u]; s++) p(e[s][1]()) || e[s][3]();
      q.n = i
    };
    d.hc = function () {
      d.q.u(F.m, d.za(), F.G)
    };
    d.Ya = function () {
      d.q.u(F.J, d.Q(), q.Xb * 1000)
    };
    d.ic = function () {
      d.q.u(F.ba, d.Aa(), 0)
    };
    d.$a = function () {
      d.q.u(F.K, d.Da(), q.zb * 1000)
    };
    d.jc = function () {
      d.q.u(F.ca, d.Ca(), F.G)
    };
    d.Za = function () {
      d.q.u(F.v, d.Ba(), F.G)
    };
    d.wd = function () {
      d.q.u(F.qa, d.Pc(), 0)
    };
    d.$ = [
      [F.m, d.za, d.Yb, d.hc, "."],
      [F.J, d.Q, d.Qa, d.Ya, ""],
      [F.ba, d.Aa, d.Zb, d.ic, ""],
      [F.ca, d.Ca, d.$b, d.jc, ""],
      [F.K, d.Da, d.ac, d.$a, "."],
      [F.v, d.Ba, d.Sa, d.Za, "."]]
  };
  F.pc = function (g) {
    var l = this,
    a = g,
    k = new F.ra(a),
    j = function () {},
    r = function (m) {
      var n = (new Date).getTime(),
      d;
      d = (n - m[3]) * (a.sd / 1000);
      if (d >= 1) {
        m[2] = Math.min(Math.floor(m[2] * 1 + d), a.wc);
        m[3] = n
      }
      return m
    };
    l.V = function (m, n, d, p, u, w) {
      var q, x = a.W,
      y = a.b.location;
      k.Ma(d);
      q = F.i(k.Q(), ".");
      if (q[1] < 500 || p) {
        if (u) q = r(q);
        if (p || !u || q[2] >= 1) {
          if (!p && u) q[2] = q[2] * 1 - 1;
          q[1] = q[1] * 1 + 1;
          m = "?utmwv=4.5.6&utmn=" + F.fa() + (F.h(y.hostname) ? "" : "&utmhn=" + F.p(y.hostname)) + (a.ja == 100 ? "" : "&utmsp=" + F.p(a.ja)) + m;
          if (0 == x || 2 == x) {
            p = 2 == x ? j : w || j;
            l.Bb(a.Ea + m, p)
          }
          if (1 == x || 2 == x) {
            m = ("https:" == y.protocol ? "https://ssl.google-analytics.com/__utm.gif" : "http://www.google-analytics.com/__utm.gif") + m + "&utmac=" + n + "&utmcc=" + l.Jc(d);
            l.Bb(m, w)
          }
        }
      }
      k.Qa(q.join("."));
      k.Ya()
    };
    l.Bb = function (m, n) {
      var d = new Image(1, 1);
      d.src = m;
      d.onload = function () {
        d.onload = null;
        (n || j)()
      }
    };
    l.Jc = function (m) {
      var n = [],
      d = [F.m, F.K, F.v, F.ca],
      p,
      u = k.r(),
      w;
      for (p = 0; p < d[F.d]; p++) {
        w = F.t(u, d[p] + m, ";");
        if (!F.h(w)) {
          if (d[p] == F.v) {
            w = F.i(F.i(w, m + ".")[1], "|")[0];
            if (F.h(w)) continue;
            w = m + "." + w
          }
          F.l(n, d[p] + w + ";")
        }
      }
      return F.p(n.join("+"))
    }
  };
  F.z = function () {
    var g = this;
    g.oa = [];
    g.Kb = function (l) {
      var a, k = g.oa,
      j;
      for (j = 0; j < k.length; j++) a = l == k[j].C ? k[j] : a;
      return a
    };
    g.vc = function (l, a, k, j, r, m, n, d) {
      var p = g.Kb(l);
      if (F.a == p) {
        p = new F.z.tc(l, a, k, j, r, m, n, d);
        F.l(g.oa, p)
      } else {
        p.rb = a;
        p.fc = k;
        p.ec = j;
        p.bc = r;
        p.xb = m;
        p.dc = n;
        p.Ab = d
      }
      return p
    }
  };
  F.z.sc = function (g, l, a, k, j, r) {
    var m = this;
    m.gc = g;
    m.Ta = l;
    m.S = a;
    m.vb = k;
    m.Ub = j;
    m.Vb = r;
    m.Va = function () {
      var n = F.p;
      return "&" + ["utmt=item", "tid=" + n(m.gc), "ipc=" + n(m.Ta), "ipn=" + n(m.S), "iva=" + n(m.vb), "ipr=" + n(m.Ub), "iqt=" + n(m.Vb)].join("&utm")
    }
  };
  F.z.tc = function (g, l, a, k, j, r, m, n) {
    var d = this;
    d.C = g;
    d.rb = l;
    d.fc = a;
    d.ec = k;
    d.bc = j;
    d.xb = r;
    d.dc = m;
    d.Ab = n;
    d.ha = [];
    d.uc = function (p, u, w, q, x) {
      var y = d.Qc(p),
      f = d.C;
      if (F.a == y) F.l(d.ha, new F.z.sc(f, p, u, w, q, x));
      else {
        y.gc = f;
        y.Ta = p;
        y.S = u;
        y.vb = w;
        y.Ub = q;
        y.Vb = x
      }
    };
    d.Qc = function (p) {
      var u, w = d.ha,
      q;
      for (q = 0; q < w.length; q++) u = p == w[q].Ta ? w[q] : u;
      return u
    };
    d.Va = function () {
      var p = F.p;
      return "&" + ["utmt=tran", "id=" + p(d.C), "st=" + p(d.rb), "to=" + p(d.fc), "tx=" + p(d.ec), "sp=" + p(d.bc), "ci=" + p(d.xb), "rg=" + p(d.dc), "co=" + p(d.Ab)].join("&utmt")
    }
  };
  F.kc = function (g) {
    var l = g,
    a = l.c,
    k = this,
    j = "-";
    k.ka = a.screen;
    k.tb = !k.ka && a.java ? java.awt.Toolkit.getDefaultToolkit() : F.a;
    k.g = a.navigator;
    k.la = j;
    k.Pa = j;
    k.wb = j;
    k.Ha = j;
    k.Ga = 1;
    k.Gb = j;
    function r() {
      var m, n, d;
      n = "ShockwaveFlash";
      var p = "$version",
      u = k.g ? k.g.plugins : F.a;
      if (u && u[F.d] > 0) for (m = 0; m < u[F.d] && !d; m++) {
        n = u[m];
        if (F.Ua(n.name, "Shockwave Flash")) d = F.i(n.description, "Shockwave Flash ")[1]
      } else {
        n = n + "." + n;
        try {
          m = new ActiveXObject(n + ".7");
          d = m.GetVariable(p)
        } catch(w) {}
        if (!d) try {
          m = new ActiveXObject(n + ".6");
          d = "WIN 6,0,21,0";
          m.AllowScriptAccess = "always";
          d = m.GetVariable(p)
        } catch(q) {}
        if (!d) try {
          m = new ActiveXObject(n);
          d = m.GetVariable(p)
        } catch(x) {}
        if (d) {
          d = F.i(F.i(d, " ")[1], ",");
          d = d[0] + "." + d[1] + " r" + d[2]
        }
      }
      return d ? d : j
    }
    k.Kc = function () {
      var m;
      if (a.screen) {
        k.la = k.ka.width + "x" + k.ka.height;
        k.Pa = k.ka.colorDepth + "-bit"
      } else if (k.tb) try {
        m = k.tb.getScreenSize();
        k.la = m.width + "x" + m.height
      } catch(n) {}
      k.Ha = F.Wa(k.g && k.g.language ? k.g.language : k.g && k.g.browserLanguage ? k.g.browserLanguage : j);
      k.Ga = k.g && k.g.javaEnabled() ? 1 : 0;
      k.Gb = l.xa ? r() : j;
      k.wb = F.p(l.b.characterSet ? l.b.characterSet : l.b.charset ? l.b.charset : j)
    };
    k.qd = function () {
      return "&utm" + ["cs=" + F.p(k.wb), "sr=" + k.la, "sc=" + k.Pa, "ul=" + k.Ha, "je=" + k.Ga, "fl=" + F.p(k.Gb)].join("&utm")
    };
    k.Ic = function () {
      var m = l.b,
      n = a.history[F.d];
      m = k.g.appName + k.g.version + k.Ha + k.g.platform + k.g.userAgent + k.Ga + k.la + k.Pa + (m[F.aa] ? m[F.aa] : "") + (m.referrer ? m.referrer : "");
      for (var d = m[F.d]; n > 0;) m += n--^d++;
      return F.s(m)
    }
  };
  F.w = function (g, l, a, k) {
    var j = k,
    r = this,
    m = F.h,
    n = F.a,
    d = F.Ua,
    p = F.t,
    u = F.Wa,
    w = F.i,
    q = F.R,
    x = F.na,
    y = F.d;
    r.f = g;
    r.Wb = l;
    r.D = a;
    function f(e) {
      return m(e) || "0" == e || !d(e, "://")
    }
    function s(e) {
      var i = "";
      e = u(w(e, "://")[1]);
      if (d(e, "/")) {
        e = w(e, "/")[1];
        if (d(e, "?")) i = w(e, "?")[0]
      }
      return i
    }
    function B(e) {
      var i = "";
      i = u(w(e, "://")[1]);
      if (d(i, "/")) i = w(i, "/")[0];
      return i
    }
    r.Sc = function (e) {
      var i = r.Jb();
      return new F.w.L(p(e, j.lb + "=", "&"), p(e, j.ob + "=", "&"), p(e, j.qb + "=", "&"), r.ga(e, j.jb, "(not set)"), r.ga(e, j.mb, "(not set)"), r.ga(e, j.pb, i && !m(i.Y) ? F.O(i.Y) : n), r.ga(e, j.kb, n))
    };
    r.Mb = function (e) {
      var i = B(e),
      o = s(e);
      if (d(i, j.rc)) {
        e = w(e, "?").join("&");
        if (d(e, "&" + j.Xc + "=")) if (o == j.Wc) return c
      }
      return E
    };
    r.Jb = function () {
      var e, i = r.Wb,
      o, t, A = j.La;
      if (! (f(i) || r.Mb(i))) {
        e = B(i);
        for (o = 0; o < A[y]; o++) {
          t = A[o];
          if (d(e, u(t.Db))) {
            i = w(i, "?").join("&");
            if (d(i, "&" + t.Sb + "=")) {
              e = w(i, "&" + t.Sb + "=")[1];
              if (d(e, "&")) e = w(e, "&")[0];
              return new F.w.L(n, t.Db, n, "(organic)", "organic", e, n)
            }
          }
        }
      }
    };
    r.ga = function (e, i, o) {
      e = p(e, i + "=", "&");
      return o = !m(e) ? F.O(e) : !m(o) ? o : "-"
    };
    r.cd = function (e) {
      var i = j.Ka,
      o = E,
      t;
      if (e && "organic" == e.ia) {
        e = u(F.O(e.Y));
        for (t = 0; t < i[y]; t++) o = o || u(i[t]) == e
      }
      return o
    };
    r.Rc = function () {
      var e = "",
      i = "";
      e = r.Wb;
      if (! (f(e) || r.Mb(e))) {
        e = w(e, "://")[1];
        if (d(e, "/")) {
          i = x(e, q(e, "/"));
          i = w(i, "?")[0];
          e = u(w(e, "/")[0])
        }
        if (0 == q(e, "www.")) e = x(e, 4);
        return new F.w.L(n, e, n, "(referral)", "referral", n, i)
      }
    };
    r.Ec = function (e) {
      var i = "";
      if (j.sa) {
        i = F.Hb(e);
        i = "" != i ? i + "&" : i
      }
      i += e.search;
      return i
    };
    r.Nc = function () {
      return new F.w.L(n, "(direct)", n, "(direct)", "(none)", n, n)
    };
    r.dd = function (e) {
      var i = E,
      o, t = j.Na;
      if (e && "referral" == e.ia) {
        e = u(F.p(e.ma));
        for (o = 0; o < t[y]; o++) i = i || d(e, u(t[o]))
      }
      return i
    };
    r.Z = function (e) {
      return n != e && e.Pb()
    };
    r.Lc = function (e, i) {
      var o = "",
      t = "-",
      A, C = 0,
      G, b, h = r.f;
      if (!e) return "";
      b = e.r();
      o = r.Ec(j.b.location);
      if (j.M && e.Nb()) {
        t = e.Da();
        if (!m(t) && !d(t, ";")) {
          e.$a();
          return ""
        }
      }
      t = p(b, F.K + h + ".", ";");
      A = r.Sc(o);
      if (r.Z(A)) {
        o = p(o, j.nb + "=", "&");
        if ("1" == o && !m(t)) return ""
      }
      if (!r.Z(A)) {
        A = r.Jb();
        if (!m(t) && r.cd(A)) return ""
      }
      if (!r.Z(A) && i) {
        A = r.Rc();
        if (!m(t) && r.dd(A)) return ""
      }
      if (!r.Z(A)) if (m(t) && i) A = r.Nc();
      if (!r.Z(A)) return "";
      if (!m(t)) {
        C = w(t, ".");
        G = new F.w.L;
        G.Gc(C.slice(4).join("."));
        G = u(G.Xa()) == u(A.Xa());
        C = C[3] * 1
      }
      if (!G || i) {
        i = p(b, F.m + h + ".", ";");
        b = i.lastIndexOf(".");
        i = b > 9 ? x(i, b + 1) * 1 : 0;
        C++;
        i = 0 == i ? 1 : i;
        e.ac([h, r.D, i, C, A.Xa()].join("."));
        e.$a();
        return "&utmcn=1"
      } else return "&utmcr=1"
    }
  };
  F.w.L = function (g, l, a, k, j, r, m) {
    var n = this;
    n.C = g;
    n.ma = l;
    n.ua = a;
    n.S = k;
    n.ia = j;
    n.Y = r;
    n.yb = m;
    n.Xa = function () {
      var d = this,
      p = [],
      u = [
        [F.db, d.C],
        [F.fb, d.ma],
        [F.hb, d.ua],
        [F.bb, d.S],
        [F.eb, d.ia],
        [F.gb, d.Y],
        [F.cb, d.yb]],
      w;
      if (d.Pb()) for (d = 0; d < u[F.d]; d++) if (!F.h(u[d][1])) {
        w = u[d][1].split("+").join("%20");
        w = w.split(" ").join("%20");
        F.l(p, "utm" + u[d][0] + "=" + w)
      }
      return p.join("|")
    };
    n.Pb = function () {
      var d = F.h;
      return ! (d(n.C) && d(n.ma) && d(n.ua))
    };
    n.Gc = function (d) {
      var p = function (u) {
        return F.O(F.t(d, "utm" + u + "=", "|"))
      };
      n.C = p(F.db);
      n.ma = p(F.fb);
      n.ua = p(F.hb);
      n.S = p(F.bb);
      n.ia = p(F.eb);
      n.Y = p(F.gb);
      n.yb = p(F.cb)
    }
  };
  F.nc = function (g, l, a, k) {
    var j = this,
    r = F.d,
    m = F.i,
    n = l,
    d = F.h,
    p = g,
    u = k;
    j.ea = a;
    j.Ja = "";
    j.B = {};
    j.bd = function () {
      var q;
      q = m(F.t(j.ea.r(), F.v + n + ".", ";"), n + ".")[1];
      if (!d(q)) {
        q = m(q, "|");
        w(1, j.B, q[1]);
        j.Ja = q[0];
        j.pa()
      }
    };
    j.pa = function () {
      j.xc();
      var q = j.Ja,
      x, y, f = "";
      for (x in j.B) if ((y = j.B[x]) && 1 === y[2]) f += x + "=" + y[0] + "=" + y[1] + "=1,";
      d(f) || (q += "|" + f);
      if (d(q)) j.ea.Cc();
      else {
        j.ea.Sa(n + "." + q);
        j.ea.Za()
      }
    };
    j.nd = function (q) {
      j.Ja = q;
      j.pa()
    };
    j.ld = function (q, x, y, f) {
      if (1 != f && 2 != f && 3 != f) f = 2;
      var s = E,
      B = j.B;
      if (q > 0 && q <= p.Tb) {
        B[q] = [x, y, f];
        j.pa();
        s = c
      }
      return s
    };
    j.Mc = function (q) {
      if (q = j.B[q]) return {
        value: q[1],
        scope: q[2]
      }
    };
    j.Bc = function (q) {
      var x = j.B;
      if (x[q]) {
        delete x[q];
        j.pa()
      }
    };
    j.xc = function () {
      u._clearKey(8);
      u._clearValue(8);
      u._clearKey(9);
      var q = j.B,
      x, y;
      for (y in q) if (x = q[y]) {
        u._setKey(8, y, x[0]);
        u._setKey(9, y, x[1]);
        3 != x[2] && u._setValue(8, y, x[2])
      }
    };
    function w(q, x, y) {
      var f;
      if (!d(y)) {
        y = m(y, ",");
        for (var s = 0; s < y[r]; s++) {
          f = y[s];
          if (!d(f)) {
            f = m(f, "=");
            if (f[r] == 4) x[f[0]] = [f[1], f[2], q]
          }
        }
      }
    }
  };
  F.da = function () {
    var g = this,
    l = {},
    a = "k",
    k = "v",
    j = [a, k],
    r = "(",
    m = ")",
    n = "*",
    d = "!",
    p = "'",
    u = {};
    u[p] = "'0";
    u[m] = "'1";
    u[n] = "'2";
    u[d] = "'3";
    var w = 1;
    function q(e, i, o, t) {
      if (F.a == l[e]) l[e] = {};
      if (F.a == l[e][i]) l[e][i] = [];
      l[e][i][o] = t
    }
    function x(e, i, o) {
      return F.a != l[e] && F.a != l[e][i] ? l[e][i][o] : F.a
    }
    function y(e, i) {
      if (F.a != l[e] && F.a != l[e][i]) {
        l[e][i] = F.a;
        i = c;
        var o;
        for (o = 0; o < j[F.d]; o++) if (F.a != l[e][j[o]]) {
          i = E;
          break
        }
        if (i) l[e] = F.a
      }
    }
    function f(e) {
      var i = "",
      o = E,
      t, A;
      for (t = 0; t < j[F.d]; t++) {
        A = e[j[t]];
        if (F.a != A) {
          if (o) i += j[t];
          i += s(A);
          o = E
        } else o = c
      }
      return i
    }
    function s(e) {
      var i = [],
      o,
      t;
      for (t = 0; t < e[F.d]; t++) if (F.a != e[t]) {
        o = "";
        if (t != w && F.a == e[t - 1]) o += t.toString() + d;
        o += B(e[t]);
        F.l(i, o)
      }
      return r + i.join(n) + m
    }
    function B(e) {
      var i = "",
      o, t, A;
      for (o = 0; o < e[F.d]; o++) {
        t = e.charAt(o);
        A = u[t];
        i += F.a != A ? A : t
      }
      return i
    }
    g.Zc = function (e) {
      return F.a != l[e]
    };
    g.U = function () {
      var e = "",
      i;
      for (i in l) if (F.a != l[i]) e += i.toString() + f(l[i]);
      return e
    };
    g.jd = function (e) {
      if (e == F.a) return g.U();
      var i = e.U(),
      o;
      for (o in l) if (F.a != l[o] && !e.Zc(o)) i += o.toString() + f(l[o]);
      return i
    };
    g._setKey = function (e, i, o) {
      if (typeof o != "string") return E;
      q(e, a, i, o);
      return c
    };
    g._setValue = function (e, i, o) {
      if (typeof o != "number" && (F.a == Number || !(o instanceof Number)) || Math.round(o) != o || o == NaN || o == Infinity) return E;
      q(e, k, i, o.toString());
      return c
    };
    g._getKey = function (e, i) {
      return x(e, a, i)
    };
    g._getValue = function (e, i) {
      return x(e, k, i)
    };
    g._clearKey = function (e) {
      y(e, a)
    };
    g._clearValue = function (e) {
      y(e, k)
    }
  };
  F.oc = function (g, l) {
    var a = this;
    a.yd = l;
    a.fd = g;
    a._trackEvent = function (k, j, r) {
      return l._trackEvent(a.fd, k, j, r)
    }
  };
  F.qc = function (g, l) {
    var a = this,
    k = F.a,
    j = F.h,
    r = F.R,
    m = F.na,
    n = F.t,
    d = F.Ua,
    p = F.i,
    u = F.Wa,
    w = F.Rb,
    q = F.d,
    x = F.p,
    y = k,
    f = new F.lc,
    s = E,
    B = k;
    a.c = window;
    a.D = Math.round((new Date).getTime() / 1000);
    a.F = g || "UA-XXXXX-X";
    a.Cb = f.b.referrer;
    a.ya = k;
    a.j = k;
    a.P = k;
    a.T = E;
    a.N = k;
    a.ub = "";
    a.k = k;
    a.Eb = k;
    a.f = k;
    a.o = k;
    f.A = l ? x(l) : undefined;
    function e() {
      if ("auto" == f.e) {
        var b = f.b.domain;
        if ("www." == m(b, 0, 4)) b = m(b, 4);
        f.e = b
      }
      f.e = u(f.e)
    }
    function i() {
      var b = f.e,
      h = r(b, "www.google.") * r(b, ".google.") * r(b, "google.");
      return h || "/" != f.n || r(b, "google.org") > -1
    }
    function o(b, h, v) {
      if (j(b) || j(h) || j(v)) return "-";
      b = n(b, F.m + a.f + ".", h);
      if (!j(b)) {
        b = p(b, ".");
        b[5] = b[5] ? b[5] * 1 + 1 : 1;
        b[3] = b[4];
        b[4] = v;
        b = w(b, ".")
      }
      return b
    }
    function t() {
      return "file:" != f.b.location.protocol && i()
    }
    function A(b) {
      if (!b || "" == b) return "";
      for (; F.Qb(b.charAt(0));) b = m(b, 1);
      for (; F.Qb(b.charAt(b[q] - 1));) b = m(b, 0, b[q] - 1);
      return b
    }
    function C(b, h, v, z) {
      if (!j(b())) {
        h(z ? F.O(b()) : b());
        d(b(), ";") || v()
      }
    }
    function G(b) {
      var h, v = "" != b && f.b.location.host != b;
      if (v) for (h = 0; h < f.H[q]; h++) v = v && r(u(b), u(f.H[h])) == -1;
      return v
    }
    a.ed = function () {
      var b = E;
      if (a.P) b = a.P.match(/^[0-9a-z-_.]{10,1200}$/i);
      return b
    };
    a.Tc = function () {
      return F.fa() ^ a.N.Ic() & 2147483647
    };
    a.Oc = function () {
      if (!f.e || "" == f.e || "none" == f.e) {
        f.e = "";
        return 1
      }
      e();
      return f.sb ? F.s(f.e) : 1
    };
    a.Fc = function (b, h) {
      if (j(b)) b = "-";
      else {
        h += f.n && "/" != f.n ? f.n : "";
        h = r(b, h);
        b = h >= 0 && h <= 8 ? "0" : "[" == b.charAt(0) && "]" == b.charAt(b[q] - 1) ? "-" : b
      }
      return b
    };
    a.Oa = function (b) {
      var h = "",
      v = f.b;
      h += f.va ? a.N.qd() : "";
      h += f.ta ? a.ub : "";
      h += f.wa && !j(v.title) ? "&utmdt=" + x(v.title) : "";
      h += "&utmhid=" + F.Hc() + "&utmr=" + x(a.ya) + "&utmp=" + x(a.kd(b));
      return h
    };
    a.kd = function (b) {
      var h = f.b.location;
      return b = k != b && "" != b ? x(b, c) : x(h.pathname + h.search, c)
    };
    a.td = function (b) {
      if (a.X()) {
        var h = "";
        if (a.k != k && a.k.U().length > 0) h += "&utme=" + x(a.k.U());
        h += a.Oa(b);
        y.V(h, a.F, a.f)
      }
    };
    a.Ac = function () {
      var b = new F.ra(f);
      return b.Ma(a.f) ? b.pd() : k
    };
    a._getLinkerUrl = function (b, h) {
      var v = p(b, "#"),
      z = b,
      D = a.Ac();
      if (D) if (h && 1 >= v[q]) z += "#" + D;
      else if (!h || 1 >= v[q]) if (1 >= v[q]) z += (d(b, "?") ? "&" : "?") + D;
      else z = v[0] + (d(b, "?") ? "&" : "?") + D + "#" + v[1];
      return z
    };
    a.cc = function () {
      var b;
      if (a.ed()) {
        a.o.md(a.P);
        a.o.wd();
        F._gasoDomain = f.e;
        F._gasoCPath = f.n;
        b = f.b.createElement("script");
        b.type = "text/javascript";
        b.id = "_gasojs";
        b.src = "https://www.google.com/analytics/reporting/overlay_js?gaso=" + a.P + "&" + F.fa();
        f.b.getElementsByTagName("head")[0].appendChild(b)
      }
    };
    a.Yc = function () {
      var b = a.D,
      h = a.o,
      v = h.r(),
      z = a.f + "",
      D = f.c,
      I = D ? D.gaGlobal : k,
      K,
      M = d(v, F.m + z + "."),
      O = d(v, F.J + z),
      P = d(v, F.ba + z),
      H,
      J = [],
      L = "",
      N = E;
      v = j(v) ? "" : v;
      if (f.M) {
        K = F.Hb(f.b.location);
        if (f.sa && !j(K)) L = K + "&";
        L += f.b.location.search;
        if (!j(L) && d(L, F.m)) {
          h.hd(L);
          h.Nb() || h.zc();
          H = h.za()
        }
        C(h.Ca, h.$b, h.jc, true);
        C(h.Ba, h.Sa, h.Za)
      }
      if (j(H)) if (M) if (!O || !P) {
        H = o(v, ";", b);
        a.T = c
      } else {
        H = n(v, F.m + z + ".", ";");
        J = p(n(v, F.J + z, ";"), ".")
      } else {
        H = w([z, a.Tc(), b, b, b, 1], ".");
        N = a.T = c
      } else if (j(h.Q()) || j(h.Aa())) {
        H = o(L, "&", b);
        a.T = c
      } else {
        J = p(h.Q(), ".");
        z = J[0]
      }
      H = p(H, ".");
      if (D && I && I.dh == z && !f.A) {
        H[4] = I.sid ? I.sid : H[4];
        if (N) {
          H[3] = I.sid ? I.sid : H[4];
          if (I.vid) {
            b = p(I.vid, ".");
            H[1] = b[0];
            H[2] = b[1]
          }
        }
      }
      h.Yb(w(H, "."));
      J[0] = z;
      J[1] = J[1] ? J[1] : 0;
      J[2] = undefined != J[2] ? J[2] : f.rd;
      J[3] = J[3] ? J[3] : H[4];
      h.Qa(w(J, "."));
      h.Zb(z);
      j(h.Vc()) || h.Ra(h.s());
      h.hc();
      h.Ya();
      h.ic()
    };
    a.$c = function () {
      y = new F.pc(f)
    };
    a._initData = function () {
      var b;
      if (!s) {
        if (!a.N) {
          a.N = new F.kc(f);
          a.N.Kc()
        }
        a.f = a.Oc();
        a.o = new F.ra(f);
        a.k = new F.da;
        B = new F.nc(f, a.f, a.o, a.k);
        a.$c()
      }
      if (t()) {
        a.Yc();
        B.bd()
      }
      if (!s) {
        if (t()) {
          a.ya = a.Fc(a.Cb, f.b.domain);
          if (f.ta) {
            b = new F.w(a.f, a.ya, a.D, f);
            a.ub = b.Lc(a.o, a.T)
          }
        }
        a.Eb = new F.da;
        s = c
      }
      F.Lb || a.ad()
    };
    a._visitCode = function () {
      a._initData();
      var b = n(a.o.r(), F.m + a.f + ".", ";");
      b = p(b, ".");
      return b[q] < 4 ? "" : b[1]
    };
    a._cookiePathCopy = function (b) {
      a._initData();
      a.o && a.o.vd(a.f, b)
    };
    a.ad = function () {
      var b = f.b.location.hash;
      if (b && 1 == r(b, "gaso=")) b = n(b, "gaso=", "&");
      else b = (b = f.c.name) && 0 <= r(b, "gaso=") ? n(b, "gaso=", "&") : n(a.o.r(), F.qa, ";");
      if (b[q] >= 10) {
        a.P = b;
        f.c.addEventListener ? f.c.addEventListener("load", a.cc, E) : f.c.attachEvent("onload", a.cc)
      }
      F.Lb = c
    };
    a.X = function () {
      return a._visitCode() % 10000 < f.ja * 100
    };
    a.od = function () {
      var b, h, v = f.b.links;
      if (!f.Ob) {
        b = f.b.domain;
        if ("www." == m(b, 0, 4)) b = m(b, 4);
        f.H.push("." + b)
      }
      for (b = 0; b < v[q] && (f.Ia == -1 || b < f.Ia); b++) {
        h = v[b];
        if (G(h.host)) if (!h.gatcOnclick) {
          h.gatcOnclick = h.onclick ? h.onclick : a.gd;
          h.onclick = function (z) {
            var D = !this.target || this.target == "_self" || this.target == "_top" || this.target == "_parent";
            D = D && !a.yc(z);
            a.ud(z, this, D);
            return D ? E : this.gatcOnclick ? this.gatcOnclick(z) : c
          }
        }
      }
    };
    a.gd = function () {};
    a._trackPageview = function (b) {
      if (t()) {
        a._initData();
        f.H && a.od();
        a.td(b);
        a.T = E
      }
    };
    a._trackTrans = function () {
      var b = a.f,
      h = [],
      v,
      z,
      D;
      a._initData();
      if (a.j && a.X()) {
        for (v = 0; v < a.j.oa[q]; v++) {
          z = a.j.oa[v];
          F.l(h, z.Va());
          for (D = 0; D < z.ha[q]; D++) F.l(h, z.ha[D].Va())
        }
        for (v = 0; v < h[q]; v++) y.V(h[v], a.F, b, c)
      }
    };
    a._setTrans = function () {
      var b = f.b,
      h, v, z;
      b = b.getElementById ? b.getElementById("utmtrans") : b.utmform && b.utmform.utmtrans ? b.utmform.utmtrans : k;
      a._initData();
      if (b && b.value) {
        a.j = new F.z;
        z = p(b.value, "UTM:");
        f.I = !f.I || "" == f.I ? "|" : f.I;
        for (b = 0; b < z[q]; b++) {
          z[b] = A(z[b]);
          h = p(z[b], f.I);
          for (v = 0; v < h[q]; v++) h[v] = A(h[v]);
          if ("T" == h[0]) a._addTrans(h[1], h[2], h[3], h[4], h[5], h[6], h[7], h[8]);
          else "I" == h[0] && a._addItem(h[1], h[2], h[3], h[4], h[5], h[6])
        }
      }
    };
    a._addTrans = function (b, h, v, z, D, I, K, M) {
      a.j = a.j ? a.j : new F.z;
      return a.j.vc(b, h, v, z, D, I, K, M)
    };
    a._addItem = function (b, h, v, z, D, I) {
      var K;
      a.j = a.j ? a.j : new F.z;
      (K = a.j.Kb(b)) || (K = a._addTrans(b, "", "", "", "", "", "", ""));
      K.uc(h, v, z, D, I)
    };
    a._setVar = function (b) {
      if (b && "" != b && i()) {
        a._initData();
        B.nd(x(b));
        a.X() && y.V("&utmt=var", a.F, a.f)
      }
    };
    a._setCustomVar = function (b, h, v, z) {
      a._initData();
      return h && v && B.ld(b, x(h), x(v), z)
    };
    a._deleteCustomVar = function (b) {
      a._initData();
      B.Bc(b)
    };
    a._getCustomVar = function (b) {
      a.initData();
      B.Mc(b)
    };
    a._setMaxCustomVariables = function (b) {
      f.Tb = b
    };
    a._link = function (b, h) {
      if (f.M && b) {
        a._initData();
        f.b.location.href = a._getLinkerUrl(b, h)
      }
    };
    a._linkByPost = function (b, h) {
      if (f.M && b && b.action) {
        a._initData();
        b.action = a._getLinkerUrl(b.action, h)
      }
    };
    a._setXKey = function (b, h, v) {
      a.k._setKey(b, h, v)
    };
    a._setXValue = function (b, h, v) {
      a.k._setValue(b, h, v)
    };
    a._getXKey = function (b, h) {
      return a.k._getKey(b, h)
    };
    a._getXValue = function (b, h) {
      return a.k.getValue(b, h)
    };
    a._clearXKey = function (b) {
      a.k._clearKey(b)
    };
    a._clearXValue = function (b) {
      a.k._clearValue(b)
    };
    a._createXObj = function () {
      a._initData();
      return new F.da
    };
    a._sendXEvent = function (b) {
      var h = "";
      a._initData();
      if (a.X()) {
        h += "&utmt=event&utme=" + x(a.k.jd(b)) + a.Oa();
        y.V(h, a.F, a.f, E, c)
      }
    };
    a._createEventTracker = function (b) {
      a._initData();
      return new F.oc(b, a)
    };
    a._trackEvent = function (b, h, v, z) {
      var D = a.Eb;
      if (k != b && k != h && "" != b && "" != h) {
        D._clearKey(5);
        D._clearValue(5);
        (b = D._setKey(5, 1, b) && D._setKey(5, 2, h) && (k == v || D._setKey(5, 3, v)) && (k == z || D._setValue(5, 1, z))) && a._sendXEvent(D)
      } else b = E;
      return b
    };
    a.ud = function (b, h, v) {
      a._initData();
      if (a.X()) {
        var z = new F.da;
        z._setKey(6, 1, h.href);
        var D = v ?
        function () {
          a.Fb(b, h)
        } : undefined;
        y.V("&utmt=event&utme=" + x(z.U()) + a.Oa(), a.F, a.f, E, c, D);
        if (v) {
          var I = this;
          f.c.setTimeout(function () {
            I.Fb(b, h)
          },
          500)
        }
      }
    };
    a.Fb = function (b, h) {
      if (!b) b = f.c.event;
      var v = c;
      if (h.gatcOnclick) v = h.gatcOnclick(b);
      if (v || typeof v == "undefined") if (!h.target || h.target == "_self") f.c.location = h.href;
      else if (h.target == "_top") f.c.top.document.location = h.href;
      else if (h.target == "_parent") f.c.parent.document.location = h.href
    };
    a.yc = function (b) {
      if (!b) b = f.c.event;
      var h = b.shiftKey || b.ctrlKey || b.altKey;
      if (!h) if (b.modifiers && f.c.Event) h = b.modifiers & f.c.Event.CONTROL_MASK || b.modifiers & f.c.Event.SHIFT_MASK || b.modifiers & f.c.Event.ALT_MASK;
      return h
    };
    a.xd = function () {
      return f
    };
    a._setDomainName = function (b) {
      f.e = b
    };
    a._addOrganic = function (b, h) {
      f.La.splice(0, 0, new F.ib(b, h))
    };
    a._clearOrganic = function () {
      f.La = []
    };
    a._addIgnoredOrganic = function (b) {
      F.l(f.Ka, b)
    };
    a._clearIgnoredOrganic = function () {
      f.Ka = []
    };
    a._addIgnoredRef = function (b) {
      F.l(f.Na, b)
    };
    a._clearIgnoredRef = function () {
      f.Na = []
    };
    a._setAllowHash = function (b) {
      f.sb = b ? 1 : 0
    };
    a._setCampaignTrack = function (b) {
      f.ta = b ? 1 : 0
    };
    a._setClientInfo = function (b) {
      f.va = b ? 1 : 0
    };
    a._getClientInfo = function () {
      return f.va
    };
    a._setCookiePath = function (b) {
      f.n = b
    };
    a._setTransactionDelim = function (b) {
      f.I = b
    };
    a._setCookieTimeout = function (b) {
      f.zb = b
    };
    a._setDetectFlash = function (b) {
      f.xa = b ? 1 : 0
    };
    a._getDetectFlash = function () {
      return f.xa
    };
    a._setDetectTitle = function (b) {
      f.wa = b ? 1 : 0
    };
    a._getDetectTitle = function () {
      return f.wa
    };
    a._setLocalGifPath = function (b) {
      f.Ea = b
    };
    a._getLocalGifPath = function () {
      return f.Ea
    };
    a._setLocalServerMode = function () {
      f.W = 0
    };
    a._setRemoteServerMode = function () {
      f.W = 1
    };
    a._setLocalRemoteServerMode = function () {
      f.W = 2
    };
    a._getServiceMode = function () {
      return f.W
    };
    a._setSampleRate = function (b) {
      f.ja = b
    };
    a._setSessionTimeout = function (b) {
      f.Xb = b
    };
    a._setAllowLinker = function (b) {
      f.M = b ? 1 : 0
    };
    a._setAllowAnchor = function (b) {
      f.sa = b ? 1 : 0
    };
    a._setCampNameKey = function (b) {
      f.jb = b
    };
    a._setCampContentKey = function (b) {
      f.kb = b
    };
    a._setCampIdKey = function (b) {
      f.lb = b
    };
    a._setCampMediumKey = function (b) {
      f.mb = b
    };
    a._setCampNOKey = function (b) {
      f.nb = b
    };
    a._setCampSourceKey = function (b) {
      f.ob = b
    };
    a._setCampTermKey = function (b) {
      f.pb = b
    };
    a._setCampCIdKey = function (b) {
      f.qb = b
    };
    a._getAccount = function () {
      return a.F
    };
    a._setAccount = function (b) {
      a.F = b
    };
    a._setNamespace = function (b) {
      f.A = b ? x(b) : undefined
    };
    a._getVersion = function () {
      return "4.5.6"
    };
    a._setAutoTrackOutbound = function (b) {
      f.H = [];
      if (b) f.H = b
    };
    a._setTrackOutboundSubdomains = function (b) {
      f.Ob = b
    };
    a._setHrefExamineLimit = function (b) {
      f.Ia = b
    };
    a._setReferrerOverride = function (b) {
      a.Cb = b
    };
    a._setCookiePersistence = function (b) {
      F.G = b
    }
  };
  F._getTracker = function (g, l) {
    return new F.qc(g, l)
  };
})()
