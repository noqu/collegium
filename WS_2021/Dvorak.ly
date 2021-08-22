\version "2.18.2"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##f
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
#(set-global-staff-size 19)

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
ffz = _\markup { \dynamic { ffz } } 
pMoltoCresc = _\markup { \dynamic p \italic "molto cresc." }
stringendo = ^\markup { \italic "stringendo" }
allargando = _\markup { \italic "allargando" }
pocoMenoMosso = ^\markup {\italic \bold {"Poco meno mosso."} }
rit = ^\markup {\italic {"rit."} }
ritATempo = ^\markup { \center-align \italic {"  rit. a tempo"} }
moltoRit = ^\markup { \italic {"molto rit."} }
pocoRit = ^\markup {\italic {"poco rit."} }
solo = ^\markup { "Solo" }
piuF = _\markup { \italic "più" \dynamic f }
piuAnimato = ^\markup { \italic "Più animato" }
accel = ^\markup { \bold { "accel." } }
tempoPrimo = ^\markup { \italic { "Tempo I" } }

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
  \tempo "Allegro con brio."
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
    f8[ r16 c] f8 r8 f8[ r16 c] f8 r8  |
    f8[ r16 c] f8 r8 f8[ r16 c] f8 r8  |
    \mBreak

    % m1 page 1 line 5
    a1~ \fz \startTrillSpan |
    a1~ |
    a1 \stopTrillSpan |
    a8 es'-. \ff g-. c,-. es-. r8 r4 |
    r8 c-. \f es-. g,-. c-. f,-. r4 |
    r4 f8 \f r8 r2 |
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
          c'8 cis,) r4 r8 cis4.( \grace s8) |
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
    cis4-.( a8-. h-. cis4-. \! a8-. h-.) |
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
    r4 e'-. \ff e-. e-. |
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
    f4 r4 \! r2 |
    R1 |
    \bar "||" 
    \grace s8 \pocoMenoMosso
    R1 *2 
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
    des2~ \pp des8 r des[ r16 \< des(] |
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
    d2( \ff c) |
    es2( d) |
    f4-. e-. g-. f-. |
    b4 g2-> es4 |
    b2-> es-> |
    b'4 g2-> es4 |
    b2-> es-> |
    b'4 g2-> es4 |
    d4 r8 es d4 r8 es |
    \mBreak

    % m1 page 4 line 2
    d4 r8 es d4 r8 es |
    \mark #14
    b8[ \ff r16 d] d8[ r16 d] d2 |
    d8[ r16 d] d8[ r16 d] d2 |
    \repeat unfold 4 { d8[ r16 d] } |
    \mBreak

    % m1 page 4 line 3
    \repeat unfold 4 { d8[ r16 d] } |
    \tuplet 6/4 { b2.:8 } \ff \tuplet 6/4 { b2.:8 } |
    \tuplet 6/4 { b2.:8 } \tuplet 6/4 { b2.:8 } |
    \tuplet 6/4 { b2.:8 } \tuplet 6/4 { b2.:8 } |
    \tuplet 6/4 { b2.:8 } \tuplet 6/4 { b2.:8 } |
    d1-^ \ff |
    e1-^ |
    f2 fis |
    \mBreak

    % m1 page 4 line 4
    g4 as2 a4 |
    b8 r ges-. ges-. ces-. \fz ges-. ges-. es-. |
    b'8 r ges-. ges-. es'?-. \fz ces-. ces-. es,-. |
    d8 r8 r4 r2 |
    R1 |
    r2 r4 es4 \ff |
    \mBreak

    % m1 page 4 line 5
    d8[ r16 e,] f8[ r16 d] d'8[ r16 a] b8[ r16 f] |
    f'8[ r16 cis] d8[ r16 b] f'4 f8[ r16 f]  |
    f4 a8[ r16 a] a4 a \ff |
    f4 a8[ r16 a] a4 a |
    \mBreak

    % m1 page 4 line 6
    f4 a8[ r16 a] a4 a |
    a1~ \startTrillSpan |
    a1 \stopTrillSpan |
    b,16( c b) r \repeat unfold 3 { b( c b) r } |
    \repeat unfold 4 { d( es d) r } |
    \mBreak

    % m1 page 4 line 7
    d8 r d16( es d) r d8 r d16( es d) r |
    d8 r d16( es d) r d8 r d16( es d) r |
    d8 r d r d r d r |
    d8 r8 r4 r2 |
    \bar "|."
  }
}

