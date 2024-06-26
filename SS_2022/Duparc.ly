\version "2.24.1"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##f
}

\header{
  title = "Lenore"
  subtitle = "Sinfonische Dichtung"
  composerShort = "Henri Duparc"
  composer = "Henri Duparc (1848 - 1933)"
  tagline = ""
}

% Adapt this for automatic line-breaks
mBreak = {}
% mBreak = { \break }
#(set-global-staff-size 16)

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
fCantabile = _\markup { \dynamic f \italic "cantabile" }
smorz = _\markup { \italic "smorz." }
sempreFf = _\markup { \italic "sempre" \dynamic ff }
sempreFff = _\markup { \italic "sempre" \dynamic fff }
pocoF = _\markup { \italic "poco" \dynamic f }
ffz = _\markup { \dynamic { ffz } } 
crescMolto = _\markup { \italic "cresc. molto" }
pMoltoCresc = _\markup { \dynamic p \italic "molto cresc." }
sempreCresc = _\markup { \italic "sempre cresc." }
ppEspr = _\markup { \dynamic pp \italic "espr." }
ppiuEspress = _\markup { \dynamic p \italic "più espress." }
pocoCresc = _\markup { \italic "poco cresc." }
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
  % Distance between title stuff and music
  markup-system-spacing.basic-distance = #12
  markup-system-spacing.minimum-distance = #12
  markup-system-spacing.padding = #10
  % Distance between music systems
  system-system-spacing.basic-distance = #14
  system-system-spacing.minimum-distance = #14
  % system-system-spacing.padding = #10
  
}

% ---------------------------------------------------------

clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \tempo "Andante sostenuto" 4 = 56
  \key b \major
  \clef violin
  \relative c' {
    % p1 1
    \partial 2 
    <<
      \new CueVoice {
        \clef bass
        \set instrumentCueName = "Vcl."
        \stemDown \voiceOne {
          r4 g( |
          gis4 a) r gis8( a |
          ais8 c h2) r4 |
        }
      }
      {
        r4 r4 |
        \override MultiMeasureRest.staff-position = #-6
        R1*2 |
        \revert MultiMeasureRest.staff-position
      }
    >>
    \clef violin
    \stemNeutral
    d2\solo(\p cis |
    d2 es~) |
    es2 r |
    R1*3 |
    f'4(\p\<\solo b2 \>a4)~\! |
    a4 r4 r2 |
    <<
      \new CueVoice {
        \set instrumentCueName = "Ob."
        \stemUp \voiceOne {
          r4\rit r4\fermata\aTempo r8 f,8 a c |
        }
      }
      {
        \override MultiMeasureRest.staff-position = #-6
        R1 _\fermata |
        \revert MultiMeasureRest.staff-position
      }
    >>
    a2(\p b) |
    a2( b) |
    \mBreak
    
    % p1 2
    h4(\cresc c4. cis8 d4 |
    es2)~\rit es4\dim\fermata\! r4\aTempo |
    r4 fes,2(\p es8 d|
    \time 2/4 \bar "||"
    es2) |
    \time 4/4 \bar "||"
    b'4(\mfEspress des8 ces \tuplet 3/2 { b as g } \tuplet 3/2 { as b ces }
    \time 2/4 \bar "||"
    b2)( |
    \time 4/4 \bar "||"
    \mark #1
    es8.\sfz\> d?16)\! d8 r8 r2 |
    r2 \tuplet 3/2 { r8 a(\p c } \tuplet 3/2 { d es e) } |
    \mBreak
    
    % p1 3
    f8.(\sfz\> e16)\! e8 r8 r2 |
    R1 |
    r2 \tuplet 3/2 { r8 g,,_(\mf c } \tuplet 3/2 { e g c } |
    h8) r8 r4 r2 |
    r16 g,(\f b? d e g b d cis8) r8 r4 |
    r16 g,(\f b d e g b d cis8) r8 r4 |
    \mBreak

    % p1 4
    r2 r4\cresc b'8 h |
    d2(\ff d8)( cis c8. cis16) |
    d2~ d8( cis c) r |
    c,8( cis\dim d)\! r r2 |
    r2\rit r4\fermata r4\aTempo |
    r4 ges,2(\pp\solo es4 |
    \time 2/4 \bar "||"
    f2) |
    \time 4/4 \bar "||"
    \mark #2
    R1 |
    f'4.(\pEspress\solo g8 gis\<\pocoRit a c8.\> b16 |
    \mBreak
    
    % p1 5
    c,4)\aTempo r4\!\pocoAPocoAccel r2 |
    r8 f(\pocoF\solo g a g8. f16) f8 r8 |
    r2 f4.\f\<( d'8)~ |
    d8(\!\sempreAccel c) r4 r \tuplet 6/4 { ges,16(\p as ges as ges as } |
    \bar "||"
    \mark #3
    \tempo "Più animato"
    f8) r8 r4 r \tuplet 6/4 { ges'16( as ges as ges as } |
    f8) r8 r4 r2 |
    \mBreak
    
    % p1 6
    r2 \tuplet 6/4 { f,16(\mf g f g f g} ges8) r8 |
    es1~\mf |
    es8 r8 f2.~\f\pocoAPocoAccelAlD |
    f8 r8 r4 r2 |
    R1 |
    es''?2\ff\startTrillSpan \appoggiatura d8\stopTrillSpan es8 r8 r4 |
    \mark #4
    \repeat tremolo 8 { f,32( a } \repeat tremolo 8 { f32 a) } |
    \repeat tremolo 8 { f32( a } \repeat tremolo 8 { f32 a } |
    f8)\sec r8 r4 r2 |
    \mBreak
    
    % p1 7
    r2 c'8\ff f,16 f f'8 f,16 f |
    \bar "||"
    \mark #5
    \tempo "Allegro non troppo"
    b8 r8 r4 \repeat tremolo 8 { ges32(\mf as } |
    f8) r8 r4 \repeat tremolo 8 { ges32( as } |
    f8) r8 r4 \repeat tremolo 8 { ges32( as } |
    f8) r8 r4 \repeat tremolo 8 { f32( g) } |
    \repeat tremolo 8 { g32( as)\cresc } \repeat tremolo 8 { g32( a } |
    g8) r8 r4 \repeat tremolo 8 { as32(\mf b } |
    \mBreak
    
    % p1 8
    g8) r8 r4 \repeat tremolo 8 { as32( b } |
    g8) r8 r4 \repeat tremolo 8 { as32(\piuF b } |
    g8) r8 r4 \repeat tremolo 8 { g32(\cresc a } |
    g8) r8 r4 e,2(\f |
    es8) r8 r4 r2 |
    \tuplet 6/4 { f'16(\f e d cis d e) } \tuplet 6/4 { f16( e d cis d e) } \tuplet 6/4 { f16( e d cis d e } f8) r8 |
    \mark #6
    \mBreak
    
    % p1 9
    f'8(\p e es d) des( c h b) |
    a8 r8 r4 r2 |
    \repeat tremolo 8 { e32(\ff f } \repeat tremolo 8 { e f) } \acciaccatura e8 |
    % FIXME: I can't get the grace note into the previous bar - afterGrace clashes with the tremolo
    f8\sec r8 r4 r2 |
    R1*2 |
    g,,8.(\mf\< f'16) f8\! r8 as,8.(\< f'16 as8.\sfz\> g16\! | 
    f8) r8 r4 r2 |
    R1 |
    \mBreak
    
    % p1 10
    d'8-.\f e16-. e-. es8-. d16-. d-. cis8-. c16-. c-. h-. h-. cis-. cis-. | 
    \mark #7
    d8-. r8 r4 r2 |
    R1*3 |
    f,8.(\mf\solo g16 a8. b16 c8. e16 f8. f,16) |
    ges8.( f'16 f8.\crescMolto ges,16 g8. f'16 f8. g16 |
    as8) r8 r4 r2 |
    r4 g,2\startTrillSpan \acciaccatura fis8 \stopTrillSpan  g r |
    \tuplet 6/4 { b'16(\f a g fis g a } \repeat unfold 3 \tuplet 6/4 { b16 a g fis g a } |
    h8) r8 r4\pocoRit r2 |
    \bar "||"
    \mBreak
    
    % p2 1
    \mark #8
    \tempo "Più largamente"
    r4 d,,32(\p\solo e d e d e d e d8) r8 d32( e d e d e d e |
    d8) r d32( e d e d e d e d8) r d32( e d e d e d e |
    \mBreak
    
    % p2 2
    d8) r d32( e d e d e d e d8) r d32( e d e d e d\pocoCresc e |
    d8) r d32( e d e d e d e d8) r r4 |
    R1*2 |
    \mBreak

    % p2 3
    e4.(\p\< f8 fis8)\! r r4 |
    R1*3\pocoString |
    <<
      \new CueVoice {
        \set instrumentCueName = "Viol.I."
        \stemDown \voiceOne {
          f'8( eis f fisis gis g fis4) |
        }
      }
      {
        \override MultiMeasureRest.staff-position = #-6
        R1\sempreStringendo |
        \revert MultiMeasureRest.staff-position
      }
    >>
    a,4.(\f\< c8\sfz\> h)\!\rall r r4 |
    \tempo "Lento"
    R1\fermata |
    \bar "||"
    \tempo Andante
    d4(\ppiuEspress\solo f8 es? d c~ \tuplet 3/2 { c d es } |
    \bar "||"
    \time 2/4
    d2) |
    \bar "||"
    \time 4/4
    r4 as'2(\pp\solo g8 fis |
    g8) r8 r4 r2 |
    R1*2\p \rit |
    \bar "||"
    \mBreak
    
    % p2 4
    \mark #9
    \tempo "Allegro non troppo (Tempo I)"
    g,,8.(\mf\solo a16 b8. c16 d8. fis16 g8. g,16) |
    a8.( g'16 g8. g,16 a8. g'16 g8. a,16) |
    b8.( c16 d8. fis16\cresc g8. a16 b8. b,16) |
    c8.( b'16 b8. c,16 des8.\< b'16 des8.\sfz\> c16)\! |
    b8.( a16 g8. e16\cresc cis8. b16 a8. g16) |
    \mBreak

    % p2 5
    d'8.(\f es16 d8. g16 d8. es16 d8. g16) |
    d16( dis e f fis g gis a b\cresc h c cis d dis e fis |
    g8)\ff r8 b,16(\sfz\> a b a\! g a\< g b des\sf\> b des b\! |
    \mBreak
    
    % p2 6
    g8) r8 r4 r2 |
    \mark #10
    R1 |
    \repeat tremolo 8 { f'32(\mf g } \repeat tremolo 8 { f32 g } |
    f8) r8 r4 r2 |
    \repeat tremolo 8 { es32( f } \repeat tremolo 8 { es32\dim f } |
    es8)\! r8 r4 r2 |
    R1*2 |
    dis,8.(\mf\solo h'16 h8. dis,16 e8. h'16 h8. e,16) |
    e8 r8 r4 r2 |
    \mBreak
    
    % p2 7
    a16\f( h a h c d c d) e8.(\cresc c'16) c8.( e16 |
    \mark #11
    fis8) r8 r4 e,2~\sempreFf\! |
    e8 r8 r4 e2~ |
    e8 r8 r32 h(\ff cis dis eis fis g a h8) r8 r4 |
    h,2~ h8 r8 r4 |
    h2. h8 r8 |
    \mBreak

    % p2 8
    \mark #12
    r16 c'(\ff d es d8-^ c) r16 c( d es d8-^ c) |
    R1 |
    r16 f,( g as g8-^ f) r16 a( b ces b8-^ a) |
    R1 |
    \tuplet 6/4 { f16( e d cis d e } fis8) r8 \tuplet 6/4 { f16( e d cis d e } fis8) r8 |
    \mBreak

    % p2 9
    f8[\ff r16 ges]\mf f8. ges16 ges8. g16\crescMolto ges8. g16 |
    as8. a16 as8. a16 as8. a16 as8. as16 |
    \mark #13
    b8\fff r8 r4 b8 r8 r4 |
    b8 r8 r4 b8\sempreFf r8 r32 d,,( e fis g a b c) |
    \mBreak

    % p2 10
    d8.( c'16 b8. a16 g8. f16 e8. f16) |
    g8.( f16 e8. d16 cis8. b16 a8. b16) |
    a8.( b16 a8. e'16 a,8) r8 r4 |
    cis'16( c h b a as g ges f) r16 r8 r4 |
    \repeat tremolo 8 { f32( a } \repeat tremolo 8 { f32 a) } |
    \mBreak
    
    % p2 11
    \repeat tremolo 8 { f32( a } \repeat tremolo 8 { f32 a } |
    f8)\sec r8 r4 r2 |
    r2 c'8 f,16 f f'8 f,16 f |
    \mark #14
    b8 r8 r4 \repeat tremolo 8 { ges32(\mf as } |
    f8) r8 r4 \repeat tremolo 8 { ges32( as } |
    f8) r8 r4 \repeat tremolo 8 { ges32( as } |
    f8) r8 r4 \repeat tremolo 8 { f32( g) } |
    \mBreak

    % p2 12
    \repeat tremolo 8 { g32( as } \repeat tremolo 8 { g32\cresc a } |
    g8) r8 r4 \repeat tremolo 8 { as32(\mf b? } |
    g8) r8 r4 \repeat tremolo 8 { as32( b } |
    g8) r8\piuF r4 \repeat tremolo 8 { as32( b } |
    g8) r8 r4 \repeat tremolo 8 { g32(\cresc a } |
    g8) r8 r4 e,2(\f |
    es8) r8 r4 r2 |
    r2 d''8\ff a16 a a8.-^ a16 |
    \mBreak

    % p2 13
    \mark #15
    a8 r d, r dis r e r |
    f8 r fis r r4 g8 r |
    f8 r r4 f8 r r4 |
    f8 r r4 r2 |
    R1 \rall |
    \bar "||"
    \mark #16
    \tempo "Più largamente"
    R1*3 |
    <<
      \new CueVoice {
        \set instrumentCueName = "Ob."
        \stemDown {
          r4 dis8 e eis gis f a
        }
      }
      {
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        \revert MultiMeasureRest.staff-position
      }
    >>
    % FIXME: I can't get the grace note into the previous bar - afterGrace clashes with the tremolo
    h1\p ^\markup "#" \startTrillSpan \acciaccatura ais8 \stopTrillSpan |
    h8 r r4 r2 |
    \mBreak
    
    % p2 14
    r2 r4 es,?8(\f f |
    fis8) r r4 cis8( eis f gis |
    a8\cresc ais h g~ g2) |
    fis4( f e dis |
    e8) r r4 r2 |
    h'8(\f\> b a4~)\! a8 r r4 |
    d8(\piuF\> cis c)\! r es?(\> d des b?\! |
    \mBreak

    % p3 1
    f8)\piuP  r g8.( d16 f8 es) r4 |
    r4\string h'8.( fis16 a8 g) r4 |
    R1 |
    r2 d4.(\f\<\sempreString f8\sfz\> |
    e8) r\! r4 r2 |
    cis4.(\f\< e8\sfz\> dis)\rall r8\! r4 |
    \tempo "Lento"
    R1\fermata |
    \bar "||"
    \tempo Andante
    R1 |
    \bar "||"
    \time 2/4 |
    R2 |
    \bar "||"
    \time 4/4
    <<
      {
        \override MultiMeasureRest.staff-position = #+2
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "3.Cor."
        \stemUp {
          f,4 a8 g \tuplet 3/2 { f e dis } \tuplet 3/2 { e f g } |
        }
      }
    >>
    \mBreak

    % p3 2
    a2.(\p\< gis8\> a)\! |
    b4(\< a2~ a8\> g\! |
    a4) r4\pocoRit r2 |
    \mark #17
    \tempo "Allegro non troppo"
    h,1~ |
    h1~\cresc |
    h8\! r r4 r2 |
    r2 g''8-.\f c,16-. c-. c'8-. c,16-. c-. |
    f1( |
    e8) r r4 g8 c,16 c c'8. b16 |
    \mBreak

    % p3 3
    \mark #18
    a8 r r4 \repeat tremolo 8 { d,32( es } |
    e8) r r4 \repeat tremolo 8 { d32( es) } |
    d2.\startTrillSpan d8\stopTrillSpan  r |
    c8. b16 a8. b16\cresc c8. d16 e8. fis16 |
    \mark #19
    g8 r r4 es,!2(\f\< |
    e8)\sfz r r4 d'2~\f |
    d8 r r4 g,2( |
    \mBreak
    
    % p3 4
    f8) r r4 b'2(\f\< |
    h8)\sfz r r4 h,2~\ff |
    h8 r r4 r2 |
    \mark #20
    fis'8.(\f gis16 a8.\cresc h16\! cis8. eis,16 fis8. g16 |
    a8) r r4 r2 |
    as8.(\ff b16 ces8. des,16 es8. g16 as8. b16) |
    \mBreak

    % p3 5
    h8.( cis,16 d8. e16 fis8. ais16 h?8. cis16) |
    d8.( e,16 f8.\cresc g16\! a8. cis16 d8) r |
    \mark #21
    \tuplet 6/4 { as,16( g f e f g } a8) r \tuplet 6/4 { as'16( g f e f g } a8) r8 |
    des,8.\ff d16\mf des8.\crescMolto d16 d8. es16 \tuplet 3/2 { d8( es e } |
    \mBreak

    % p3 6
    f8.) ges16\sempreCresc f8. ges16 f8. ges16 f8. fis16 |
    g8\fff r r4 g8 r r4 |
    fis'8 r r4 fis8 r c-^ \tuplet 3/2 { c16-^ c-^ c-^ } |
    \mark #22
    c8\sec r g8. c16 g8.\sempreFff as16 g8. c16 |
    b8 r r4 r4 r32 es,( f g as b c d |
    \mBreak

    % p3 7
    es8) r \tuplet 3/2 { f,-^ f-^ ges-^ } f-^ r8 r4 |
    \tuplet 3/2 { es'8 es es } es8. es16 es8. es16 es8. es16 |
    c8 r \grace { f,16( g a? b } \tuplet 3/2 { c8-^) c-^ d-^ } c8 r r32 c,( d es f g a b |
    \tuplet 3/2 { c8)\tuttaForza c d } \repeat unfold 3 { c8. d16 } |
    \mBreak

    % p3 8
    c8\sec r r4 r2 |
    \grace { c,16( d es } f8) r r4 r4 b,(\fCantabile\solo |
    \bar "||"
    \mark #24
    \tempo "Più largamente"
    h4 c2 h8 c |
    cis8 es? d2) d4( |
    f4 es2)( d8 es |
    e8 g f2) d8( es |
    f8\< fis g es~) es4.(\! c'8~) |
    \mBreak

    % p3 9
    c8(\! b a\pocoString g~ g f~ \tuplet 3/2 { f8 es d } |
    \bar "||" 
    \tempo "Tempo I"
    f8) r r4 r2 |
    r8 r16\ff\< f,( g4 g8\> f8~\! \tuplet 3/2 { f8 es d } | 
    f8) r r4 r2 |
    r8 r16\ff\< f'( g4~ g8\> f8~\! \tuplet 3/2 { f8 es d } | 
    \mBreak

    % p3 10
    f8 es) r4 r2 |
    R1\string |
    c8( h b4~ b4.\ff\< des8\sfz\> |
    c8\! h c cis d\sempreString cis) c4~ |
    c4.(\< es8\sfz d)\> r8\! r4 |
    R1 |
    \tuplet 3/2 { ges,8\fff ges ges } \repeat unfold 2 \tuplet 3/2 { ges8 ges ges } \tuplet 3/2 { es8 es es } |
    \mBreak

    % p3 11
    f8 r r4 r2 |
    \repeat unfold 4 \tuplet 3/2 { ges8 ges ges } |
    \repeat unfold 2 \tuplet 3/2 { ges8 ges ges } \repeat unfold 2 \tuplet 3/2 { es8 es es }
    \mark #25
    f1~ |
    f2(\< e4\sfz\> f\! |
    ges8)\sec\aTempo r r4 r2 |
    \mBreak

    % p3 12
    a'16\ff \repeat unfold 15 a |
    b8 r as,16 a b h c h c d es d es e |
    g16 fis f fis g fis f fis g\string\cresc fis\! f fis g fis f fis |
    \mBreak

    % p3 13
    g16\tuttaForza fis f fis g fis f fis g fis f fis g fis f e |
    f8\sec r r4 r2 |
    R1*5\pocoRall |
    \bar "||"
    \tempo Andante
    R1*4 |
    <<
      \new CueVoice {
        \set instrumentCueName = "Fag."
        \stemDown {
          r4 b(\pp ces d |
          c4. b8) b2 |
        }
      }
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*2 |
        \revert MultiMeasureRest.staff-position
      }
    >>
    r2\solo f2(\pEspress\< |
    \bar "||"
    \tempo "Più lento"
    as4\sfz\> ges)\! r8 f( es d~ |
    \mBreak

    % p3 14
    d8 es8~ \tuplet 3/2 { es f ges } f4~ f8) r |
    R1*2 |
    \bar "||"
    \tempo Adagio 
    <<
      \new CueVoice {
        \set instrumentCueName = "Ob."
        \stemDown {
          f4( es) r8 d( c b) |
        }
      }
      {
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        \revert MultiMeasureRest.staff-position
      }
    >>
    r2 es,2(\pp |
    f2~) f8 r r4 |
    R1\pocoRit |
    r2\solo r4 es'4(\p\pocoAPocoRall |
    es4)( d2 des4~\dim | 
    des4\!\rit c es\smorz a, |
    b8)\aTempo r r4 r2 |
    R1*8 |
    \bar "|."
    \mBreak
  }
}

clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \tempo "Andante sostenuto" 4 = 56
  \key b \major
  \relative c' {
    % p1 1
    \partial 2 
    <<
      \new CueVoice {
        \clef bass
        \set instrumentCueName = "Vcl."
        \stemDown \voiceOne {
          r4 g( |
          gis4 a) r gis8( a |
          ais8 c h2) r4 |
        }
      }
      {
        r4 r4 |
        \override MultiMeasureRest.staff-position = #-6
        R1*2 |
        \revert MultiMeasureRest.staff-position
      }
    >>
    \clef violin
    \stemNeutral
    % FIXME: Cannot hide the (useless) cautionary accidentals here
    b2.(\p\solo a4 |
    b4. h8 c2~) |
    c2 r |
    R1*5 |
    r4 r4\fermata r4 r4 |
    R1*3 |
    r2 r4\fermata r4 |
    r4 as2(\p f4 |
    \time 2/4 \bar "||"
    g2) |
    \time 4/4 \bar "||"
    R1
    \time 2/4 \bar "||"
    R2 |
    \time 4/4 \bar "||"
    \mBreak

    % p1 2
    \mark #1
    R1*5 |
    r2 \tuplet 3/2 { g8(\mf c\cresc e\! } \tuplet 3/2 { g c cis } |
    d8) r8 r4 r2 |
    b2~\f b8(a gis a) |
    b8.( a16\cresc b4. a8 b h) |
    d2~\ff d8( cis c8. cis16) |
    \mBreak

    % p1 3
    d2~ d8( cis) c16( e, f a |
    c8) r8 r4 r2 |
    r2 r4\fermata r4 |
    R1 |
    \time 2/4 \bar "||"
    R2 |
    \time 4/4 \bar "||"
    \mark #2
    R1*2\rit |
    R1*2 \aTempo |
    <<
      \new CueVoice {
        \set instrumentCueName = "Cl.I"
        \stemDown {
          r2 f4.( d'8~ |
          d8 c) \hideNotes r4 r2 \unHideNotes |
        }
      }
      {
        \override MultiMeasureRest.staff-position = #-4
        R1 |
        \revert MultiMeasureRest.staff-position
        r2 r4 \tuplet 6/4 { b,,16(\p\solo des b des b des } |
      }
    >>
    \bar "||"
    \mBreak

    % p1 4
    \mark #3
    \tempo "Più animato"
    a8) r8 r4 r4 \tuplet 6/4 { b'16(\p des b des b des } |
    a?8) r8 r4 r2 |
    r2 \tuplet 6/4 { a,16(\mf c a c a c} b8) r8 |
    c1~\mf |
    c8 r8 a2.~\pocoAPocoAccelAlD |
    \mBreak

    % p1 5
    a8 r8 r4 r2 |
    r2 e'2(\ff |
    es8) c4 c8 c r r4 |
    \mark #4
    \repeat tremolo 8 { c'32( d } \repeat tremolo 8 { c32 d) } |
    \repeat tremolo 8 { c32( d } \repeat tremolo 8 { c32 d } |
    c8)\sec r8 r4 r2 |
    \mBreak
    
    % p1 6
    r2 c'8\ff f,16 f f8 f16 f |
    \bar "||"
    \mark #5
    \tempo "Allegro non troppo"
    d8 r8 r4 \repeat tremolo 8 { des32(\mf b } |
    d8) r8 r4 \repeat tremolo 8 { des32( b } |
    d8) r8 r4 \repeat tremolo 8 { ges32( des } |
    d8) r8 r4 \repeat tremolo 8 { d32( b) } |
    \mBreak
    
    % p1 7
    \repeat tremolo 8 { d32( h)\cresc } \repeat tremolo 8 { dis32( h } |
    c8) r8 r4 \repeat tremolo 8 { es?32(\mf c } |
    e8) r8 r4 \repeat tremolo 8 { es32( c } |
    e8) r8 r4 \repeat tremolo 8 { as32(\piuF es } |
    e8) r8 r4 \repeat tremolo 8 { e32(\cresc c } |
    es8) r8 r4 c,2~\f |
    \mBreak
    
    % p1 8
    c8 r8 r4 r2 |
    R1 |
    \mark #6
    f'8(\p e es d des c h b |
    a8) r8 r4 r2 |
    \repeat tremolo 8 { a32(\ff gis } \repeat tremolo 8 { a gis } |
    a8)\sec r8 r4 r2 |
    R1*5 |
    \mBreak
    
    % p1 9
    a8-.\f gis16-. gis-. g8-. fis16-. fis-. f8-. e16-. e-. dis-. dis-. e-. e-. | 
    \mark #7
    d8-. r8 r4 r2 |
    R1*4 |
    r2 r4 f'8.(\f g,16 |
    as8) r8 r4 r2 |
    r4 b,2 b8 r |
    \mBreak
    
    % p1 10
    \tuplet 6/4 { b'16(\f a g fis g a } \repeat unfold 3 \tuplet 6/4 { b16 a g fis g a } |
    h8) r8 r4\pocoRit r2 |
    \bar "||"
    \mBreak
    
    % p2 1
    \mark #8
    \tempo "Più largamente"
    R1*12 |
    \tempo "Lento"
    R1 \fermata |
    \bar "||"
    \tempo Andante
    <<
      \new CueVoice {
        \set instrumentCueName = "Cl.I"
        \stemDown {
          d4( f8 es d c~ \tuplet 3/2 { c d es } |
        \bar "||"
        \time 2/4
          d2) |
        }
      }
      {
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        \revert MultiMeasureRest.staff-position
        \bar "||"
        \time 2/4
        R2 |
      }
    >>
    \bar "||"
    \time 4/4
    r4 as2(\pp\solo g8 fis |
    g8) r8 r4 r2 |
    R1 |
    R1*2\p\rit |
    \mBreak

    % p2 2
    \bar "||"
    \mark #9
    \tempo "Allegro non troppo (Tempo I)"
    g,8.(\mf\solo a16 b8. c16 d8. fis16 g8. g,16) |
    a8.( g'16 g8. g,16 a8. g'16 g8. a,16) |
    b8.( c16 d8. fis16\cresc g8. a16 b8. b,16) |
    c8.( b'16 b8. c,16 des8.\< b'16 des8.\sfz\> c16)\! |
    \mBreak
    
    % p2 3
    b8.( a16 g8. e16 cis8.\cresc b16 a8. g16) |
    d'8.(\f es16 d8. g16 d8. es16 d8. g16 |
    d8) r8 r4 r2 |
    g16(\ff\< a g a b\sfz\> a b a g\< a g b des\sfz\> b des b)\! |
    \mBreak
    
    % p2 4
    g8.(\< a16 b8.\sfz\> a16 g8.\< b16 des8.\sfz\> b16\! |
    \mark #10
    g8) r8 r4 r2 |
    \repeat tremolo 8 { des'32(\mf b } \repeat tremolo 8 { des32 b } |
    a8) r8 r4 r2 |
    \repeat tremolo 8 { as32( ces } \repeat tremolo 8 { as32 ces } |
    b8) r8 r4 r2 |
    R1*2 |
    \mBreak
    
    % p2 5
    dis,8.(\mf\solo h'16 h8. dis,16 e8. h'16 h8. e,16) |
    e8 r8 r4 r2 |
    a16\f( h a h c d? c d) e8.( c'16\cresc c8.\! e,16 |
    \mark #11
    fis8) r8 r4 a,2~\sempreFf\! |
    \mBreak
    
    % p2 6
    a8 r8 r4 a2~ |
    a8 r8 r4 r2 |
    fis2~ fis8 r8 r4 |
    fis4( f2) f8 r8 |
    \mark #12
    r16 c''?(\ff d? es? d8-^ c) r16 c( d es d8-^ c) |
    R1 |
    \mBreak
    
    % p2 7
    r16 f,( g as g8-^ f) r16 as( b ces b8-^ as) |
    R1 |
    \tuplet 6/4 { f16( e d cis d e } fis8) r8 \tuplet 6/4 { f16( e d cis d e } fis8) r8 |
    \mBreak
    
    % p2 8
    d8[\ff r16 d]\mf d8. d16 es8. es16\crescMolto es8. e16 |
    f8. f16 f8. f16 f8. f16 f8. fis16 |
    \mark #13
    g8\fff r8 r4 es?8 r8 r4 |
    d8 r8 r4 d8\sempreFf r8 r32 d,( e fis g a b c) |
    \mBreak
    
    % p2 9
    d8.( c'16 b8. a16 g8. f16 e8. f16) |
    g8.( f16 e8. d16 cis8. b16 a8. b16 |
    a8. b16 a8. e'16 a,8) r8 r4 |
    cis16( c h b a as g ges f) r16 r8 r4 |
    \mBreak

    % p2 10
    \repeat tremolo 8 { c'32( d } \repeat tremolo 8 { c32 d) } |
    \repeat tremolo 8 { c32( d } \repeat tremolo 8 { c32 d } |
    c8)\sec r8 r4 r2 |
    r2 c'8 f,16 f f8 f16 f |
    \mark #14
    d8 r8 r4 \repeat tremolo 8 { des32(\mf b } |
    d8) r8 r4 \repeat tremolo 8 { des32( b } |
    \mBreak
    
    % p2 11
    d8) r8 r4 \repeat tremolo 8 { ges32( des } |
    d8) r8 r4 \repeat tremolo 8 { d32( b) } |
    \repeat tremolo 8 { d32( h } \repeat tremolo 8 { dis\cresc h } |
    c8) r8 r4 \repeat tremolo 8 { es?32(\mf c } |
    e8) r8 r4 \repeat tremolo 8 { es32( c } |
    e8) r8\piuF r4 \repeat tremolo 8 { as32( es } |
    e8) r8 r4 \repeat tremolo 8 { e32(\cresc c } |
    \mBreak

    % p2 12
    es8) r8 r4 c,2~\f |
    c8 r8 r4 r2 |
    r2 d'8\ff a16 a a'8.-^ a,16 |
    \mark #15
    a8 r d, r dis r e r |
    f8 r fis r r4 e8 r |
    d8 r r4 d8 r r4 |
    \mBreak
    
    % p2 13
    a'8 r r4 r2 |
    R1 \rall |
    \bar "||"
    \mark #16
    \tempo "Più largamente"
    R1*6 |
    r2 r4 es'8(\f f |
    fis8) r r4 r2 |
    R1*6\pocoString |
    R1*5\rall |
    \tempo "Lento"
    R1\fermata |
    \bar "||"
    \tempo "Andante"
    R1 |
    \bar "||"
    \time 2/4 |
    R2 |
    \bar "||"
    \time 4/4
    \mBreak
    
    % p3 1
    <<
      {
        \override MultiMeasureRest.staff-position = #+2
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "3.Cor."
        \stemDown {
          f,4 a8 g \tuplet 3/2 { f e dis } \tuplet 3/2 { e f g } |
        }
      }
    >>
    fis2.(\p\< eis8\> fis\! |
    g2.)(\< fis8\> e\! |
    dis4) r4\pocoRit r2 |
    \mark #17
    \tempo "Allegro non troppo"
    h1~\mf |
    h1~\cresc |
    h8\! r r4 r2 |
    R1 |
    as'1(\f |
    g8) r r4 g'8 c,16 c e8. e16 |
    \mBreak
    
    % p3 2
    \mark #18
    \repeat tremolo 8 { e32( g } d8) r r4 |
    \repeat tremolo 8 { e32( g } d8) r r4 |
    r2 r4 a8. b16 |
    c8. b16 a8.\cresc b16\! c8. fis,16 g8. a16 |
    \mark #19
    b8\! r r4 r2 |
    r2 g2~\f |
    g8 r r4 g2( |
    \mBreak
    
    % p3 3
    f8) r r4 b'2(\f\< |
    h8)\sfz r r4 f,2~\ff |
    f8 r r4 r2 |
    \mark #20
    fis'8.(\f gis16 a8. h,16\! cis8.\cresc eis16 fis8. g16 |
    a8) r r4 r2 |
    as,8.(\ff b?16 ces8. des16 es?8. g?16 as8. b?16) |
    \mBreak

    % p3 4
    h8.( cis,16 d8. e16 fis8. ais16 h8. cis16) |
    d8.( e,16 f8.\cresc g16\! a8. cis,16 d8. e16 |
    \mark #21
    f8) r f,8 r \tuplet 6/4 { as16( g f e f g } a8) r8 |
    as8.\ff a16\mf as8. a16\crescMolto a8. b16 \tuplet 3/2 { a8( b h } |
    \mBreak
    
    % p3 5
    c8.) des16\sempreCresc c8. des16 c8. des16 c8. c16 |
    d8\fff r r4 h8 r r4 |
    fis'8 r r4 fis8 r c-^ \tuplet 3/2 { c16-^ c-^ c-^ } |
    \mark #22
    e8\sec\sempreFff r e8. dis16 e8. d16 e8. es16 |
    \mBreak
    
    % p3 6
    g8 r r4 r2 |
    h8 r \tuplet 3/2 { es,?-^ es-^ d-^ } es-^ r8 r4 |
    \tuplet 3/2 { as8 as es } as8. es16 as8. es16 as8. es16 |
    f8 r \tuplet 3/2 { f8-^ f-^ f-^ } f8 r r4 |
    \mBreak
    
    % p3 7
    \tuplet 3/2 { f8\tuttaForza f f } \repeat unfold 3 { f8. f16 } |
    f8\sec r r4 \afterGrace r2 { c16( d es } |
    f8) r r4 r4 b,?(\fCantabile\solo |
    \bar "||"
    \mark #24
    \tempo "Più largamente"
    h4 c2 h8 c |
    cis8 es? d2) d4( |
    f4 es2)(\cresc d8\! es |
    e8 g f2) r4 |
    \mBreak
    
    % p3 8
    r2 f,8(\!\< fis g es') |
    d4(\! des\pocoString c h |
    \bar "||" 
    \tempo "Tempo I"
    b8) r r4 r2 |
    r8 r16\ff\< f( g4 g8\> f8~\! \tuplet 3/2 { f8 es d } | 
    f8) r r4 r2 |
    r8 r16\ff\< f( g4~ g8\> f8~\! \tuplet 3/2 { f8 es d } | 
    \mBreak
    
    % p3 9
    f8. es16 g8. d16 f8. es16 a8. e16 |
    g8 f) b4.(\string a8 b h |
    c8) r r4 g4.(\ff\< b8\sfz\> |
    c8\! h c cis\sempreString d cis c4) |
    a4.(\< c8\sfz h)\> r8\! r4 |
    R1 |
    \mBreak
    
    % p3 10
    \tuplet 3/2 { es,8\fff es es } \repeat unfold 2 \tuplet 3/2 { es8 es es } \tuplet 3/2 { c8 c c } |
    d8 r r4 r2 |
    \repeat unfold 4 \tuplet 3/2 { es8 es es } |
    \repeat unfold 2 \tuplet 3/2 { es8 es es } \repeat unfold 2 \tuplet 3/2 { c8 c c }
    \mBreak
    
    % p3 11
    \mark #25
    d1~ |
    d2(\< cis4\sfz\> d\! |
    es8)\sec\aTempo r r4 r2 |
    c'16\ff \repeat unfold 15 c |
    b8 r as16 a b h c h c d es d es e |
    \mBreak
   
    % p3 12
    g16 fis f fis g\cresc\string fis f fis g fis\! f fis g fis f fis |
    g16\tuttaForza fis f fis g fis f fis g fis f fis g fis f e |
    \mBreak
    
    % p3 13
    f8\sec r r4 r2 |
    R1*5\pocoAPocoRall |
    \bar "||"
    \tempo Andante
    R1*4 |
    <<
      \new CueVoice {
        \set instrumentCueName = "Fag.III"
        \stemUp {
        r4 f,(\ppEspr es as, |
        es'4. f8 f2~)\dim |
        f8\! r8 r4 r2 |
        }
      }
      {
        \override MultiMeasureRest.staff-position = #2
        R1*3 |
        \revert MultiMeasureRest.staff-position
      }
    >>
    \bar "||"
    \tempo "Più lento"
    R1*4 |
    \bar "||"
    \tempo Adagio 
    <<
      \new CueVoice {
        \set instrumentCueName = "Ob."
        \stemDown {
          f'4( es) r8 d( c b) |
        }
      }
      {
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        \revert MultiMeasureRest.staff-position
      }
    >>
    r2 c,2(\pp |
    d2~) d8 r r4 |
    R1*13 |
    \bar "|."
    \mBreak
  }
}
% ---------------------------------------------------------

%{
\bookpart {
  \header{
    instrument = "Klarinette I in A"
  }
  \score {
    \new Staff {
      \compressEmptyMeasures
      \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose a a \clarinet_I
      }
    }
  }
}


\bookpart {
  \header{
    instrument = "Klarinette II in A"
  }
  \score {
    \new Staff {
      \compressEmptyMeasures
      \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose a a \clarinet_II
      }
    }
  }
}
%}

\bookpart {
  \header{
    instrument = "Klarinette I in Bb"
  }
  \score {
    \new Staff {
      \compressEmptyMeasures
      \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose b a \clarinet_I
      }
    }
  }
}


\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
  }
  \score {
    \new Staff {
      \compressEmptyMeasures
      \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose b a \clarinet_II
      }
    }
  }
}