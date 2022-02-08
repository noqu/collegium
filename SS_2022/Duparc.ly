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
  title = "Lenore"
  subtitle = "Sinfonische Dichtung"
  composerShort = "Henri Duparc"
  composer = "Henri Duparc (1848 - 1933)"
  tagline = ""
}

% Adapt this for automatic line-breaks
% mBreak = {}
mBreak = { \break }
#(set-global-staff-size 17)

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
pocoF = _\markup { \italic "poco" \dynamic f }
ffz = _\markup { \dynamic { ffz } } 
crescMolto = _\markup { \italic "cresc. molto" }
pMoltoCresc = _\markup { \dynamic p \italic "molto cresc." }
ppiuEspress = _\markup { \dynamic p \italic "più espress." }
pocoCresc = _\markup { \italic "poco cresc." }
mfEspress = _\markup { \dynamic mf \italic "espress." }
pEspress = _\markup { \dynamic p \italic "espress." }
stringendo = ^\markup { \italic "stringendo" }
pocoString = ^\markup { \italic "poco string." }
sempreStringendo = ^\markup { \italic "sempre stringendo" }
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
pocoAPocoAccel = ^\markup {\italic {"poco a poco accel."} }
pocoAPocoAccelAlD = ^\markup {\italic {"poco a poco accel. al D"} }
sempreAccel = ^\markup {\italic {"sempre accel."} }
solo = ^\markup { "Solo" }
piuF = _\markup { \italic "più" \dynamic f }
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