clarinet_II_AllegroNonTroppo_A_start = {
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \defaultTimeSignature
  \time 2/4
  \tempo "Allegro non troppo"
  \key b \major
  \relative c {
    % m4 page 1 line 1
    R2*16 |
    R2 \fermataMarkup |
    f2~ \pp
    f2~ |
    f8 r r4 |
    R2*5 |
    \mark #1
    \repeat volta 2 {
      R2*8 | 
    }
    \repeat volta 2 {
      R2*7 | 
    }
    \alternative {
      { R2 | }
      { R2 | }
    }
    \mBreak

    % m4 page 1 line 2
    \mark #2
    \repeat volta 2 {
      R2*8 |
    }
    \repeat volta 2 {
      R2*4 |
      <<
        {
         \override MultiMeasureRest.staff-position = #-6
          R2*4 |
          \revert MultiMeasureRest.staff-position
        }
        \new CueVoice {
          \set instrumentCueName = "Vl.I"
          \stemDown {
            d''16( es32 f g a b c) d8. c16 |
            b8. a16 g8. f16 |
            es8 c' b a |
            g16( b) a-. f-. g8 r |
          }
        }
      >>
    }
    \mark #3
    d8 \ff r d r |
    d4. d8 |
    \mBreak

    % m4 page 1 line 3
    d8 c16 d es8 c |
    d8 c16 d es8 c |
    b16-. \< d-. e-. f-. ges-. as-. b-. c-. |
    des4. \trill \! \ffz c8 \prall |
    b2 \trill |
    f8-. e-. f-. r |
    \mBreak

    % m4 page 1 line 4
    d8 r d r |
    d4. d8 |
    d8 c16 d es8 c |
    d8 c16 d es8 c |
    d8 r d,16( es f fis |
    g16 \< as a b h c d es) \! |
    \mBreak

    % m4 page 1 line 5
    f16( fis) g4 \trill a8 |
    b8 es, d r |
    \mark #4 
    \repeat volta 2 {
      R2*7 |
    }
    \alternative {
      { R2 | }
      { R2 | }
    }
    \repeat volta 2 {
      R2*7 |
    }
    \alternative {
      { R2 | }
      { R2 | }
    }
    \mBreak

    % m4 page 1 line 6
    \mark #5
    d8 \ff r d r |
    d4. d8 |
    d8 c16 d es8 c |
    d8 c16 d es8 c |
    b16( \< d e f ges as b c) |
    des4. \trill \! \fz c8 \prall |
    b2 \trill |
    f8 e f r |
    \mBreak

    % m4 page 1 line 7
    d8 r d r |
    d4. d8 |
    d8 c16 d es8 c |
    d8 c16 d es8 c |
    d8 r d,16( es f fis |
    g16 \< as a b h c d es) \! |
    \mBreak

    % m4 page 2 line 1
    f16( fis) g4 \trill es8 |
    d8 d es es |
    d8 d es es |
    d8 es d8 es |
    d8 es d8 es |
    \mark #6
    d8 r8 r4 |
    R2*10 |
    \bar "||" 
    \mBreak
  }
}

clarinet_II_AllegroNonTroppo_B = {
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \key f \major
  \relative c' {
    % m4 page 2 line 2
    f4-- \mp f-- |
    f4-- r8 f |
    f8( g a g |
    f4) r8 f |
    f4 f |
    f4 r8 f |
    f8( \< g a b |
    c4) a \! |
    \mBreak

    % m4 page 2 line 3
    d,8( e f \> g |
    a4 g8 f) |
    e8( \p f g e |
    f4) r |
    r4 d8( \p f) |
    r4 d8( f) |
    r4 d8( f) |
    r4 cis8( e) |
    \mBreak

    % m4 page 2 line 4
    \repeat unfold 3 { r4 cis8( e) | }
    \repeat unfold 4 { r4 c8( es) | }
    g4 r |
    \mark #7 |
    R2*11 |
    \mBreak

    % m4 page 2 line 5
    f4 \ff f |
    f4 r8 f |
    f8( g a g |
    f4) r8 f |
    f4 f |
    f4 r8 f |
    f8( g a b |
    c4 a) |
    \mBreak

    % m4 page 2 line 6
    d,8( e f g |
    a4 g8 f) |
    e8( f g e |
    f4) r |
    \mark #8
    r4 d16( \ff f d f) |
    \repeat unfold 2 { r4 d16( f d f) | }
    \mBreak

    % m4 page 2 line 7
    \repeat unfold 4 { r4 cis16( e cis e) | }
    \repeat unfold 3 { r4 c16( es c es) | }
    \mBreak

    % m4 page 2 line 8
    r4 c16( es c es)
    g8 r r4 |
    R2*7 |
    \bar "."
    \mark #9
    \key c \major
    r8 d16( \f es d8) \< g~ |
    g8 d'16( es \! d8) r |
    R2*2 |
    r8 h?16 \ff h h8 g16 g |
    \mBreak

    % m4 page 2 line 9
    g8 d16 es d8 g |
    as2-^~ |
    as2 |
    g8 r8 r4 |
    R2*5 |
    \mark #10
    h,?4 \f h |
    h'4. h8~ |
    h8 a16( h c8) a-. |
    \mBreak

    % m4 page 2 line 10
    h8-> g-. a-> e-. |
    dis8 fis,16( g fis8) h16( c |
    h8) dis16( e dis8) r |
    e8 r r4 |
    R2*3 |
    d'2~ \ff |
    d2 |
    \mBreak

    % m4 page 2 line 11 start
    c2~ |
    c2~ |
    c2~ |
    c2 |
    \bar "."
    \mark #11
    h8 r r4 |
    R2*5 |
    \bar "||"
  }
}

