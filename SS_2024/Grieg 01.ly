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
  title = "01 Vorspiel"
  subtitle = "Peer Gynt"
  composerShort = "Edvard Grieg"
  composer = "Edvard Grieg (1843 - 1907)"
  version = "v1"
}

% Adapt this for automatic line-breaks
% mBreak = {}
% pBreak = {}
mBreak = { \break }
pBreak = { \pageBreak }
#(set-global-staff-size 18)

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
  oddFooterMarkup = \markup
  \fill-line \fontsize #-2.0 {
    " "
    \fromproperty #'header:version
    " "
  }
  % Distance between title stuff and music
  markup-system-spacing.basic-distance = #12
  markup-system-spacing.minimum-distance = #12
  markup-system-spacing.padding = #10
  % Distance between music systems
  system-system-spacing.basic-distance = #13
  system-system-spacing.minimum-distance = #13
  % system-system-spacing.padding = #10
  
}

% This allows the use of \startMeasureCount and \stopMeasureCount
% See https://lilypond.org/doc/v2.23/Documentation/snippets/repeats#repeats-numbering-groups-of-measures
\layout {
  \context {
    \Staff
    \consists #Measure_counter_engraver
  }
}

% ---------------------------------------------------------

clarinet_I = {
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 2/4
  \tempo "Allegro con brio."
  \key f \major
  \clef violin
  \relative c' {
    % cl1 p1 1
    a''4->\f b-> |
    a4-> b-> |
    a2-> |
    a8-.-> a-.-> r4 |
    a4-> b-> |
    a4-> b-> |
    a2-> |
    g8-.-> g-.-> r4 |
    \mBreak
    
    % cl1 p1 2
    e8-.\p r e-. r |
    e4->~ e8 r |
    e8 r e-. r |
    e4->~ e8 r |
    d8-. r d-. r|
    d4->~ d8 r |
    d8-. r d-. r |
    \mBreak
    
    % cl1 p1 3
    d4->~ d8 r |
    d'4->~\f d8 r |
    c4->~ c8 r |
    R2*2 |
    h4->~\f h8 r |
    a4->~ a8 r |
    R2*2 |
    \mark #1
    R2*3 |
    \mBreak
    
    % cl1 p1 4
    c2->\f\< |
    a8-.->\ff a-. b-. b-. |
    a8-.-> a-. b-. b-. |
    \repeat unfold 4 { a8-.-> a-. a-. a-. } |
    R2 |
    R2 \fermata |
    \mBreak
    
    % cl1 p1 5
    \time 4/4
    \tempo "Poco Andante."
    R1 |
    r2 r4 a,4(\p |
    d4 e8\< f g4 a8 b) |
    b8(\> a) a f\! d4 d8(\< f) |
    f8(\> e) e %{ QQ cis\! %} des\! \acciaccatura %{ QQ cis8 %} des8 a4~ a8 r |
    \mBreak
    
    % cl1 p1 6
    a'2\p~ a4 r |
    R1*4 |
    a,8( %{ QQ cis %} des  e f d4\< a'8 gis |
    e4 g8 fis d4.)\! d8( |
    f8\> e) e-. d-. a'4~ a8\! r |
    R1*3 |
    \mBreak
    
    % cl1 p1 7
    \mark #2
    \time 2/4
    \tempo "Un poco Allegro."
    R2*16 |
    <<
      { 
        \override MultiMeasureRest.staff-position = #0
        R2*2
        \cueClefUnset |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \cueClef "alto"
        \stemDown 
        g,,2^"Viola Solo" |
        d2\fermata
        \stemNeutral |
      }
    >>
    \time 4/4
    \tempo "Poco Andante."
    b''8(\p d f ges\< es4 b'8 a |
    f4 as8 \! g es4.) es8 |
    \time 2/4
    ges8(\> f) f es \! |
    \mBreak
    
    % cl1 p1 8
    \time 3/4
    \tempo "Vivace."
    b'2.~ |
    b4 r r |
    R2.*16 | R2.\fermata
    \bar "||"
    \mark 3
    \time 4/4
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*2
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \stemUp
        r4 h,(^"Viol.I" c) g' |
        fis4 f e es |
        \stemNeutral
      }
    >>
    R1*2
    \mBreak
    
    % cl1 p1 9
    \bar "||"
    \key g \major
    r4 dis(\f\< e h')
    ais4(\ff\>^\markup \italic "molto ten." a gis g)\!
    e2(->\p\> dis4 cis) |
    h2\pp( b4)\fermata r4
    \bar "||"
    \key f \major
    \time 2/4
    \tempo "Allegro con brio."
    a'4->\f b-> |
    a4-> b-> |
    \mBreak
    
    % cl1 p1 10
    a2-> |
    a8-.-> a r4 |
    a4-> b-> |
    a4-> b-> |
    a2-> |
    g8-.-> g-. r4 |
    R2*2 |
    \mBreak

    % cl1 p2 1
    r4 c8-.-> c-. |
    R2 |
    \mark #4
    b4-> c-> |
    b4-> c-> |
    b2-> |
    b8-.-> b-. r4 |
    b4-> c-> |
    b4-> c-> |
    b2-> |
    \mBreak

    % cl1 p2 2
    b8-.-> a-.-> r4 |
    R2*2 |
    r4 f8-.-> f-. |
    R2 |
    g8-.[\p r16 es16( c8) r16 es(] |
    g4->)~ g8 r8 |
    g16( a g es c es g c) |
    \mBreak

    % cl1 p2 3
    g4->~ g8 r8 |
    \repeat unfold 2 {
      b,-. r b-. r |
      b4->~ b8 r |
    }
    R2*4 |
    f'8-.[ r16 d16( _\markup \italic "più cresc." b8) r16 d(] |
    f4->)~ f8 r8 |
    \mBreak

    % cl1 p2 4
    f16( g f d b d f b) |
    f4->~ f8 r8 |
    d'4->~\f d8 r8 |
    c4->~ c8 r8 |
    R2*2 |
    h4->~ h8 r8 |
    a4->~ a8 r8 |
    R2*2 |
    \mBreak

    % cl1 p2 5
    \mark #5
    R2*3 
    c2->\f |
    a8-.\ff a-. b-. b-. |
    a8-. a-. b-. b-. |
    \repeat unfold 4 { a8-.-> a-. a-. a-. } |
    R2 |
    \mBreak

    % cl1 p2 6
    f8-.[ r16 as16( g8) r16 as(] |
    f8) r r4 |
    f16 g f e c e f as |
    g16->( e) f8-. r4 |
    f8-.[ r16 as16(\cresc g8)\! r16 as(] |
    f8) r r4 |
    \mBreak

    % cl1 p2 7
    f16 g f e h e f as |
    R2 |
    g8-.[\p r16 b16( a8) r16 b(] |
    g8) r r4 |
    g16 a g fis d fis g b |
    a16->( fis) g8-. r4 |
    \mBreak

    % cl1 p2 8
    g8-.[ r16 b16(\cresc a8)\! r16 b(] |
    g8) r r4 |
    g16-> a g fis d fis g b |
    R2 |
    a16->\f h a gis %{ QQ dis %} es g a c |
    R2 |
    \mBreak

    % cl1 p2 9
    h16->\ff %{ QQ cis %} des h ais %{ QQ eis %} f a b d |
    \mark #6
    R2*4 |
    a,2\pCresc |
    c2 |
    e2\f\< |
    g2 |
    f8.->(\ff a16) g8.->( a16) |
    f8.->( a16) g8.->( a16) |
    \mBreak

    % cl1 p2 10
    g16->( e) f8-. r4 |
    R2 |
    f16-> g f d b d f a |
    f16-> g f d b d f a |
    g16->( e) f8-. r4 |
    R2 |
    f16-> g f d b d f a |
    \mBreak

    % cl1 p2 11
    g16->( e) f8-. r4 |
    f16-> g f d b d f a |
    g16->( e) f8-. r4 |
    r4 \acciaccatura e'8 d16->( h) c8-. |
    r4 \acciaccatura a8 g16->( e) f8-. |
    r4 \acciaccatura e'8 d16->( h) c8-. |
    r4 \acciaccatura a8 g16->( e) f8-. |
    \mBreak

    % cl1 p2 12
    r4 \acciaccatura a8 g16->( e) f8-. |
    r4 \acciaccatura a8 g16->( e) f8-. |
    R2*2
    \acciaccatura a8 g16->(\f e) f8-. \acciaccatura a8 g16->( e) f8-. |
    \acciaccatura a8 g16->(\piuF e) f8-. \acciaccatura a8 g16->( e) f8-. |
    r4 c'8-.->\fff c-.-> _\markup \italic "attacca"
    \bar "|."
    \mBreak
  }
}