clarinet_I = {
  \set Score.markFormatter = #format-mark-alphabet
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \defaultTimeSignature
  \time 4/4
  \tempo "Andante sostenuto" 4 = 56
  \key b \major
  \relative c' {
    % p3
    \partial 2 r2 |
    R1*2 |
    d2(\p cis |
    d2 e~) |
    e2 r |
    R1*3 |
    f'4(\p\< b2 \>a4)~\! |
    \mBreak
    
    % p4
    a4 r4 r2 |
    r4 r4\fermata r2 |
    a,2(\p b) |
    a2( b)\cresc |
    h4( c4. cis8 d4 |
    es2)~\dim\rit es4\fermata\! r4\aTempo |
    r4 fes,2( es8 d|
    \time 2/4 \bar "||"
    es2) |
    \time 4/4 \bar "||"
    b'4(\mfEspress des8 ces \tuplet 3/2 { b as g } \tuplet 3/2 { as b c }
    \time 2/4 \bar "||"
    \mBreak
    
    % p5
    b2)( |
    \time 4/4 \bar "||"
    \mark #1
    es8.\sfz\> d16)\! d8 r8 r2 |
    r2 \tuplet 3/2 { r8 a(\p c } \tuplet 3/2 { d es e) } |
    f8.(\sfz\> e16)\! e8 r8 r2 |
    R1 |
    r2 \tuplet 3/2 { r8 g,,(\mf c } \tuplet 3/2 { e g c } |
    \mBreak
    
    % p6
    h8) r8 r4 r2 |
    r16 g,(\f b d e g b d cis8) r8 r4 |
    r16 g,(\f b d e g b d cis8) r8 r4 |
    r2 r4 b'8 h |
    d2(\ff d8)( cis c8. cis16) |
    \mBreak
    
    % p7
    d2~ d8( cis c) r |
    c,8( cis\dim d)\! r r2 |
    r2\riten r4\fermata r4\aTempo |
    r4 ges,2(\pp es4 |
    \time 2/4 \bar "||"
    f2) |
    \time 4/4 \bar "||"
    \mark #2
    R1 |
    f'4.(\pEspress\pocoRit g8 gis\< as c8.\> b16 |
    \mBreak
    
    % p8
    c,4)\aTempo r4\!\pocoAPocoAccel r2 |
    r8 f(\pocoF g a g8. f16) f8 r8 |
    r2 f4.\f\<( d'8)~ |
    d8(\!\sempreAccel c) r4 r \tuplet 6/4 { ges,16(\p as ges as ges as } |
    \bar "||"
    \mark #3
    \tempo "Più animato"
    f8) r8 r4 r \tuplet 6/4 { ges'16(\p as ges as ges as } |
    \mBreak
    
    % p9
    f8) r8 r4 r2 |
    r2 \tuplet 6/4 { f,16(\mf g f g f g} ges8) r8 |
    es1~\mf |
    es8 r8 f2.~\pocoAPocoAccelAlD |
    f8 r8 r4 r2 |
    \mBreak
    
    % p10
    R1 |
    es''2\startTrillSpan \slashedGrace d8\stopTrillSpan es8 r8 r4 |
    \mark #4
    \repeat tremolo 8 { f,32( a } \repeat tremolo 8 { f32 a) } |
    \repeat tremolo 8 { f32( a } \repeat tremolo 8 { f32 a } |
    f8)\sec r8 r4 r2 |
    \mBreak
    
    % p11
    r2 c'8\ff f,16 f f'8 f,16 f |
    \bar "||"
    \mark #5
    b8 r8 r4 \repeat tremolo 8 { ges32(\mf as } |
    f8) r8 r4 \repeat tremolo 8 { ges32( as } |
    f8) r8 r4 \repeat tremolo 8 { ges32( as } |
    f8) r8 r4 \repeat tremolo 8 { f32( g) } |
    \mBreak
    
    % p12
    \repeat tremolo 8 { g32( as)\cresc } \repeat tremolo 8 { g32( a } |
    g8) r8 r4 \repeat tremolo 8 { as32(\mf b } |
    g8) r8 r4 \repeat tremolo 8 { as32( b } |
    g8) r8 r4 \repeat tremolo 8 { as32(\piuF b } |
    g8) r8 r4 \repeat tremolo 8 { g32(\cresc a } |
    \mBreak
    
    % p13
    g8) r8 r4 e,2(\f |
    es8) r8 r4 r2 |
    \repeat unfold 2 { \tuplet 6/4 { f'16( e d cis d e) } } \tuplet 6/4 { f16( e d cis d e } f8) r8 |
    \mark #6
    f'8(\p e es d) des( c h b) |
    a8 r8 r4 r2 |
    \mBreak
    
    % p14
    \repeat tremolo 8 { e32( f } \repeat tremolo 8 { e f) } \acciaccatura e8 |
    % FIXME: I can't get the grace note into the previous bar
    f8\sec r8 r4 r2 |
    R1*2 |
    g,,8.(\mf\< f'16) f8\! r8 as,8.(\< f'16 as8.\sfz\> g16\! | 
    \mBreak
    
    % p15
    f8) r8 r4 r2 |
    R1 |
    d'8-.\f e16-. e-. es8-. d16-. d-. cis8-. c16-. c-. h-. h-. cis-. cis-. | 
    \mark #7
    d8-. r8 r4 r2 |
    R1 |
    \mBreak
    
    % p16
    R1*2 |
    f,8.(\mf g16 a8. b16 c8. e16 f8. f,16) |
    ges8.( f'16 f8.\crescMolto ges,16 g8. f'16 f8. g16 |
    as8) r8 r4 r2 |
    \mBreak
    
    % p17
    r4 g,2\startTrillSpan \grace fis8 \stopTrillSpan  g r |
    \tuplet 6/4 { b'16( a g fis g a } \repeat unfold 3 \tuplet 6/4 { b16 a g fis g a } |
    h8)\pocoRiten r8 r4 r2 |
    \bar "||"
    \mark #8
    \tempo "Più largamente"
    r4 d,,32(\p e d e d e d e d8) r8 d32( e d e d e d e |
    \mBreak
    
    % p18
    d8) r d32( e d e d e d e d8) r d32( e d e d e d e |
    d8) r d32( e d e d e d e d8) r d32( e d e d e d e |
    d8\pocoCresc) r d32( e d e d e d e d8) r r4 |
    \mBreak
    
    % p19
    R1*2 |
    e4.(\p f8 fis8) r r4 |
    R1\pocoString |
    R1*2 |
    \mBreak
    
    % p20
    R1 \sempreStringendo a4.(\f\< c8\sfz\> h)\!\rall r r4 |
    r2 \lento r4\fermata r |
    \bar "||"
    \tempo Andante
    d4(\ppiuEspress f8 es d c~ \tuplet 3/2 { c d es } |
    \bar "||"
    \time 2/4
    d2) |
    \bar "||"
    \time 4/4
    r4 as'2(\pp g8 fis |
    g8) r8 r4 r2 |
    R1 |
    \mBreak
   
    % p21
    R1 \pocoRit |
    \bar "||"
    \mark #9
    \tempo "Allegro non troppo"
    g,,8.(\mf a16 b8. c16 d8. fis16 g8. g,16) |
    a8.( g'16 g8. g,16 a8. g'16 g8. a,16) |
    b8.( c16 d8. fis16\cresc g8. a16 b8. b,16) |
    c8.( b'16 b8. c,16 des8.\< b'16 des8.\sfz\> c16)\! |
    \mBreak
    
    % p22
    b8.( a16 g8. e16\cresc cis8. b16 a8. g16) |
    d'8.(\f es16 d8. g16 d8. es16 d8. g16 |
    d16)( dis e f fis g gis a\cresc b h c cis d dis e fis |
    g8)\ff r8 b,16( a b a g a g b des b des b |
    g8) r8 r4 r2 |
    \mBreak
    
    % p23
    \mark #10
    R1 |
    \repeat tremolo 8 { f'32( g } \repeat tremolo 8 { f32 g } |
    f8) r8 r4 r2 |
    \repeat tremolo 8 { es32( f } \repeat tremolo 8 { es32 f } |
    es8) r8 r4 r2 |
    R1*2 |
    \mBreak
  }
}