clarinet_II_AllegroNonTroppo_A_end = {
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \key b \major
  \relative c {
    % m4 page 2 line 11 end
    f''2-^ \ff |
    es?2-^|
    f2 |
    es2 |
    \mBreak

    % m4 page 2 line 12
    f4-. g-. |
    f4-. b,-. |
    c4-. g-. |
    a4-. g-. |
    \mark #12
    a8 r r4 |
    R2 |
    g8 r r4 |
    R2*9 |
    <<
      {
       \override MultiMeasureRest.staff-position = #-6
        R2*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Vl.I"
        \stemUp {
          r8 a a gis16 a |
          \mBreak
          
          % m4 page 3 line 1
          c8-. fis,-. a-. es-. |
        }
      }
    >>
    r4  es4-. \pp |
    fis4-. c-. |
    d4( es |
    d4 \dim es \! |
    d4\pp \pocoRit es |
    d4 es |
    \mark #13
    \repeat volta 2 {
      d8) \tempoPrimo r8 r4 |
      R2*7 |
    }
    \mBreak

    % m4 page 3 line 2
    \repeat volta 2 {
      f4( \p \< e |
      es4 \fz \> d) |
      d4( \< b' |
      a4 \> g) |
      fis4( \f \< c' |
      h4 \> b) |
      b2\! \> |
      es,4 \p f |
      f2~ |
      f2 |
    }
    \mBreak

    % m4 page 3 line 3
    \mark #14
    \repeat volta 2 {
      R2*8 |
    }
    R2*8 \grace s16 \ritATempo |
    <<
      {
       \override MultiMeasureRest.staff-position = #-6
        R2*8 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Vl.I"
        \stemDown {
          d'4( cis |
          c4 h) |
          h( g') |
          f4( es) |
          dis4 d~ |
          d8 b( c cis) |
          es4( d |
          c4 b8) r |
        }
      }
    >>
    \mark #15
    \repeat volta 2 {
      R2*8 |
    }
    \mBreak

    % m4 page 3 line 4
    \repeat volta 2 {
      R2*8 |
    }
    \mark #16
    R2*6 |
    R2*6 \moltoRit |
    \bar "||"
    <<
      {
       \override MultiMeasureRest.staff-position = #-6
        R2*8 \tempoPrimo |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Ob."
        \stemUp {
          \repeat unfold 3 {
            g4( b |
            d2) |
          }
          g,4( b |
          d4.) d8 |
          \mBreak
          
          % m4 page 3 line 5
          g,2( |
          b2 |
          d2~ |
          d2) |
          g,2( |
          b2 \rit |
          d4. es8 |
          d2) |
        }
      }
    >>
    \mark #17
    d8 \ff \tempoPrimo r d r |
    d4. d8 |
    d8 c16 d es8 c |
    \mBreak

    % m4 page 3 line 6
    d8 c16 d es8 c |
    b16-. \< d-. e-. f-. ges-. as-. b-. c-. |
    des4. \trill \! \fz c8 \prall |
    b2 \trill |
    f8 e f f |
    d8 r d r |
    d4. d8 |
    \mBreak

    % m4 page 3 line 7
    d8 c16 d es8 c |
    d8 c16 d es8 c |
    d8 r d,16( es f fis |
    g16 \< as a b h c d es) \! |
    f16( fis) g4 \trill es8 |
    d8 c d c |
    \mBreak

    % m4 page 3 line 8
    d8 c d c |
    \mark #18
    b4( \ff \piuAnimato h |
    c4 cis) |
    d8( es e f) |
    fis8( g gis a) |
    d,2 |
    es4( e) |
    f2 |
    f4. es8 |
    \mBreak

    % m4 page 3 line 9
    d?8 r des r |
    ces8 r es r |
    d?8 r des r |
    ces8 r es r |
    d?8 r des r |
    es8 r es r |
    d?8 r des r |
    es8 r es r |
    \mBreak

    % m4 page 3 line 10
    d2 |
    des2 \rit |
    es2 |
    es2 |
    \tuplet 3/2 { d8-> \piuAnimato d b } 
    \repeat unfold 7 { \tuplet 3/2 { d8-> d b } } |
    \mBreak

    % m4 page 3 line 11
    \repeat unfold 4 { b8-. c-. d-. f,-. } |
    d'4 d8[ r16 d] |
    d8 r d r |
    d2~ |
    d2 |
    f8 r d r |
    R2
    \bar "|."
  }
}

\bookpart {
  \header{
    instrument = "Klarinette II in A"
  }
  % \score {
  %   \transpose a a \clarinet_II_AllegroConBrio
  % }
  \score {
    \new Staff {
      \transpose a a {
        \clarinet_II_AllegroNonTroppo_A_start
      }
      \transpose b b {
        \clarinet_II_AllegroNonTroppo_B
      }
      \transpose a a {
        \clarinet_II_AllegroNonTroppo_A_end
      }
    }
  }
}