clarinet_II = {
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 2/4
  \tempo "Allegro con brio."
  \key f \major
  \clef violin
  \relative c' {
    % cl2 p1 1
    f'4->\f e-> |
    f4-> e-> |
    f2-> |
    e8-.-> e-. r4 |
    f4-> e-> |
    f4-> e-> |
    f2-> |
    \mBreak
    
    % cl2 p1 2
    f8-.-> e-. r4 |
    b8-.\p r b-. r |
    b4->~ b8 r |
    b8-. r b-. r |
    b4->~ b8 r |
    b8-. r b-. r|
    \mBreak
    
    % cl2 p1 3
    b4->~ b8 r |
    b8-. r b-. r |
    b4->~ b8 r |
    b'4->~\f b8 r |
    a4->~ a8 r |
    R2*2 |
    \mBreak
    
    % cl2 p1 4
    g4->~\f g8 r |
    f4->~ f8 r |
    R2*2 |
    \mark #1
    R2*3 |
    c2->\f\< |
    f8-.->\ff f-. e-. e-. |
    f8-.-> f-. e-. e-. |
    \mBreak
    
    % cl2 p1 5
    \repeat unfold 4 { f8-.-> f-. f-. f-. } |
    R2 |
    R2 \fermata |
    \mBreak
    
    % cl2 p1 6
    \time 4/4
    \tempo "Poco Andante."
    R1*3 |
    << 
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \stemUp
        b8(^"Clar.I" a) a f d4 d8( f) |
        f8( e) e cis \acciaccatura cis8 a4~ a8 r |
        \stemNeutral
      }
    >>
    d2\p~ d4 r |
    R1*10 |
    \mark #2
    \time 2/4
    \tempo "Un poco Allegro."
    R2*17 |
    R2\fermata |
    \mBreak
    
    % cl2 p1 7
    \time 4/4
    \tempo "Poco Andante."
    R1*2 |
    \time 2/4
    R2 |
    \time 3/4
    \tempo "Vivace."
    R2.*18 |
    R2.\fermata |
    \bar "||"
    \mark 3
    \time 4/4
    << 
      {
        \override MultiMeasureRest.staff-position = #-8
        R1*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \stemUp
        g,8(^"Oboe" h d es c4 g'8 fis) |
        d4( f8 e c4.) c8 |
        \stemNeutral
      }
    >>
    \mBreak
    
    % cl2 p1 8
    R1*2 |
    \bar "||"
    \key g \major
    r4 h2(\f\< e4) |
    e1->\ff\> |
    c2(->\p\> h4 a) |
    g2\pp( g4)\fermata r4
    \bar "||"
    \key f \major
    \time 2/4
    \tempo "Allegro con brio."
    f'4->\f e-> |
    f4-> e-> |
    \mBreak
    
    % cl2 p1 9
    f2-> |
    e8-.-> e-. r4 |
    f4-> e-> |
    f4-> e-> |
    f2-> |
    f8-.-> e-. r4 |
    R2*2 |
    \mBreak
    
    % cl2 p2 1
    r4 c8-.-> c-. |
    R2 |
    \mark #4
    g'4-> fis-> |
    g4-> fis-> |
    g2-> |
    f8-.-> f-. r4 |
    g4-> fis-> |
    g4-> fis-> |
    g2-> |
    \mBreak

    % cl2 p2 2
    e8-.-> f-. r4 |
    R2*2 |
    r4 f8-.-> f-. |
    R2 |
    a,8-.\p r a-. r |
    a4->~ a8 r8 |
    a8-. r a-. r |
    a4->~ a8 r8 |
    \mBreak

    % cl2 p2 3
    g8-. r g-. r |
    g4->~ g8 r8 |
    g8 r g r |
    g4->~ g8 r8 |
    b8\pCresc r b r |
    b4->~ b8 r8 |
    b8 r b r |
    b4->~ b8 r8 |
    \mBreak

    % cl2 p2 4
    b8 _\markup \italic "più cresc." r b r |
    b4->~ b8 r8 |
    b8 r b r |
    b4->~ b8 r8 |
    b'4->~\f b8 r8 |
    a4->~ a8 r8 |
    R2*2 |
    g4->~ g8 r8 |
    \mBreak

    % cl2 p2 5
    f4->~ f8 r8 |
    R2*2 |
    \mark #5
    R2*3 
    c2->\f |
    f8-.\ff f-. e-. e-. |
    f8-. f-. e-. e-. |
    \repeat unfold 2 { f8-.-> f-. f-. f-. } |
    \mBreak

    % cl2 p2 6
    \repeat unfold 2 { f8-.-> f-. f-. f-. } |
    R2*5 |
    f8[ r16 as16(\cresc g8)\! r16 as(] |
    f8) r r4 |
    f16 g f e h e f as |
    R2*5 |
    \mBreak

    % cl2 p2 7
    g8[ r16 b16(\cresc a8)\! r16 b(] |
    g8) r r4 |
    g16-> a g fis d fis g b |
    R2 |
    a16->\f h a gis %{ QQ dis %} es g a c |
    R2 |
    \mBreak

    % cl2 p2 8
    \mBreak

    % cl2 p2 9
    h16->\ff %{ QQ cis %} des h ais %{ QQ eis %} f a b d |
    \mark #6
    R2*4 |
    e,,4.(\p f8\cresc) |
    g4.( a8) |
    b4.(\f\< c8) |
    d4.( e8) |
    f8.->(\ff a16) g8.->( a16) |
    f8.->( a16) g8.->( a16) |
    \mBreak

    % cl2 p2 10
    g16->( e) f8-. r4 |
    R2 |
    f16-> g f d b d f a |
    f16-> g f d b d f a |
    g16->( e) f8-. r4 |
    R2 |
    f16-> g f d b d f a |
    \mBreak

    % cl2 p2 11
    g16->( e) f8-. r4 |
    f16-> g f d b d f a |
    g16->( e) f8 r4 |
    r4 \acciaccatura e8 d16->( h) c8-. |
    r4 \acciaccatura a8 g16->( e) f8-. |
    r4 \acciaccatura e'8 d16->( h) c8-. |
    r4 \acciaccatura a8 g16->( e) f8-. |
    \mBreak

    % cl2 p2 12
    r4 \acciaccatura a8 g16->( e) f8-. |
    r4 \acciaccatura a8 g16->( e) f8-. |
    R2*2
    \acciaccatura a8 g16->(\f e) f8-. \acciaccatura a8 g16->( e) f8-. |
    \acciaccatura a8 g16->(\piuF e) f8-. \acciaccatura a8 g16->( e) f8-. |
    r4 a'8-.->\fff a-.-> _\markup \italic "attacca"
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
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      <<
      {
        \transpose a a \clarinet_I
      }
      \\
      {
        \transpose a a \clarinet_II
      }
      >>
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
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose b a \clarinet_II
      }
    }
  }
}
