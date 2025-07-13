\version "2.24.1"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##f
    % Avoid subsitution of "Nr." by a typographic sign
    #(add-text-replacements!
    `(("Nr." . ,(format #f "N~ar." (ly:wide-char->utf-8 #x200C)))))
}

\header {
  title = "Sinfonie Nr. 6 h-Moll op.74 \"Pathetique\""
  subtitle = ""
  composerShort = "Pjotr Iljitsch Tschaikowsky"
  composer = "Pjotr Iljitsch Tschaikowsky (1840 - 1893)"
  version = "v1"
}

% Adapt this for automatic line-breaks
% mBreak = {}
% pBreak = {}
mBreak = { \break }
pBreak = { \pageBreak }
#(set-global-staff-size 18)

% Just to make it easier to add rehearsal marks
rMark = { \mark \default }

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
fCantabile = _\markup { \dynamic f \italic "cantabile" }
smorz = _\markup { \italic "smorz." }
sempreFf = _\markup { \italic "sempre" \dynamic ff }
ffSempre = _\markup { \dynamic ff \italic "sempre" }
sempreFff = _\markup { \italic "sempre" \dynamic fff }
pocoF = _\markup { \italic "poco" \dynamic f }
ffz = _\markup { \dynamic { ffz } } 
ffp = _\markup { \dynamic { ffp } } 
crescMolto = _\markup { \italic "cresc. molto" }
pMoltoCresc = _\markup { \dynamic p \italic "molto cresc." }
sempreCresc = _\markup { \italic "sempre cresc." }
ppEspr = _\markup { \dynamic pp \italic "espr." }
ppiuEspress = _\markup { \dynamic p \italic "più espress." }
pocoCresc = _\markup { \italic "poco cresc." }
espress = _\markup { \italic "espress." }
mfEspress = _\markup { \dynamic mf \italic "espress." }
pEspress = _\markup { \dynamic p \italic "espress." }
string = ^\markup { \italic "string." }
stringendo = ^\markup { \italic "stringendo" }
pocoString = ^\markup { \italic "poco string." }
sempreStringendo = ^\markup { \italic "sempre stringendo" }
sempreString = ^\markup { \italic "sempre string." }
tuttaForza = _\markup { \italic "tutta forza" }
allargando = _\markup { \italic "allargando" }
pocoMenoMosso = ^\markup {\italic \bold {"Poco meno mosso."} }
rit = ^\markup {\italic {"rit."} }
rall = ^\markup {\italic {"rall."} }
riten = ^\markup {\italic {"riten."} }
ritATempo = ^\markup { \center-align \italic {"  rit. a tempo"} }
aTempo = ^\markup { \italic {"a tempo"} }
moltoRit = ^\markup { \italic {"molto rit."} }
pocoRit = ^\markup {\italic {"poco rit."} }
pocoRiten = ^\markup {\italic {"poco riten."} }
sec = ^\markup {\italic {"sec."} }
pocoRall = ^\markup {\italic {"poco rall."} }
pocoAPocoRall = ^\markup {\italic {"poco a poco rall."} }
pocoAPocoAccel = ^\markup {\italic {"poco a poco accel."} }
pocoAPocoAccelAlD = ^\markup {\italic {"poco a poco accel. al D"} }
sempreAccel = ^\markup {\italic {"sempre accel."} }
solo = ^\markup { "Solo" }
piuF = _\markup { \italic "più" \dynamic f }
piuP = _\markup { \italic "più" \dynamic p }
lento = ^\markup { \italic "Lento" }
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
    \if \should-print-page-number \fromproperty #'page:page-number-string
  }
  evenHeaderMarkup = \markup
  \fill-line {
    \if \should-print-page-number \fromproperty #'page:page-number-string
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:composerShort
      "     -     "
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:instrument
    }
    " "
  }
  oddFooterMarkup = \markup
  \fill-line \fontsize #-2.0 {
    " "
    \fromproperty #'header:version
    " "
  }
  % Distance between title stuff and music
  markup-system-spacing.basic-distance = #4
  markup-system-spacing.minimum-distance = #4
  markup-system-spacing.padding = #4
  % Distance between music systems
  system-system-spacing.basic-distance = #13
  system-system-spacing.minimum-distance = #13
  % system-system-spacing.padding = #10
  }

\layout {
  \context {
    \Staff
    % This allows the use of \startMeasureCount and \stopMeasureCount
    % See https://lilypond.org/doc/v2.23/Documentation/snippets/repeats#repeats-numbering-groups-of-measures
    \consists #Measure_counter_engraver
    % \RemoveAllEmptyStaves
  }
}

% ---------------------------------------------------------

tschaikowsky_I_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Adagio"
  \key f \major
  \clef violin
  \relative c' {
    % cl2 p1 1
    R1*9 |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R1 |
        R1 |
        R1 |
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        r2 r4 f,8(_"Viola" g) |
        a1~ |
        a8 r r4 r4 h_"Klar.I" |
        des2.~ des8 r |
      }
    >>
    r2 r4 d |
    g,2~ g8 r8 r4 |
    R1 |
    R1 |
    R1\fermata |
    \mBreak
    
    % cl2 p1 19
    R1*4 |
    \tempo "Allegro non troppo"
    r2
    <<
      \voiceTwo
      {
        \stemUp
        f4\rest f8-.( g-.) |
      }
      \\
      \new CueVoice {
        \stemUp
        r16 a'_"Fl.I" h des s4 |
      }
    >>
    as,4( a8) r r4 f16( e f g) |
    as4( a8) r r4 r8 e' |
    r8 f r b, r c r a |
    \mBreak
    
    % cl2 p1 27
    r8 b r g8~ g r r4 |
    r4 r8 g8~ g b~ b r |
    R1 |
    \time 2/4
    R2 |
    \rMark
    \time 4/4
    R1*17 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        \override MultiMeasureRest.staff-position = #-8
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceOne \stemUp 
        s2 s8 e'(^"Klar.I" d c |
        h) a( g fis e) d( c h) |
      }
    >>
    \mBreak
    
    % cl2 p1 50
    \rMark
    <<
      \voiceTwo {
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        R1 |
        R1 |
        R1 |
        r2 r16 g''-. g-. g-. g-. g-. e-. e-. |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceOne \stemUp
        h16( c h c h c h c) h8 r r4 |
        r2 r8 e(^"Fl." g h) |
        es,8-.( ges-.) h4~ h8 r8 r4 |
        r2 r8 e,( g h) |
        es,8-.( ges-.) h4~ h8 s8 s4 |
      }
    >>
    d,8-- g,-- ges-- r r16 c-. c-. c-. c-. c-. a-. a-. |
    \mBreak
    
    % cl2 p1 56
    g8-- e-- d-- r r16 d-. d-. d-. d( h') g-. g-. |
    ges8-- ges'-- b,-- r r16 e-. e-. e-. e-. e-. des-. des-. |
    h8-- g-- ges-- r r2 |
    R1*3 |
    \mBreak
    
    % cl2 p1 62
    r2 r16 d'-. d-. d-. d-. d-. h-. h-. |
    \rMark
    a8-- es-- des-- r r16 g-. g-. g-. g-. g-. e-. e-. |
    d8-- h-- a-- r r16 d'-. d-. d-. d( ges) d-. d-. |
    \mBreak
    
    % cl2 p1 65
    des8-- g,-- f-- r r16 h-. h-. h-. h-. h-. as-. as-. |
    ges8-- d-- des-- r r16 fis fis fis fis( a) as fis |
    \tempo "Un poco animando"
    f2( ges8) r r4 |
    r2 r16 a a a a( c) h a |
    \mBreak
    
    % cl2 p1 69
    as2( a8) r r4 |
    r2 r4 r16 es''( d c) |
    as16( g f es) d( c as g) r4 r16 es''( d c) |
    as16( g f es) d( c as g) r4 c'16( es d c) |
    \mBreak
    
    % cl2 p1 73
    \tempo "Un poco più animato"
    r4 c,16( es d c) r4 c'16( es d c) |
    r4 c,16( es d c) ges,4( g8) r |
    ges4( g8) r es4( e8) r |
    es4( e8) r r2 |
    \mBreak
    
    % cl2 p1 77
    \rMark
    r2 e4~ e8 r |
    e4~ e8 r r4 e~ |
    e4~ e8 r r4 e4~ |
    e8 r r4 r2 |
    R1*3 |
    R1*3 |
    R1 |
    R1\fermata |
    \mBreak

    % cl2 p2 89
    \tempo "Andante"
    <<
      \voiceTwo {
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        R1 |
        R1 |
        \stemUp
        r2 g( |
        f8) r r4 ges2 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceOne \stemUp
        r2 r8 a''( g f) |
        d8( c a c) f4.( d8) |
        c2~ c8 a'( g f) |
        c8( a f a) s2 |
        s1 |
      }
    >>
    g,2 e |
    f2 a'~ |
    a8 r r4 r2 |
    r2 ges, |
    g2 e |
    \mBreak
    
    % cl2 p2 99
    f2 a'~ |
    a8 r r4 r2 |
    \bar "||"
    \tempo "Moderato mosso"
    R1*5 |
    a,4~ \tuplet 3/2 { a8 h( des } \tuplet 3/2 { d) d-.( e-.) } \tuplet 3/2 { f16( g a } \tuplet 3/2 { h c des } |
    d8) r r4 r2 |
    R1 |
    \mBreak
    
    % cl2 p2 109
    \rMark
    R1*5 |
    e,,4~ \tuplet 3/2 { e8 fis( as } \tuplet 3/2 { a) a--( h--) } \tuplet 3/2 { c16( d e } \tuplet 3/2 { fis g as } |
    a8) r r4 r2 |
    R1 |
    \rMark
    d,4~ \tuplet 3/2 { d8 e( fis } \tuplet 3/2 { g) g--( a-- } \tuplet 3/2 { h-- c-- des--) } |
    \mBreak
    
    % cl2 p2 118
    d4~( d16 h g d h8) r r4 |
    d4~ \tuplet 3/2 { d8 e( fis } \tuplet 3/2 { g) g--( a-- } \tuplet 3/2 { b-- c-- des--) } |
    d4~( d16 b g d b8) r r4 |
    R1 |
    \mBreak
    
    % cl2 p2 122
    c'4~( c16 g f c) g''4~( g16 c, g e) |
    d2 \tuplet 6/4 { d16( e d e d des } d8) r |
    r2 f'4~( f16 c f, c) |
    r8 f'~( f16 c a c,) r8 f'~( f16 c f, c) |
    \mBreak
    
    % cl2 p2 126
    r8 b''~( b16 e, b e,) r8 b''~( b16 e, b e,) |
    r4 b'( a g) |
    f4( e2) d4( |
    des2 c4~ c8) r\fermata |
    \bar "||" 
    \mBreak
    
    % cl2 p2 130
    \tempo "Andante"
    \time 12/8
    r8 a a a a a a4.~ a8 r r |
    r8 f' f f f f r d d d d f |
    r8 f f f f f f r r r4 r8 |
    r8 c c c c c r g' g g g g |
    \mBreak
    
    % cl2 p2 134
    r8 a a a a r c2. |
    b8 b b b b b b2. |
    a8 a a a a a d,2. |
    c8 c c c c c e2.
    \mBreak
    
    % cl2 p2 138
    r8 a a a a r c2. |
    b8 b b b b b b2. |
    a8 a a a a a d,2. |
    c8 c c c c c e2.
    \mBreak
    
    % cl2 p2 142
    \tempo "Moderato assai"
    r8 f f f f f f4. ges |
    \time 4/4 
    ges4( g) d( e) |
    e4( f) f( ges) |
    g4( h) d,( e) |
    \rMark
    f4( a) f( ges) |
    ges( g) d( e) |
    \mBreak
    
    % cl2 p2 148
    e4( f) f( ges) |
    g4( h) d,( e |
    f8) r r4 r2 |
    R1
    R1*2 |
    \tempo "Adagio mosso"
    R1*4 |
    <<
      \voiceTwo {
        \override MultiMeasureRest.staff-position = #2
        R1 |
        R1 |
        \override MultiMeasureRest.staff-position = #4
        R1\fermata |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        c2~_"Klar.I" c8 a'( g f) |
        c2~ c8 a'( g f) |
        d8 c a f \clef bass d(_"Fag.I" b g e)\fermata | \clef violin
      }
    >>
    \bar "||"
    \mBreak
    
    % cl2 p3 161
    \tempo "Allegro vivo"
    \key c \major
    b''''8 r r4 b,,16 b b8~ b4~ |
    b8 a as a b r r4 |
    a8 r as r r4 r8 gis |
    a8 r b r r4 b'8( ges') |
    \mBreak
    
    % cl2 p3 165
    b,8 r r4 b,16 b b8~ b4~ |
    b8 a as a b r r4 |
    a8 r b r r4 r8 b |
    a8 r g r r4 b'8( g') |
    \mBreak
    
    % cl2 p3 169
    f8 r r4 \tuplet 3/2 { f16 f f } f8~ f4~ |
    f8 g,,f g as as r4 |
    \rMark
    R1 |
    r2 r4 r8 f''~ f4. f8~ f4. f8~ |
    \mBreak
    
    % cl2 p3 174
    f8 r r4 r2 |
    r4 r8 f,( as,) r r4 |
    r4 r8 f'( as,) r r4 |
    R1 |
    d''8 r8 r4 r2 |
    R1 |
    r4 es,8-. c( b) c~ c g'~ |
    \mBreak
    
    % cl2 p3 181
    g4. g8~ g4. g8~ |
    g8 r8 r4 r2 |
    \rMark
    r4 r8 g ( b,) r r4 |
    r4 r8 g'( b,) r r4 |
    r2 r4 c16( f e c) |
    \mBreak
    
    % cl2 p3 186
    d16( g f d) e( a g e) f( b a f e8) r |
    r2 r4 a,16( d c a) |
    b( e d b) c( f e c) d( g f d) des( as' ges des) |
    \mBreak
    
    % cl2 p3 189
    \repeat unfold 4 { des16( as' ges des) } |
    \repeat unfold 4 { des16( as' ges des) } |
    \mBreak
    
    % cl2 p3 191
    \repeat unfold 4 { des16( as' ges des) } |
    \repeat unfold 4 { ges16( h b ges) } |
    \mBreak
    
    % cl2 p3 193
    \repeat unfold 3 { ges16( h b ges) } f( b as f) |
    \repeat unfold 4 { f16( b as f) }
    \mBreak
    
    % cl2 p3 195
    \repeat unfold 4 { as16( des c as) }
    \repeat unfold 2 { f16( b as f) } \repeat unfold 2 { c( g' f c) }
    \mBreak
    
    % cl2 p3 197
    \repeat unfold 2 { as16( des c as) } f( b as f) c( g' f c) |
    \mark #11
    as16( des c as) f( b as f) c'( g' f c) as( des c as |
    f8) r r4 r2 |
    R1*5 |
    \mBreak
    
    % cl2 p4 205
    r2 \tuplet 7/4 { e''16( f g as b c des } e8) r |
    <<
      \voiceOne {
        \override MultiMeasureRest.staff-position = #2
        R1 |
        R1 |
        R1 |
        \override MultiMeasureRest.staff-position = #0
        r2 r4 r8. a,,,16 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        as2_"Pos.II" g |
        f2_"Fag.II" g4~ g8. ces16 |
        ces2 b2 |
        as2 b4~ b8. s16 |
      }
    >>
    a8 r b r r4 r8. c16 |
    \mBreak
    
    % cl2 p4 211
    c8 r des r r2 |
    R1*2 |
    \rMark
    as'4-- a-- d,-- c-- |
    d4-- a-- c-- h-- |
    e4-- a-- d,-- g-- |
    \mBreak
    
    % cl2 p4 217
    h,4-- e-- b( e8) r |
    r2 d4-- c-- |
    d4-- a-- c-- h-- |
    r4 a-- r g-- |
    r4 e-- r e-- |
    r4 e-- r e-- |
    \mBreak
    
    % cl2 p4 223
    r4 e4~ e8 r r4 |
    R1*5 |
    \rMark
    R1*9 |
    r2 e4~ e8. e16 |
    a2. ges4 |
    des'2 c |
    \mBreak
    
    % cl2 p4 241
    des2 h4.. h16 |
    ges'8 r f r ges r r4 |
    \rMark
    e16( d) d8 des16( d e d) f16( e) e8 es16( e f e) |
    \mBreak
    
    % cl2 p4 244
    g16( f) f8 a16( g) g8 b16( a) a8 r4 |
    r4 r16 a( as a) b( a) a8 r4 |
    r4 r16 a( as a) b( a) a8 a16( g) g8 |
    \mBreak
    
    % cl2 p4 247
    b16( a) a8 d,16( des) des8 e16( d) d8 a'16( g) g8 |
    b16( a g f) e( f e d des8) r r4 |
    r4 e'8 f g4 f8 r |
    \mBreak
    
    % cl2 p4 250
    r4 e8 f g4 f8 r |
    r4 g8 a b4 a8 r |
    r4 g8 a b4 a8 r |
    r4 e8 f ges( as) r4 |
    r4 e8 f ges( as) r4 |
    \mBreak
    
    % cl2 p4 255
    r4 r8 d, r e r4 |
    r4 r8 d r d r4 |
    r4 r8 c r d r4 |
    \rMark
    r4 r8 c r c r4 |
    r2 r4 es,~ |
    \mBreak
    
    % cl2 p4 260
    es4 es( d) ges,8( g |
    a8 ges) a( h c a) c( d |
    es c) es( f ges es) ges' as |
    a8 r ges r r4 \tuplet 3/2 { ges8 as a } |
    \mBreak
    
    % cl2 p4 264
    a8 r fis r r4 a8 h |
    c8 r a r8 r4 \tuplet 3/2 { a8 h c } |
    c8 r a r8 r4 \tuplet 3/2 { a8 h c } |
    \rMark
    \repeat tremolo 4 { c16( h) } c( h c gis) a( gis a f) |
    \mBreak
    
    % cl2 p5 268
    \repeat tremolo 4 { ges16( f) } ges( f ges d) es( d es h') |
    c16( h c h c h c as) a( as a as a as a f |
    ges8) r \tuplet 3/2 { ges,8 ges ges~ } ges8 ges r4 |
    R1 |
    \mBreak
    
    % cl2 p5 272
    r2 a,4. h8 |
    c2.( h8) r |
    c8 r \tuplet 3/2 { c8 c c~ } c8 c r4 |
    r4 \tuplet 3/2 { c8 c c } r4 r8 r |
    r4 c8 r r2 |
    \mBreak
    
    % cl2 p5 277
    \rMark
    R1*4 |
    h1~ |
    h1 |
    f'2 e~ |
    e2. e4 |
    a1~ |
    a1 |
    a,1~ |
    a1 |
    des1~ |
    des1
    a1~ |
    \mBreak
    
    % cl2 p5 292
    a1 |
    d2 des2~ |
    des1 |
    b2 a~ |
    a1 |
    R1 |
    \rMark
    R1 |
    f1~ |
    f2~ f8 r r4 |
    \mBreak
    
    % cl2 p5 301
    e1~ |
    e1~ |
    e1~ |
    e8 r r4 r2\fermata |
    \bar "||"
    \tempo "Andante como prima"
    \key c \major
    <<
      \voiceTwo {
        \stemUp
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        r4 ges g8( a h des) |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        r2 r8 fis'(_"Fl.III" e d) |
        h8( a) s4 s2 |
      }
    >>
    \mBreak
    
    % cl2 p5 307
    d,4 e8. f16 ges4 g8( ges) |
    a,4-- ges-- e'-- g-- |
    ges4-- e8( d) a'2 |
    g2 g |
    ges2 h, |
    \mBreak
    
    % cl2 p5 312
    a2 h'4..( a16) |
    \rMark
    \tuplet 3/2 { a16 a,( b } \tuplet 3/2 { h c des) } d32( es e f ges g as a) a4-- g8.( ges16) |
    ges4 e g-- ges8.( e16) |
    \mBreak
    
    % cl2 p5 315
    e4( d) r8 ges8( e d) |
    a8( f d' f,) h4..( a16) |
    \tempo "Tempo I"
    a2 ges' |
    g2 e |
    ges2 f4( g8 f) |
    ges2 r8 e4. |
    \mBreak
    
    % cl2 p5 321
    ges2 ges, |
    g2 e |
    ges2 f4( g8 f |
    ges8) ges4. g2( |
    \rMark
    ges8) r r4 r2 |
    \tempo "Meno"
    <<
      \voiceTwo {
        \stemUp
        \override MultiMeasureRest.staff-position = #2
        R1 |
        R1 |
        \mBreak
        
        % cl2 p5 328
        R1 |
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        r4 a_"Hr.III" as2 |
        a2~ a8 r r4 |
        a2 a |
        a2 a |
      }
    >>
    R1 |
    r2 ges |
    ges2 g |
    ges2 des'4.. d16 |
    d2 des4.. d16 |
    \bar "||"
    \tempo "Andante mosso"
    d4~ d8 r r2 |
    R1*4 |
    \mBreak
    
    % cl2 p5 340
    d2 d4. e8 |
    g8( ges~ fis2~ ges8) r |
    d2 d4. e8 |
    ges1 |
    d2.~ d8 d |
    d1 |
    \rMark
    R1*8 |
    R1\fermata
    \bar "|."
    \mBreak
  }
}

tschaikowsky_II_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 5/4
  \tempo "Allegro con grazia"
  \key f \major
  \clef violin
  \relative c' {
    % Do not count alternative bars in repeats
    \set Score.alternativeNumberingStyle = #'numbers
    \repeat volta 2 {
      % cl2 p6 1
      % Enforce repeat marking at beginning
      \bar ".|:"
      <<
        \voiceOne {
          \stemUp
          r2 r4 f'4( a,8) r |
        }
        \\
        \new CueVoice {
          \voiceTwo
          \stemDown
          a,4( b) \tuplet 3/2 { c8( b c) } s2 |
          
        }
      >>
      r2 r4 c'4( g8) r |
      r2 r4 c4( e,8) r |
      r2 r4 c'4( e,8) r |
      r2 r4 des'4( a8) r |
      \mBreak
      
      % cl2 p6 6
      r2 r4 d4( f,8) r |
      r2 r4 g'4( g,8) r |
      g'8 r8 r4 r2 r4 |
      a,,4( b) \tuplet 3/2 { c8( b c } d4 e) |
      f4( d) e2. |
      \mBreak
      
      % cl2 p6 11
      c4( d) \tuplet 3/2 { e8( d e } f4 g) |
      a4( f) g2. |
      g4( a) \tuplet 3/2 { g8( a g } f4 e) |
      d8 r16 e( d8) r16 des( d2.) |
      f4( g) \tuplet 3/2 { f8( g f } e4 d) |
      \mBreak
      
      % cl2 p6 16
      \alternative {
        \volta 1 {
          c8 r16 d( c8) r16 h( c8) r r4 r4 |
        }
        \volta 2 {
          c8 r16 d( c8) r16 h( c2~ c8) r |
        }
      }
    }
    r8 c( e g c) r r4 r4 |
    r8 c,( f a c) r r4 r4 |
    \mBreak
    
    % cl2 p6 19
    r8 c,( f a c) r r4 r4 |
    r8 c,( e g c) r r4 r4 |
    r8 c,( e g c) r r4 r4 |
    r8 c,( f a c) r r4 r4 |
    \mBreak
    
    % cl2 p6 23
    r8 e,( as h e) r r4 r4 |
    r8 a,( c e a) r r4 r4 |
    \rMark
    e,4( b') \tuplet 3/2 { b8( a b } a4 g) |
    f8-. r16 e( f8) r16 g( f2.) |
    \mBreak
    
    % cl2 p6 27
    f4( d) f( g a) |
    a8-. r16 f( g8) r16 d( g2.) |
    e4( b') b( a g) |
    f8-. r16 e( f8) r16 g( f2.) |
    c'4( h) a2.~ |
    \mBreak
    
    % cl2 p6 32
    a8 r16 a( g8) r16 d'( c4 ~c8) r r4 |
    a,4( b) \tuplet 3/2 { c8( h c } d4 e) |
    f4( d) e2. |
    c4( d) \tuplet 3/2 { e8( d e } f4 g) |
    a4( f) g2. |
    \mBreak
    
    % cl2 p6 37
    \rMark
    b4( a) \tuplet 3/2 { g8( a g } f4 e) |
    a8-. r16 b( a8) r16 as( a2.) |
    a4( g) \tuplet 3/2 { f8( g f } e4) d( |
    d'8) c-. b-. a-. g-. ges-. f-. e-. d-. des-. |
    \mBreak
    
    % cl2 p6 41
    c2~ c8 c~ c c~ c c~ |
    c2~ c8 c~ c c~ c c~ |
    c2~ c8 c~ c c~ c c~ |
    c2 e8 e~ e e~ e e |
    \mBreak
    
    % cl2 p6 45
    \rMark
    es4( c) \tuplet 3/2 { d8( c d } e4 f) |
    g4( es) f2. |
    es4( f8 f') \tuplet 3/2 { es8( d es } f4 ges) |
    g4( es) d2( es4) |
    \mBreak
    
    % cl2 p7 49
    f2 es c4 |
    des4 b c2. |
    c2 d2 h4 |
    c4 a4 h2. |
    c2~ c2. |
    c2 d8 r r4 r4 |
    R1*5/4*2 |
    \mBreak
    
    % cl2 p7 57
    \rMark
    \repeat volta 2 {
      d,2 des2. |
      d2 g,2. |
      a2 b2. |
      a2 g2( f4) |
      d'2 des2. |
      d2 g,2. |
      a2 b2. |
      a2 g2( f4) |
    }
    \mBreak
    
    % cl2 p7 65
    \rMark
    \repeat volta 2 {
      R1*5/4*5 |
      b4.( c8) des2( b4) |
      h2~ h2. |
      f''4.( g8) a2( f4) |
    }
    \rMark
    d,2 des2. |
    d2 g,2. |
    a2 b2. |
    \mBreak
    
    % cl2 p7 76
    a2 g2( f4) |
    d'2 des2. |
    d2 g,2. |
    a2 b2. |
    a2 g2( f4) |
    \rMark
    R1*5/4
    h4( des \tuplet 3/2 { d8 des d } e4 f |
    g8) r r4 r2 r4 |
    \mBreak
    
    % cl2 p7 84
    d4( e \tuplet 3/2 { f8 e f } g4 a) |
    R1*5/4
    h,4( des \tuplet 3/2 { d8 des d } e4 f |
    g8) r r4 r2 r4 |
    d4( e \tuplet 3/2 { f8 e f } g4 a) |
    b2~ b8 r r4 r4 |
    \mBreak
    
    % cl2 p7 90
    d,4( e \tuplet 3/2 { f8 e f } g4 as |
    a8) r r4 r2 r4 |
    d,4( e \tuplet 3/2 { f8 e f } g4 a) |
    b2~ b8 r r4 r4 |
    d,4( e, \tuplet 3/2 { f8 e f } g4 as |
    \mBreak
    
    % cl2 p7 95
    a8) r r4 r2 r4 |
    \rMark
    % FIXME: Duplicate of the beginning
    r2 r4 f''4( a,8) r |
    r2 r4 c4( g8) r |
    r2 r4 c4( e,8) r |
    r2 r4 c'4( e,8) r |
    r2 r4 des'4( a8) r |
    \mBreak
    
    % cl2 p7 101
    r2 r4 d4( f,8) r |
    r2 r4 g'4( g,8) r |
    g'8 r8 r4 r2 r4 |
    \rMark
    a,,4( b) \tuplet 3/2 { c8( b c } d4 e) |
    f4( d) e2. |
    \mBreak
    
    % cl2 p7 106
    c4( d) \tuplet 3/2 { e8( d e } f4 g) |
    a4( f) g2. |
    g4( a) \tuplet 3/2 { g8( a g } f4 e) |
    d8-. r16 e( d8) r16 des( d2.) |
    f4( g) \tuplet 3/2 { f8( g f } e4 d) |
    \mBreak
    
    % cl2 p7 111
    c8-. r16 d( c8) r16 h( c2~ c8) r |
    r8 c( e g c) r r4 r4 |
    r8 c,( f a c) r r4 r4 |
    r8 c,( f a c) r r4 r4 |
    \mBreak
    
    % cl2 p7 115
    r8 c,( e g c) r r4 r4 |
    r8 c,( e g c) r r4 r4 |
    r8 c,( f a c) r r4 r4 |
    r8 e,( as h e) r r4 r4 |
    r8 a,( c e a) r r4 r4 |
    \mBreak
    
    % cl2 p8 120
    \mark #11
    e,4( b') \tuplet 3/2 { b8( a b } a4 g) |
    f8-. r16 e( f8) r16 g( f2.) |
    f4( d) f( g a) |
    a8-. r16 f( g8) r16 d( g2.) |
    e4( b') b( a g) |
    \mBreak
    
    % cl2 p8 125
    f8-. r16 e( f8) r16 g( f2.) |
    c'4( h) a2.~ |
    a8 r16 a( g8) r16 d'( c4 ~c8) r r4 |
    a,4( b) \tuplet 3/2 { c8( h c } d4 e) |
    f4( d) e2. |
    \mBreak
    
    % cl2 p8 130
    c4( d) \tuplet 3/2 { e8( d e } f4 g) |
    a4( f) g2. |
    \rMark
    b4( a) \tuplet 3/2 { g8( a g } f4 e) |
    a8-. r16 b( a8) r16 as( a2.) |
    a4( g) \tuplet 3/2 { f8( g f } e4) d( |
    \mBreak
    
    % cl2 p8 135
    d'8) c-. b-. a-. g-. ges-. f-. e-. d-. des-. |
    c2~ c8 c~ c c~ c c~ |
    c2~ c8 c~ c c~ c c~ |
    c2~ c8 c~ c c~ c c~ |
    \mBreak
    
    % cl2 p8 139
    c2 e8 e~ e e~ e e |
    \rMark
    es4( c) \tuplet 3/2 { d8( c d } e4 f) |
    g4( es) f2. |
    es4( f8 f') \tuplet 3/2 { es8( d es } f4 ges) |
    g4( es) d2( es4) |
    \mBreak
    
    % cl2 p8 144
    f2 es c4 |
    des4 b c2. |
    c2 d2 h4 |
    c4 a4 h2. |
    c2~ c2. |
    c2 d8 r r4 r4 |
    R1*5/4*2 |
    \rMark
    f2 e2. |
    d2 c2. |
    \mBreak
    
    % cl2 p8 154
    b2 a2. |
    g2 f2. |
    R1*5/4*5 |
    f2~ f2. |
    R1*5/4 |
    f2~ f2. |
    \rMark
    R1*5/4*8 |
    \rMark
    R1*5/4*6 |
    R1*5/4\fermata
    \bar "|."
    \mBreak
  }
}

tschaikowsky_III_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 12/8
  \tempo "Allegro molto vivace"
  \key b \major
  \clef violin
  \relative c' {
    % c2 p8 1
    <<
      \voiceTwo {
        \stemUp
        \override MultiMeasureRest.staff-position = #-4
        R1*12/8 |
        R1*12/8 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        d'8-._"Viol.I" b-. d-. c-. h-. c-. es-. c-. es-. d-. cis-. d-. |
        es8-. f-. g-. a-. g-. f-. g-. a-. b-. a-. b-. c-. |
      }
    >>
    es,8-. a,-. es'-. a,-. es'-. a,-. es'-. b-. es-. c-. es-. c-. |
    r2. des8( d c b ges f) |
    R1*12/8*2 |
    \mBreak

    % c2 p8 7
    c'8-. ges-. c-. ges-. c-. ges-. c-. g-. c-. a-. c-. a-. |
    \rMark
    r2. a8( b a g es d) |
    R1*12/8*6 |
    \rMark
    R1*12/8*8 |
    \rMark
    R1*12/8*4
    \mBreak

    % c2 p8 27
    <<
      \voiceTwo {
        \stemUp
        \override MultiMeasureRest.staff-position = #-2
        R1*12/8 |
        R1*12/8 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        f'1*12/8~_"Ob.I" |
        f8 r s8 f8 r16 f s8 fis8 r s8 g r s8 |
      }
    >>
    f,1. |
    ges4.( g8) r r r2. |
    \rMark
    r4. b8-. des-. ges-. g-. r r r4. |
    r4. b,8-. des-. ges-. g-. r r r4. |
    \mBreak
    
    % c2 p8 33
    r4. b,,8-. des-. ges-. g-. r r r4. |
    r4. b,8-. des-. ges-. g-. r r r4. |
    r4. c,8-. f-. a-. r4. c,8-. f-. a-. |
    r4. c,8-. f-. a-. r4. c,8-. f-. a-. |
    R1*12/8*2 |
    \mBreak
    
    % c2 p9 39
    es'8-. c-. es-. a,-. es'-. a,-. c-. a-. c-. a-. es'-. a,-. |
    d8( b g b f d) r2. |
    R1*12/8*2 |
    \rMark
    es'8-. c-. es-. a,-. es'-. a,-. c-. a-. c-. a-. es'-. a,-. |
    d8( b g b f d) r2. |
    R1*12/8*1 |
    \mBreak

    % c2 p9 46
    ges4. f es des4~( des16 ces |
    b8) r r r4. r2. |
    des8( es f ges f es des) r r r4. |
    R1*12/8 |
    r2. r4. cis'8 cis cis |
    \mBreak

    % c2 p9 51
    \rMark
    a8( h des d des h a) r r r4. |
    a,8( h des d des h a) r r r4. |
    R1*12/8*2 |
    \time 4/4
    d'4 d8 r16 d g,4~ g8 r |
    \mBreak

    % c2 p9 56
    ges''4 ges8 r16 ges a,8 r r4 |
    R1*2 |
    d,4 d8 r16 d g,4~ g8 r |
    ges''4 ges8 r16 ges a,8 r r4 |
    \rMark
    d,1 |
    b1 |
    d1 |
    b1 |
    \mBreak

    % c2 p9 65
    d1 |
    es1 |
    ges1 |
    b1 |
    d,8 r d,-! e,-! f-! fis-! g-! a-! |
    b8-! h-! c-! des-! d-! e-! f-! ges-! |
    \mBreak

    % c2 p9 71
    \key c \major
    \rMark
    g8 r d r16 d g8 r d r |
    g8-. c~ c2 h8 r16 a( |
    d8) r \appoggiatura a8 g8 r16 ges-. g8-. r d r |
    g2. h8 r16 d( |
    \mBreak

    % c2 p9 75
    e8) r \appoggiatura a,8 g8 r16 ges-. g8-. r d r |
    g2~ g8 r  h8-. r16 d-. |
    g4( ges8) r16 g e4 es8 r16 e |
    c4 h8 r16 c a4( g8) r16 a( |
    \mBreak

    % c2 p9 79
    e8) r16 fis( g8) r16 h( e8) r16 ges( g8) r16 a-. |
    h2~ h8 a16( g \tuplet 6/4 { ges16 e d c h a } |
    \rMark
    g8) r r4 r2 |
    c,8 r c r16 c16 c8 r d r16 d |
    \mBreak

    % c2 p9 83
    d8 r c r16 c h8 r a r |
    g8 r g r16 g g4( g'8) r |
    des8 r c r16 c h8 r a r |
    g8 r g r16 g g8 r \tuplet 3/2 { d'8( c h } |
    \mBreak

    % c2 p9 87
    b8) r r4 d8 r r4 |
    b8 r r4 b8( h) r4 |
    h8 h16 h h4~ h8 h16 h h4~ |
    h8 h16 h h4~ h8 h16 h es4 |
    h4 h c as |
    \mBreak

    % c2 p9 92
    a4 e' g, as |
    \mark #11
    a8 r \tuplet 3/2 { c8 c c } c2~ |
    c8 r \tuplet 3/2 { h8 h h } h2~ |
    h8 r \tuplet 3/2 { h8 h h } h2~ |
    h8 r c r h r r4 |
    R1 |
    \mBreak
    
    % c2 p10 98
    r2 r4 a''( |
    d,8) r d4( g,8) r g4~ |
    g4 e( c a8) r |
    R1 |
    r2 r4 ges''4( |
    h,8) r h4( e,8) r e'4~ |
    e4 c( a ges8) r |
    \rMark
    R1 |
    \mBreak
    
    % c2 p10 106
    r2 r4 a'( |
    d,8) r d4( g,8) r g4~ |
    g4 e( c a8) r |
    <<
      \voiceOne {
        \override MultiMeasureRest.staff-position = #2
        R1 |
        R1 |
        r4 h8 r a r g r |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        r2 e'2_"Ob.II"  |
        dis2 es2 |
        es8 r s4 s2 | 
      }
    >>
    a,8 r a r r2 |
    \mBreak
    
    % c2 p10 113
    % FIXME: Duplicates H
    g'8 r d r16 d g8 r d r |
    g8-. c~ c2 h8-. r16 a( |
    d8) r \appoggiatura a8 g8 r16 ges-. g8-. r d r |
    g2. h8-. r16 d( |
    e8) r \appoggiatura a,8 g8 r16 ges-. g8-. r d r |
    \mBreak
    
    % c2 p10 118
    g2~ g8 r h8-. r16 d-. |
    \rMark
    g4( ges8) r16 g e4( es8) r16 e |
    c4( h8) r16 c a4( g8) r16 a( |
    e8) r16 ges( g8) r16 h( e8) r16 ges( g8) r16 a-. |
    \mBreak
    
    % c2 p10 122
    h2~ h8 a16( g \tuplet 6/4 { ges16 e d c h a } |
    g8) r r4 r2 |
    c,8 r c r16 c16 c8 r d r16 d |
    d8 r c r16 c h8 r a r |
    \mBreak
    
    % c2 p10 126
    g8 r g r16 g g4( g'8) r |
    des8 r c r16 c h8 r a r |
    g8 r g r16 g g8 r \tuplet 3/2 { d'8( c h } |
    b8) f( g a) b( c des d) |
    \mBreak
    
    % c2 p10 130
    es8( f g a b16) es( d c b as g f) |
    \rMark
    es4( d8) r16 c b8 r f'-.( r16 ges-.) |
    g4( f8) r16 es d8 r r4 |
    r8 f,( g a) b( c des d) |
    \mBreak
    
    % c2 p10 134
    es8( f g a b16) es( d c b as g f) |
    es4( d8) r16 c b8 r f'-.( r16 ges-.) |
    g4( f8) r16 es d8 r r4 |
    \mBreak
    
    % c2 p10 137
    \time 12/8
    es8 r r r d'-. f-. g( f) es-. d-. r r |
    r4. r8 d-. f-. g( f) es-. d-. r r |
    \rMark
    \bar "||"
    \key b \major
    % FIXME: Duplicates beginning
    R1*12/8*2 |
    es8-. a,-. es'-. a,-. es'-. a,-. es'-. b-. es-. c-. es-. c-. |
    \mBreak
    
    % c2 p10 142
    r2. des8( d c b ges f) |
    R1*12/8*2 |
    c'8-. ges-. c-. ges-. c-. ges-. c-. g-. c-. a-. c-. a-. |
    r2. a8( b a g es d) |
    R1*12/8*6 |
    \mBreak
    
    % c2 p10 153
    \rMark
    R1*12/8*8 |
    \rMark
    R1*12/8*4
    <<
      \voiceTwo {
        \override MultiMeasureRest.staff-position = #-4
        R1*12/8 |
        R1*12/8 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceOne \stemUp
        s2 f'1~_"Ob.I"  |
        f8 r s8 f8-. r16 f-. s8 fis8-. r s g-. r s |
      }
    >>
    f,1. |
    ges4.( g8) r r r2. |
    \rMark
    r4. b8-. des-. ges-. g-. r r r4. |
    \mBreak
    
    % c2 p11 170
    r4. b,8-. des-. ges-. g-. r r r4. |
    r4. b,,8-. des-. ges-. g-. r r r4. |
    r4. b,8-. des-. ges-. g-. r r r4. |
    r4. c,8-. f-. a-. r4. c,8-. f-. a-. |
    \mBreak
    
    % c2 p11 174
    r4. c,8-. f-. a-. r4. c,8-. f-. a-. |
    R1*12/8*2 |
    es'8-. c-. es-. a,-. es'-. a,-. c-. a-. c-. a-. es'-. a,-. |
    d8( b g b f d) r2. |
    R1*12/8*2 |
    \mBreak
    
    % c2 p11 181
    es'8-. c-. es-. a,-. es'-. a,-. c-. a-. c-. a-. es'-. a,-. |
    d8( b g b f d) r2. |
    \rMark
    R1*12/8*1 |
    ges4. f es des4~( des16 ces |
    \mBreak
    
    % c2 p11 185
    b8) r r r4. r2. |
    des8 es f ges f es des r r r4. |
    R1*12/8 |
    b'4.( as ges f4~ f16 es |
    des8) r r r4. r2. |
    \mBreak
    
    % c2 p11 190
    f8( ges as b as ges f) r r r4. |
    \time 4/4
    r2 b,8( a g f) |
    r2 b8( as g f) |
    \rMark
    c'''4 a8 f c4 a |
    \mBreak
    
    % c2 p11 194
    d16( c b a) g( f e d c8) r r4 |
    R1*3 |
    d8 r a r16 a d8 r a r |
    d8 g r4 r2 |
    R1 |
    \mBreak
    
    % c2 p11 201
    c,8 r g r16 g c8 r g r |
    \rMark
    c8 f r4 r2 |
    h8 r f r16 f h8 r f r |
    f'8 r c r16 c f8 r c r |
    \mBreak
    
    % c2 p11 205
    f8 a r4 r2 |
    R1 |
    e,8 r b8 r16 b e8 r b r |
    f'8 b r4 r2 |
    f8 r c r16 c f8 r c r |
    \mBreak
    
    % c2 p11 210
    \rMark
    f8 b r4 r2 |
    e8 r b r16 b e8 r b r |
    f'8 b f r16 f b8 r f r |
    c'8 f r4 r2 |
    \mBreak
    
    % c2 p11 214
    es,8 r es r16 es es8 r es r |
    es8 a~ a2. |
    es8 r es r16 es es8 r es r |
    es8 a~ a a es es4 es8 |
    \mBreak
    
    % c2 p11 218
    \rMark
    es8 a4 a8 es8 es4 es8 |
    \tuplet 3/2 { es8 es r } \tuplet 3/2 { a8 a r } \tuplet 3/2 { es8 es r } \tuplet 3/2 { c8 c r } |
    \tuplet 3/2 { es8 es r } \tuplet 3/2 { a8 a r } \tuplet 3/2 { es8 es r } \tuplet 3/2 { c8 c r } |
    \rMark
    \tuplet 3/2 { es8 es r } r4 r2 |
    \mBreak
    
    % c2 p12 222
    r4 f,32( g a b c d es f) g16( f es d) c( b a g) |
    f16( es d c) b( a g f) r2 |
    r4 f'32( g a b c d es f) g16( f es d) c( b a g) |
    \mBreak
    
    % c2 p12 225
    f16( es d c) b( a g f) r4 f32( g a b c d es f) |
    \tuplet 6/4 { g16( f es d c b } a8) r r4 f32( g a b c d es f) |
    \mBreak
    
    % c2 p12 227
    \tuplet 6/4 { g16( f es d c b } a8) r r4 f32( g a b c d es f) |
    \tuplet 6/4 { g16( f es d c b } a8) r8 \tuplet 6/4 { g'16( f es d c b } a8) r |
    \rMark b'8 r a r b r f r |
    \mBreak
    
    % c2 p12 230
    % FIXME: Rhythmically somewhat similar to H + 1
    b8 es,~ es2 d8 r16 c |
    b8 r \appoggiatura c8 b8 r16 a b8 r c' r |
    b2. d,8 r16 f |
    g8 r \appoggiatura c8 b8 r16 a b8 r c r |
    b2. d,8 r16 f |
    \mBreak
    
    % c2 p12 235
    b4( a8) r16 b g4( ges8) r16 g |
    es'4( d8) r16 es c4( b8) r16 c-. |
    g8-. r16 a( b8) r16 d( g,8) r16 a( b8) r16 c-. |
    \rMark
    d2~ d8 c16( b \tuplet 6/4 { a g f es d c } |
    \mBreak
    
    % c2 p12 239
    b8) r a' r b r f r |
    b8 es,~ es2 d8 r16 c |
    b8 r \appoggiatura c8 b8 r16 a b8 r c' r |
    b2. d,8 r16 f |
    g8 r \appoggiatura c8 b8 r16 a b8 r c r |
    \mBreak
    
    % c2 p12 244
    b2. d,8 r16 f |
    \mark #27
    ges4( f8) r16 es des8 r as' r16 a |
    b4( as8) r16 ges f8 r b r16 c |
    d2. c8 r16 d, |
    b'2. a8 r16 d, |
    \mBreak
    
    % c2 p12 249
    g4( f8) r16 g es4( d8) r16 g |
    c,4( b8) r16 b g'4( f8) r16 h, |
    es8 r \tuplet 3/2 { c'8 c c } c2~ |
    c8 r \tuplet 3/2 { a8 a a } a2~ |
    a8 r \tuplet 3/2 { as8 as as } as2~ |
    \mBreak
    
    % c2 p12 254
    as8 r a r16 a b8 r r4 |
    % Using multiples of 27 for marks, to skip from AA to BB etc.
    \mark #54
    R1*2 |
    r4 f'( b,8) r b'4~ |
    b4 g( es c8) r |
    R1*2 |
    r4 d( g,8) r g'4~ |
    g4 es( c a8) r |
    R1*2 |
    \mBreak
    
    % c2 p12 265
    r4 f'( b,8) r b'4~ |
    b4 g( es c8) r |
    \mark #81
    R1*3 |
    c,4~ c8 r h4~ h8 r |
    c4~ c8 r c4~ c8 r |
    des'4~ des8 r d4~ d8 r |
    \mBreak
    
    % c2 p12 273
    e8 r f r d r es r |
    \mark #108
    b r a r b r r4 |
    R1 |
    c4 f,8. f16 c'4 f,4 |
    c'8-. g'-. r4 r2 |
    c,4 f,8. f16 c'4 f,4 |
    \mBreak
    
    % c2 p12 279
    % FIXME: Duplicate from somewhere above
    c'8-. g'-. r4 f,8-. c'-. r4 |
    c8-. g'-. r4 f,8-. c'-. r4 |
    g'2 c,2 |
    \mark #135
    g2 c,8 r8 f16( fis g a |
    b8) r a r b r f r |
    b8 es,~ es2 d8 r16 c |
    \mBreak
    
    % c2 p12 285
    b8 r \appoggiatura c8 b8 r16 a b8 r c' r |
    b2. d,8 r16 f |
    g8 r \appoggiatura c8 b8 r16 a b8 r c r |
    b2. d,8 r16 f |
    b4( a8) r16 b g4( fis8) r16 g |
    \mBreak
    
    % c2 p13 290
    % FIXME: Duplicate from somewhere above
    es'4( d8) r16 es c4( b8) r16 c-. |
    g8 r16 a( b8) r16 d( g,8) r16 a( b8) r16 c-. |
    \mark #162
    d2~ d8 c16( b \tuplet 6/4 { a g f es d c } |
    b8) r a' r b r f r |
    \mBreak
    
    % c2 p13 294
    b8 es,~ es2 d8 r16 c |
    b8 r \appoggiatura c8 b8 r16 a b8 r c' r |
    b2. d,8 r16 f |
    g8 r \appoggiatura c8 b8 r16 a b8 r c r |
    b2. d,8 r16 f |
    \mBreak
    
    % c2 p13 299
    \mark 189
    ges4( f8) r16 es des8 r as' r16 a |
    b4( as8) r16 ges f8 r b r16 c |
    d2. c8 r16 d, |
    b'2. a8 r16 d, |
    g4( f8) r16 g es4( d8) r16 g |
    \mBreak
    
    % c2 p13 304
    c,4~ c8 r c4~ c8 r |
    c4~ c8 r c4~ c8 r |
    c4~ c8 r c4~ c8 r |
    \mark #216
    c4~ c8 r c4~ c8 r |
    d4( c8) r16 g es'4( d8) r16 g, |
    f'4( es8) r16 c f4( e8) r16 c |
    \mBreak
    
    % c2 p13 310
    g'4( f8) r16 c g'4( ges8) r16 c, |
    as'4( g8) r16 c, b'4( a8) r16 es  |
    c'8( b f b) c( b ges b) |
    c8( b g b) c( b ges b) |
    c8( b a g) f( e' es d) |
    \mBreak
    
    % c2 p13 315
    c8( b a g f) r r4 |
    \mark #243
    R1 |
    r4 f,( g a) |
    b4( d) d8 r r4 |
    r4 f,( g a) |
    b4( c d2) |
    es4( f g a) |
    b4( c d) r |
    es4( f g a) |
    \mBreak
    
    % c2 p13 324
    \mark #297
    a8 r \tuplet 7/4 { b,,16( c d e ges g a } b8) r16 a-. b8-. r16 f-. |
    g8-. r \tuplet 7/4 { es16( f g a h c d } es8) r16 d-. es8-. r16 h-. |
    c8-. r r4 r4 \tuplet 7/4 { des16( es f ges as b c } |
    \mBreak
    
    % c2 p13 327
    cis8) r r4 r \tuplet 7/4 { es,16( f g as b c d } |
    es8) r r4 r \tuplet 7/4 { f,16( g a b c d e } |
    f16) g,( a b c b a g) f( es d c) b( a g f) |
    \mBreak
    
    % c2 p13 330
    b8 r f r16 f b8 r es, r |
    b'8 f' b16( c d e f8) r f,,16( es d c |
    b8) r f' r16 f b8 r es, r |
    b'8 f' b16( c d e f8) r f,,16( es d c |
    \mBreak
    
    % c2 p13 334
    \mark #324
    b8) r f'16( ges g a b8) r f16( ges g a |
    b8) r f16( ges g a b8) r f16( ges g a |
    b8) r f16( ges g a b8) r f16( ges g a |
    \mBreak
    
    % c2 p13 337
    b8) r f16( ges g a b8) r f16( ges g a |
    b8) b a g f es d c |
    b8 a' g ges f es d c |
    b8 r r4 f'8 r r4 |
    f'8 r r4 a8 r r4 |
    \mBreak
    
    % c2 p13 342
    f8 r f r r4 f8 r |
    r4 f8 r r4 f8 r |
    d8 r b r f r d r |
    f,1~ |
    f2. \tuplet 3/2 { f8 f f } |
    f8 r r4 r2 |
    \bar "|."
    \mBreak
  }
}

tschaikowsky_IV_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 3/4
  \tempo "Adagio lamentoso"
  \key f \major
  \clef violin
  \relative c' {
    % cl2 p14 1
    R2.*4 |
    <<
      \voiceOne {
        \override MultiMeasureRest.staff-position = #2
        R2. |
        R2. |
        R2. |
        r4 r e~ |
        e4 d4.( c8) |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo \stemDown
        r4 g'2~( |
        g4 f) c'~ |
        c4 h2~ |
        h4 a s |
        s2. |
      }
    >>
    g4-- fis4. e8 |
    \rMark
    h'4-- a4.( gis8) |
    e'4( d8.) c16-- h8-- c-- |
    \mBreak
    
    % cl2 p14 13
    h8( a) gis8.-- a16-- g8-- f-- |
    e8( f) e-- d-- c( d) |
    c8( b) r4 r |
    \tempo "Andante"
    R2.*4
    \tempo "Adagio poco meno che prima"
    R2.*10 |
    \rMark
    R2.*7 |
    \mBreak
    
    % cl2 p14 37
    <<
      \voiceOne {
        \override MultiMeasureRest.staff-position = #2
        R2.
        r4 r a-- |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo \stemDown
        \tuplet 3/2 { r8_"Hr." c c~ } \tuplet 3/2 { c c c~ } \tuplet 3/2 { c c c~ } |
        \tuplet 3/2 { c c c~ } \tuplet 3/2 { c c c } s4 |
 
      }
    >>
    % FIXME: Cues
    \rMark
    b2( e,4) |
    f2 c'4-- |
    b2( e,4) |
    f2 es''4-- |
    d2 g4-- |
    g4( a) d,-- |
    \mBreak
    
    % cl2 p14 45
    d2. |
    d4 des( \tuplet 3/2 { des8 c) c~ } |
    \tuplet 3/2 { c8 c c~ } \tuplet 3/2 { c c c~ } \tuplet 3/2 { c h h } |
    \tuplet 3/2 { r8 c c~ } \tuplet 3/2 { c c c~ } \tuplet 3/2 { c c c~ } |
    \mBreak
    
    % cl2 p14 49
    \tuplet 3/2 { c8 c c~ } \tuplet 3/2 { c c c~ } \tuplet 3/2 { c h h } |
    \tuplet 3/2 { r8 c c~ } \tuplet 3/2 { c c c~ } \tuplet 3/2 { c c c } |
    \rMark
    \tuplet 3/2 { r8 d d~ } \tuplet 3/2 { d d d~ } \tuplet 3/2 { d d d } |
    \mBreak
    
    % cl2 p14 52
    \tuplet 3/2 { r8 e e~ } \tuplet 3/2 { e e e~ } \tuplet 3/2 { e e e } |
    \tuplet 3/2 { r8 f f~ } \tuplet 3/2 { f f f~ } \tuplet 3/2 { f f f } |
    \tuplet 3/2 { r8 g g~ } \tuplet 3/2 { g g g } c,4-- |
    \mBreak
    
    % cl2 p14 55
    \tempo "Tempo I"
    b2( e,4) |
    f2( c'4) |
    b2( e,4) |
    f2 es4-- |
    d2 g4-- |
    g4( a) d,-- |
    d2. |
    d4( des4~ \tuplet 3/2 { des8 c) c } |
    \mBreak
    
    % cl2 p14 63
    \rMark
    \tuplet 3/2 { c8 c c~ } \tuplet 3/2 { c c c~ } \tuplet 3/2 { c h h } |
    \tuplet 3/2 { r8 c c~ } \tuplet 3/2 { c c c~ } \tuplet 3/2 { c c c~ } |
    \tuplet 3/2 { c8 c c~ } \tuplet 3/2 { c c c~ } \tuplet 3/2 { c h h } |
    \mBreak
    
    % cl2 p14 66
    \tuplet 3/2 { r8 c c~ } \tuplet 3/2 { c c c~ } \tuplet 3/2 { c c c } |
    \tuplet 3/2 { r8 d d~ } \tuplet 3/2 { d d d~ } \tuplet 3/2 { d d d } |
    \tuplet 3/2 { r8 e e~ } \tuplet 3/2 { e e e~ } \tuplet 3/2 { e e e } |
    \mBreak
    
    % cl2 p14 69
    \tuplet 3/2 { r8 f f'~ } \tuplet 3/2 { f f f~ } \tuplet 3/2 { f f f } |
    \tuplet 3/2 { r8 g g~ } \tuplet 3/2 { g g g~ } \tuplet 3/2 { g g g } |
    \rMark
    \tuplet 3/2 { r8 a a~ } \tuplet 3/2 { a a a~ } \tuplet 3/2 { a a a~ } |
    a8 r r4 r |
    \mBreak
    
    % cl2 p14 73
    \tempo "Più mosso"
    \tuplet 3/2 { r8 es es~ } \tuplet 3/2 { es es es~ } \tuplet 3/2 { es es es~ } |
    es8 r r4 r |
    \tuplet 3/2 { r8 b' b~ } \tuplet 3/2 { b b b~ } \tuplet 3/2 { b b b~ } |
    b8 r r4 r |
    \mBreak
   
    % cl2 p15 77
    es,16 r r8 r4 es16 r r8 |
    r4 es16 r r8 r4 |
    \tempo "Vivace"
    es16 r r8 r4 r |
    R2. |
    r8 b, r4 r4\fermata
    \mBreak
   
    % cl2 p15 82
    \tempo "Andante"
    R2. |
    es2.~( |
    es8 d) r4\fermata r |
    h2.~( |
    h8 a) r4 \fermata r8 a( |
    g8) r r4 r8 g( |
    f8) r r4 r4 |
    R2. |
    \mBreak
   
    % cl2 p15 89
    \tempo "Andante non tanto"
    \rMark
    R2.*13 |
    \rMark
    <<
      \voiceTwo {
        \override MultiMeasureRest.staff-position = #-6
        R2. |
        R2. |
        R2. |
        R2. |
        R2. |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceOne \stemUp
        r8 \tuplet 3/2 { e'16(_"Viol.I" f g) } \tuplet 3/2 { a( b h } \tuplet 3/2 { c cis d) }\tuplet 3/2 { es( e f } \tuplet 3/2 { fis g as) } |
        a4-- g8-- f-- e8.--( d16--) |
        e2~ e8 r |
        a4-- g8-- f-- e8.--( d16--) |
        f8( e~ e4~ e8) r |
      }
    >>
    \mBreak
   
    % cl2 p15 108
    d,2. |
    f2( a,4) |
    g'2 f4 |
    b2 d,4 |
    h4 ais8( h) c4 |
    h8( c) d'4 c8( d) |
    \mBreak
   
    % cl2 p15 114
    g,4 c g |
    c4 h d |
    \tempo "Moderato assai"
    \rMark
    g2. |
    g4 f b |
    c,2. |
    des4 c b |
    d2. |
    \mBreak
   
    % cl2 p15 121
    b'4 a e8 e, |
    f2. |
    c2. |
    g2. |
    b2 f4 |
    \tempo "Andante"
    \mark #11
    a8 r r4 \tuplet 3/2 { cis16( d e } f32 g as b) |
    \mBreak
   
    % cl2 p15 127
    h4 a8-- g-- g-- f-- |
    a,4 r \tuplet 3/2 { cis16( d e } f32 g as b) |
    h4 a8-- gis-- g-- f-- |
    \mBreak
   
    % cl2 p15 130
    a,4-- r \tuplet 3/2 { a16( b h } cis32 d e fis) |
    g4 fis8-- e-- d-- cis-- |
    e4 r \tuplet 3/2 { a,16( b h } cis32 d e fis) |
    \mBreak
   
    % cl2 p15 133
    g4 fis8-- e-- d-- cis-- |
    e4 r r |
    d4 r r |
    d4 r r |
    \rMark
    R2.*2 |
    R2.*6 |
    \mBreak
   
    % cl2 p15 145
    R2.*2 |
    \tempo "Andante gusto"
    \rMark
    <<
      \voiceOne {
        r4 r 
        \clef violin
        d4 |
      }
      \\
      \new CueVoice {
        \stemDown
        \clef bass
        \tuplet 3/2 { d,8_"Kb." d d~ } \tuplet 3/2 { d8 d d } s4 |
      }
    >>
    es'2 e4 |
    f2 d4 |
    es2 e4 |
    f2. |
    \mBreak
   
    % cl2 p15 152
    e,2( f4) |
    b2( a4) |
    g2. |
    \rMark
    a4~ a8 r r4 |
    R2.*12 |
    R2.*3 |
    R2.\fermata
    \bar "|."
    \mBreak
  }
}

%{  

%}

% ---------------------------------------------------------

%{
\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
    subtitle = "1. Satz"
  }
  \score {
    \new Staff {
      \transpose b a \tschaikowsky_I_clarinet_II
    }
  }
}
%}

%{
\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
    subtitle = "2. Satz"
  }
  \score {
    \new Staff {
      \transpose b a \tschaikowsky_II_clarinet_II
    }
  }
}
%}

%%{
\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
    subtitle = "3. Satz"
  }
  \score {
    \new Staff {
      \transpose b a \tschaikowsky_III_clarinet_II
    }
  }
}
%%}

%{
\bookpart {
  \header{
    instrument = "Klarinette II in A"
    subtitle = "4. Satz"
  }
  \score {
    \new Staff {
      \transpose a a \tschaikowsky_IV_clarinet_II
    }
  }
}

%}
