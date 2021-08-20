\version "2.18.2"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##t
}

\header{
  title = "Sinfonie No. 8 G-Dur"
  subtitle = ""
  composerShort = "Antonin Dvorák"
  composer = "Antonin Dvorák (1841 - 1904)"
  tagline = "Op. 88"
}

% Adapt this for automatic line-breaks
% mBreak = {}
mBreak = { \break }
#(set-global-staff-size 17)

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
pMoltoCresc = _\markup { \dynamic p \italic "molto cresc." }
stringendo = ^\markup { \italic "stringendo" }
allargando = _\markup { \italic "allargando" }
pocoMenoMosso = ^\markup {\italic \bold {"Poco meno mosso."} }
rit = _\markup {\italic {"rit."} }
solo = ^\markup { "Solo" }
piuF = _\markup { \italic "più" \dynamic f }
piuTranquillo = ^\markup { \italic "Più tranquillo" }
accel = ^\markup { \bold { "accel." } }
tempoPrimo = ^\markup { \bold { "Tempo I" } }

% Adapted from http://lsr.di.unimi.it/LSR/Snippet?id=655
% Make title, subtitle, instrument appear on pages other than the first
#(define (part-not-first-page layout props arg)
   (if (not (= (chain-assoc-get 'page:page-number props -1)
               (ly:output-def-lookup layout 'first-page-number)))
       (interpret-markup layout props arg)
       empty-stencil))

\paper {
  oddHeaderMarkup = \markup
  \fill-line {
    " "
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:composerShort
      "     -     "
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:instrument
    }
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
  }
  evenHeaderMarkup = \markup
  \fill-line {
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:composerShort
      "     -     "
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:instrument
    }
    " "
  }
  % markup-system-spacing.basic-distance = #12
  % markup-system-spacing.minimum-distance = #12
  % markup-system-spacing.padding = #10
  
}

% ---------------------------------------------------------

clarinet_II_AllegroConBrio = {
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \defaultTimeSignature
  \time 4/4
  \tempo "Allegro con brio"
  \key b \major
  \relative c' {
    % m1 page 1 line 1
    f2( \p \< f4 f4 |
    b2. \> as4 |
    f2) \! ges4( es |
    des4 \< f as4. g8 |
    f2 \> \tuplet 3/2 { es4 ges f } |
    des2) \p r4 des \pp |
    \mBreak

    % m1 page 1 line 2
    des2 des4 des |
    des2.( es8 \< f |
    ges4 ges-- ges--  \! ges-- |
    ges2 \> as2 |
    ges2) r4 \! ges \pp |
    ges2( ges4-- ges-- |
    ges2 f4 es) |
    \mBreak

    % m1 page 1 line 3
    des2( es |
    f1~) \dim |
    f1~ \> |
    f1~ \ppp |
    f4 r4 r2 |
    R1*9 |
    \mark 1
    f8 \pp r8 f8[ r16 c] f8 r8 r8 c |
    \mBreak

    % m1 page 1 line 4
    f8 r8 f8[ r16 c] f8 r8 r8 c |
    f8 \cresc r8 \! f8[ r16 c] f8 r8 r8 c |
    f8 r8 f8[ r16 c] f8 r8 r8 c |
    f8 r8 f8[ r16 c] f8 r8 r8 c |
    \mBreak

    % m1 page 1 line 5
    a'1~ \fz \startTrillSpan |
    a1~ |
    a1 \stopTrillSpan |
    a8 es'-. \ff g-. c,-. es-. r8 r4 |
    r8 c-. \f es-. g,-. c-. f-. r4 |
    r4 f,8 \f r8 r2 |
    \mark #2 
    R1*3 |
    b,2.( \p g8 b8 ) |
    b1~ |
    \mBreak

    % m1 page 1 line 6
    b2. es8-.( f-.) |
    g4 \cresc g2 \!  es8( \< f |
    g8) g-. \! g2 \f \tuplet 3/2 { es8( f g) } |
    g4. \f r8 a4. r8 |
    d8-. \f a16( c b8) fis16( a g8) d16( f es8) \tuplet 3/2 { c'16([ es g)] } |
    \mBreak

    % m1 page 1 line 7
    g8-. \piuF g-. g-. f16( \< g a8) \f a-. a-. gis16( \< a |
    d8) c,16( \! es d8) a16( c b8) f16( as g8) r8 |
    des'8-. \ff des-. des-. r8 r2 |
    des8-. des-. des-. r8 r2 |
    \mBreak

    % m1 page 1 line 8
    d8 \f r r4 d8 r r4 |
    d8 r e r e r e r |
    f4. r8 b,4 r |
    c8 r r4 a8-. a-. b-. c-. |
    \mark #3
    b2 \ff b2 |
    \mBreak

    % m1 page 1 line 9
    d8 r d r d r d r |
    d8 r d r r4 b8 r |
    d8 r8 r4 r2 |
    r2 r4 cis8. \ff \> d16 |
    f2~ f8 r8 \! r4 |
    R1*9 |
    \mBreak

    % m1 page 2 line 1
    <<
      {
       \override MultiMeasureRest.staff-position = #-6
        R1*4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Cl.I"
        \stemDown {
          r4 c16( c' g c, c'8 c,) r4 |
          r2 r4 \tuplet 3/2 { c8( g' c, } |
          c'8 c,) r4 r4 \tuplet 3/2 { c8( g' c, } |
          c'8 c,) r4 r8 c4.~ |
        }
      }
    >>
    r4 a,4( \pp b8) r r4 |
    \mark #4
    f''2.-> \fz \> f,8[ \p r16 f] |  
    \mBreak

    % m1 page 2 line 2
    f'2.-> \fz \> f,8[ \p r16 f] |
    f'4( \fz e8 \> d cis b a g) |
    f2~ \p f8 r8 f8[ \p r16 f] |
    f'2.-> \fz \> f,8[ \! r16 f] |
    f'2.-> \fz f,8[ r16 f] |
    \mBreak

    % m1 page 2 line 3
    f'4( \fz \< e8 d g,4 \> \slashedGrace b8 a8. g16) | 
    f2~ \! f8 r r4 |
    R1*10 |
    <<
      {
       \override MultiMeasureRest.staff-position = #-6
        R1*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \clef bass
        \set instrumentCueName = "Fag"
        \stemDown {
          r2 r4 <fis, ais> |
          <ais cis>( <gis h> \tuplet 3/2 { <h dis> <ais cis> <cis! es>) } |
        }
        \clef violin
      }
    >>
    \mark #5
    d'2( \pp cis |
    eis2 d) |
    \mBreak

    % m1 page 2 line 4
    d1( \< |
    fis4) g( \> a8 gis fis e) |
    a1 \f |
    h1 |
    d,1-^~ \ff |
    d2. cis4 |
    d4( cis8 h a g fis e) |
    \acciaccatura d8 d'2. cis4 |
    \mBreak

    % m1 page 2 line 5
    d4( cis8 h a g fis e) |
    \acciaccatura d8 d'2. cis4 |
    d4 r8 g fis4 r8 g |
    fis4 r8 g fis4 r8 g |
    d1~ \ff \startTrillSpan |
    d1~ |
    \mBreak

    % m1 page 2 line 6
    d1~ |
    \afterGrace d1 \stopTrillSpan { cis16( d16 } |
    a'8) r r4 r2 |
    R1*5 |
    f,,1~ \p |
    f1~ |
    f1~ |
    f1~ |
    f4 r r2 |
    R1 |
    \bar "||"
    \mBreak

    % m1 page 2 line 7
    \mark #6
    f'2( \p \< f4 f |
    b2. \> as4) \! |
    f2( ges4 es |
    des4 \< f as4. ges8) \! |
    f2( \tuplet 3/2 { es4 \> ges f } |
    des2) \p r4 des |
    des2 \pp des4 des |
    \mBreak

    % m1 page 2 line 8
    des2.( es8 f) |
    ges4--( \< ges4-- ges4-- ges4--) |
    ges2 \> as |
    ges2 \! r4 ges |
    ges2( ges4 \dim ges \! |
    ges2 f4 es |
    des2 es |
    f1~) \> |
    f1~ |
    \mBreak

    % m1 page 2 line 9
    f1~ \pp |
    f4 r4 r2 |
    R1*8 |
    <<
      {
       \override MultiMeasureRest.staff-position = #-6
        R1*3 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Ob."
        \stemDown {
          ges'4( es c es8 fis |
          ges2) r2 |
          ges8-. ges-. es4( c es8 ges) |
        }
      }
    >>
    \mark #7
    c,1 \ff
    as,2-> \mf c-> |
    es2.->~ \dim es8 \! r8 |
    \mBreak

    % m1 page 2 line 10
    R1*6 |
    <<
      {
       \override MultiMeasureRest.staff-position = #-6
        R1*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \clef bass
        \set instrumentCueName = "Fag"
        \stemDown {
          <cis, eis>2 <eis! gis> |
          <gis b>8[ r16 <eis gis!>16] <ais cis>8[ r16 <eis gis>16] <gis b>8[ r16 <eis gis>16] <ais cis>8[ r16 <eis gis>16] |
        }
        \clef violin
      }
    >>
    r2 h''4( \ff gis) |
    R1 |
    r2 r4 r8. gis16( \f |
    d'4 h gis h8. cis16) |
    \mBreak

    % m1 page 2 line 11
    d4( h gis \dim h8. \! cis16) |
    d4( \p \> gis,8 h d4 gis,8 h) |
    d4( \pp gis,8 h d4) \tuplet 3/2 { e,8( gis? h) } |
    \mark #8
    a2-> \p e-> |
    cis2. e8-.( a-.) | 
    \mBreak

    % m1 page 3 line 1
    h4--( h-- h-- h--) |
    h2. a8( h) |
    cis4--( cis-- cis-- cis--) |
    cis2. \p a8-. \< h-. |
    cis-.( a-.8 h-. cis4-. \! a8-. h-.) |
    cis4( \< ais dis \> cis) |
    \mBreak

    % m1 page 3 line 2
    h4( \p h,2.~ \dim) |
    h1~ \pp |
    h1~ |
    h1~ |
    h1 |
    R1 |
    \mark #9
    R1*2 |
    b'?8 \f r as r g4.( as16 \< b |
    ces8) \fz ces-. ces-. b-. a2 |
    \mBreak

    % m1 page 3 line 3
    b2 \ff ces8 r b r |
    a4.( \< b16 c des8) \fz des-. des-. c-. |
    as8 \ff r8 r4 r2 |
    R1*7 |
    \mark #10 |
    fis'8 \ff fis fis fis r2 |
    fis8 fis fis fis r2 |
    \mBreak

    % m1 page 3 line 4
    fis8 fis fis fis r2 |
    g1~-^ \fff |
    g1 |
    R1*8 |
    r4 fis,8( \ff g) r4 fis8( g) |
    r4 fis8( g) r4 fis8( g) |
    r4 es'-. \ff es-. es-. |
    e4-. e-. e-. e-. |
    \mBreak

    % m1 page 3 line 5
    des2~ \ff des8 r8 r4 |
    R1*13 |
    <<
      {
       \override MultiMeasureRest.staff-position = #-6
        R1*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \clef bass
        \set instrumentCueName = "Timp"
        \stemDown {
          d,,1~ \startTrillSpan |
          d1 \stopTrillSpan |
        }
        \clef violin
      }
    >>
    \mark #11
    f''1~ \ff \> |
    f1~ |
    f4 \! r4 r2 |
    R1 |
    \bar "||" \pocoMenoMosso
    R1*2
    <<
      {
       \override MultiMeasureRest.staff-position = #-6
        R1*4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Cl.I"
        \stemDown {
          b,2( d |
          f8[ r16 d] g8[ r16 d] f8[ r16 d] g8[ r16 d]) |
          \mBreak
          % m1 page 3 line 6
          f4( d2.~) |
          d8([ r16 b] g8[ r16 b] d8[ r16 b] g8[ r16 b]) |
        }
      }
    >>
    b1 \pp |
    b1~ |
    b1 |
    des1~ |
    des1~ |
    des1~ |
    des4 \tempoPrimo r4 r2 |
    R1*2 |
    \mBreak

    % m1 page 3 line 7
    r2 r4 f,8[ \p \< r16 f(] |
    \mark #12
    des'2.) \fz \> des,8[ \! r16 des(] \< |
    des'2.) \fz \> des,8[ \! r16 des(] \< |
    des'4)( \fz c8 \> b a4 ges8 f) |
    des2~ \pp des8 r des[ r16 des(] \< |
    des'2.) \fz \> des,8[ \! r16 des(] |
    \mBreak

    % m1 page 3 line 8
    des'2.) \fz des,8[ \< r16 des] |
    des'4( \> c8 b a4 \slashedGrace ges8 f8. es16) |
    des2~ \p des8 r8 r4 |
    ges8( \f es) ges( \> es) \! r4 r8 f \p |
    ges8( es) r4 r4 r8 ges8 |
    \mBreak

    % m1 page 3 line 9
    g8( \f e) g( e) r4 r8 fis \p |
    g8( e) r4 r4 r8 fis |
    g8( e) g( e) r4 r8 fis \f |
    h8( \< g) h( g) r4 \! r8 fis |
    \mBreak

    % m1 page 3 line 10
    b8( g) r4 b8( g) r4 |
    b8( g) r4 as8( des) r4 |
    R1*4 |
    \mark #13
    b2( \pp a |
    c2 b~ |
    b4) r4 r2 |
    R1 |
    \mBreak

    % m1 page 4 line 1
    \mBreak

    % m1 page 4 line 2
    \mBreak

    % m1 page 4 line 3
    \mBreak

    % m1 page 4 line 4
    \mBreak

    % m1 page 4 line 5
    \mBreak

    % m1 page 4 line 6
    \mBreak

    % m1 page 4 line 7
    \bar "|."
  }
}

clarinet_II_AllegroNonTroppo = {
  \defaultTimeSignature
  \time 2/4
  \tempo "Allegro non troppo"
  \key b \major
  \relative c'' {
    % m4 page 1 line 1
    \mBreak

    % m4 page 1 line 2
    \mBreak

    % m4 page 1 line 3
    \mBreak

    % m4 page 1 line 4
    \mBreak

    % m4 page 1 line 5
    \mBreak

    % m4 page 1 line 6
    \mBreak

    % m4 page 1 line 7
    \mBreak

    % m4 page 2 line 1
    \mBreak

    % m4 page 2 line 2
    \mBreak

    % m4 page 2 line 3
    \mBreak

    % m4 page 2 line 4
    \mBreak

    % m4 page 2 line 5
    \mBreak

    % m4 page 2 line 6
    \mBreak

    % m4 page 2 line 7
    \mBreak

    % m4 page 2 line 8
    \mBreak

    % m4 page 2 line 9
    \mBreak

    % m4 page 2 line 10
    \mBreak

    % m4 page 2 line 11
    \mBreak

    % m4 page 2 line 12
    \mBreak

    % m4 page 3 line 1
    \mBreak

    % m4 page 3 line 2
    \mBreak

    % m4 page 3 line 3
    \mBreak

    % m4 page 3 line 4
    \mBreak

    % m4 page 3 line 5
    \mBreak

    % m4 page 3 line 6
    \mBreak

    % m4 page 3 line 7
    \mBreak

    % m4 page 3 line 8
    \mBreak

    % m4 page 3 line 9
    \mBreak

    % m4 page 3 line 10
    \mBreak

    % m4 page 3 line 11
    \bar "|."
  }
}

\bookpart {
  \header{
    instrument = "Klarinette II in A"
  }
  \score {
    \transpose a a \clarinet_II_AllegroConBrio
  }
  \score {
    \transpose a a \clarinet_II_AllegroNonTroppo
  }
}