clarinet_II = {
  \set Score.markFormatter = #format-mark-alphabet
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \defaultTimeSignature
  \time 4/4
  \tempo "Andante sostenuto" 4 = 56
  \key b \major
  \relative c' {
    % p3
    \partial 2 r2 |
    R1*2 |
    b2.(\p a4 |
    b4. h8 c2~) |
    c2 r |
    R1*4 |
    \mBreak
    
    % p4
    R1 |
    r4 r4\fermata r2 |
    a'2(\p b) |
    a2( b)\cresc |
    h4( c4. cis8 d4 |
    es2)~\dim\rit es4\fermata\! r4\aTempo |
    r4 as,,2( f4 |
    \time 2/4 \bar "||"
    g2) |
    \time 4/4 \bar "||"
    R1
    \time 2/4 \bar "||"
    \mBreak
    
    % p5
    R2 |
    \time 4/4 \bar "||"
    R1*5 |
    \mBreak
    
    % p6
    r2 \tuplet 3/2 { g8(\mf c e } \tuplet 3/2 { g c cis } |
    d8) r8 r4 r2 |
    h2~\f h8(a gis a) |
    h8.( a16\cresc h4. a8 b h) |
    d2~\ff d8( cis c8. cis16) |
    \mBreak

    % p7
    d2~ d8( cis) c16( e, f a) |
    c8 r8 r4 r2 |
    r2\riten r4\fermata r4\aTempo |
    R1 |
    \time 2/4 \bar "||"
    R2 |
    \time 4/4 \bar "||"
    \mark #2
    R1 R1\pocoRit |
    \mBreak
    
    % p8
    R1 \aTempo\pocoAPocoAccel R1*2 |
    r2\sempreAccel r4 \tuplet 6/4 { b,16(\p des b des b des } |
    \bar "||"
    \mark #3
    \tempo "Più animato"
    a8) r8 r4 r4 \tuplet 6/4 { b'16(\p des b des b des } |
    
    % p9
    a8) r8 r4 r2 |
    r2 \tuplet 6/4 { a,16(\mf c a c a c} b8) r8 |
    c1~\mf |
    c8 r8 a2.~\pocoAPocoAccelAlD |
    a8 r8 r4 r2 |
    \mBreak
    
    %p10
    r2 e'2(\ff |
    es8) c4 c8 c r r4 |
    \mark #4
    \repeat tremolo 8 { c'32( d } \repeat tremolo 8 { c32 d) } |
    \repeat tremolo 8 { c32( d } \repeat tremolo 8 { c32 d } |
    c8)\sec r8 r4 r2 |
    \mBreak
    
    % p11
    r2 c'8\ff f,16 f f8 f16 f |
    \bar "||"
    \mark #5
    b8 r8 r4 \repeat tremolo 8 { des,32(\mf b } |
    d8) r8 r4 \repeat tremolo 8 { des32( b } |
    d8) r8 r4 \repeat tremolo 8 { ges32( des } |
    d8) r8 r4 \repeat tremolo 8 { d32( b) } |
    \mBreak
    
    % p12
    \repeat tremolo 8 { d32( h)\cresc } \repeat tremolo 8 { dis32( h } |
    c8) r8 r4 \repeat tremolo 8 { es32(\mf c } |
    e8) r8 r4 \repeat tremolo 8 { es32( c } |
    e8) r8 r4 \repeat tremolo 8 { as32(\piuF es } |
    e8) r8 r4 \repeat tremolo 8 { es32(\cresc c } |
    \mBreak
    
    % p13
    es8) r8 r4 c,2~\f |
    c8 r8 r4 r2 |
    R1 |
    \mark #6
    f'8(\p e es d) des( c h b) |
    a8 r8 r4 r2 |
    \mBreak
    
    % p14
    \repeat tremolo 8 { a32( gis } \repeat tremolo 8 { a gis) } |
    a8\sec r8 r4 r2 |
    R1*3 |
    \mBreak
    
    % p15
    R1*2 |
    a8-.\f gis16-. gis-. g8-. fis16-. fis-. f8-. e16-. e-. dis-. dis-. e-. e-. | 
    \mark #7
    d8-. r8 r4 r2 |
    R1 |
    \mBreak
    
    % p16
    R1*3 |
    r2 r4 f'8.(\f g,16 |
    as8) r8 r4 r2 |
    \mBreak
    
    % p17
    r4 b,2\startTrillSpan b8\stopTrillSpan r |
    \tuplet 6/4 { b'16( a g fis g a } \repeat unfold 3 \tuplet 6/4 { b16 a g fis g a } |
    h8)\pocoRiten r8 r4 r2 |
    \bar "||"
    \mark #8
    \tempo "Più largamente"
    R1
    \mBreak
    
    % p18
    R1*3 |
    \mBreak
    
    % p19
    R1*6 |
    \mBreak
    
    % p20
    R1 \sempreStringendo |
    R1 |
    r2 \lento r4\fermata r |
    \bar "||"
    \tempo Andante
    R1 |
    \bar "||"
    \time 2/4
    R2 |
    \bar "||"
    \time 4/4
    r4 as2(\pp g8 fis |
    g8) r8 r4 r2 |
    R1 |
    \mBreak
   
    % p21
    R1 \pocoRit |
    \bar "||"
    \mark #9
    \tempo "Allegro non troppo"
    g,8.(\mf a16 b8. c16 d8. fis16 g8. g,16) |
    a8.( g'16 g8. g,16 a8. g'16 g8. a,16) |
    b8.( c16 d8. fis16\cresc g8. a16 b8. b,16) |
    c8.( b'16 b8. c,16 des8.\< b'16 des8.\sfz\> c16)\! |
    \mBreak
    
    % p22
    b8.( a16 g8. e16\cresc cis8. b16 a8. g16) |
    d'8.(\f es16 d8. g16 d8. es16 d8. g16 |
    d8) r8 r4 r2 |
    g16(\ff a g a b a b a g a g b des b des b) |
    g8.(\< a16 b8.\sfz\> a16 g8.\< b16 des8.\sfz\> b16\! |
    \mBreak
    
    % p23
    \mark #10
    g8) r8 r4 r2 |
    \repeat tremolo 8 { des'32( b } \repeat tremolo 8 { des32 b } |
    a8) r8 r4 r2 |
    \repeat tremolo 8 { as32( ces } \repeat tremolo 8 { as32 ces } |
    b8) r8 r4 r2 |
    R1*2 |
    \mBreak
  }
}
% ---------------------------------------------------------

\bookpart {
  \header{
    instrument = "Klarinette I und II in A"
  }
  \score {
    <<
    \transpose a a \clarinet_I
    \\
    \transpose a a \clarinet_II
    >>
  }
}
