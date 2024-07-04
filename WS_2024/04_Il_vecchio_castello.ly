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
  title = "II Il vecchio castello"
  subtitle = "(Das alte Schloss)"
  composerShort = "Modest Mussorgsky"
  composer = "Modest Mussorgsky (1839 - 1881)"
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
  markup-system-spacing.basic-distance = #12
  markup-system-spacing.minimum-distance = #12
  markup-system-spacing.padding = #10
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
    \RemoveEmptyStaves
    % \RemoveAllEmptyStaves
  }
}

% ---------------------------------------------------------

clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 6/8
  \tempo "Andante"
  \key d \major
  \clef violin
  \relative c'' {
    % cl1 p6 1
    \mark #19
    R2.*6 |
    \mark #20
    R2.*7 |
    \mark #21
    R2.*6 |
    \mBreak

    % cl1 p6 2
    \mark #22
    R2.*10 |
    \mark #23
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2.*6 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \transpose c c \relative {
        \key h \major
        \stemUp
        e''4\p^"Vl.I" e8 fis8.( e16) dis8 |
        e4 e8 fis8.( e16) dis8 |
        e4.-- d--\<( |
        a'4.--~\! a8 gis-- fis) |
        e4.-- gis-- |
        \mBreak

        % cl1 p6 3
        fis4.-- e-- |
        \stemNeutral
      }
    >>
    \key d \major
    c2.(\p |
    ais2.) |
    h4.--( d,4) r8 |
    \mark #24
    \repeat unfold 4 e'4.-- |
    e4.(\< c\! |
    \mBreak
    
    % cl1 p6 4
    c'4. h8 c a |
    g4.)\> h4.( |
    a8 h fis g fis g)\! |
    cis,2.( |
    ais2.) |
    \mark #25 h4.( fis4) r8 |
    R2.*4 |
    \mBreak
    
    % cl1 p6 5
    fis,2.~(^"a 2" |
    fis4. g |
    fis4. h~ |
    h4.) r4 r8 |
    \mark #26 |
    R2.*2 |
    dis'4.~(\mf\<  dis8 d dis) |
    e4( h'8) e,4\! r8 |
    \mBreak
    
    % cl1 p6 6
    cis2.~(\f\> |
    cis2. |
    \mark #27 h8)\pp r r r4 r8 |
    R2.*2 
    r4 r8 h'4.(\mf\> |
    a4. g |
    fis8)\! r r r4 r8 |
    \pBreak
    
    % cl1 p7 1
    R2.*2 |
    \mark #28
    r4 r8 r4 fis,8(\espress |
    h2.~ |
    h8 d cis \appoggiatura {h16 cis16} h8 g h) |
    h8.( g'16) h,8 h4.~ |
    h4. r4 r8 |
    \mBreak
    
    % cl1 p7 2
    c4.~( c8 h c) |
    cis8.( gis'16) cis,8 cis4 r8 |
    dis4.~( dis8 d dis) |
    e8.( h'16) e,8 e4 r8 |
    \mark #29
    c2.~\f\> |
    \mBreak
    
    % cl1 p7 3
    c2. |
    fis4.\p eis8( e eis) |
    fis4. eis8( e eis) |
    fis4.( eis) |
    e4.(\< h'\> |
    \mBreak
    
    % cl1 p7 4
    a4. g8 h g) |
    cis,2.(\p |
    ais2.) |
    R2. |
    \mark #30
    R2.*7 |
    \mark #31
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2.*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \transpose c c \relative {
        \key as \major
        \stemUp
        r4^"Sax Alto" r8 r4 c''8(\pp\espress |
        \mBreak
        f2.) |
        \stemNeutral
      }
    >>
    \key d \major
    fis,4.(\pp\<^"Clar.I" g |
    d'4.~d4\> c8 |
    h8 ais) \! r r4 r8 |
    R2.* 2 |
    \mark #32
    R2.*6 |
    % Magic taken from https://lsr.di.unimi.it/LSR/Item?id=10
    % for a fermata hovering over the last bar line
    \context Staff = "one" {
      \bar "|."
      \override Score.TextMark.self-alignment-X = #CENTER
      \textEndMark \markup { \musicglyph "scripts.ufermata" }
    }
  }
}

clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 6/8
  \tempo "Andante"
  \key d \major
  \clef violin
  \relative c'' {
    % cl2 p6 1
    \mark #19
    R2.*6 |
    \mark #20
    R2.*7 |
    \mark #21
    R2.*6 |
    \mBreak

    % cl2 p6 2
    \mark #22
    R2.*10 |
    \mark #23
    R2.*6 |

    % cl2 p6 3
    ais2.(\p |
    fis2.) |
    fis4.--( h,4) r8 |
    \mark #24
    \repeat unfold 4 c'4.-- |
    c4.(\< a\! |
    \mBreak
    
    % cl2 p6 4
    c4. h8 c a |
    g4.)\> h4.( |
    a8 h fis g fis g)\! |
    ais2.( |
    fis2.) |
    \mark #25 fis4.( d4) r8 |
    R2.*4 |
    \mBreak
    
    % cl2 p6 5
    R2.*8 |
    \mBreak
    
    % cl2 p6 6
    fis2.~(\f\> |
    fis2. |
    \mark #27 h8)\pp r r r4 r8 |
    R2.*2 
    r4 r8 h4.(\mf\> |
    a4. g |
    fis8)\! r r r4 r8 |
    \mBreak
    
    % cl2 p7 1
    R2.*2 |
    \mark #28
    R2. |
    fis,2.~( |
    fis4. g |
    d'2.~ |
    d4.) r4 r8 |
    \mBreak
    
    % cl2 p7 2
    R2.*4
    \mark #29
    fis2.~\f\> |
    \mBreak
    
    % cl2 p7 3
    fis2. |
    fis4.\p eis8( e eis) |
    fis4. eis8( e eis) |
    fis4.( eis) |
    e4.(\< h'\> |
    \mBreak
    
    % cl2 p7 4
    a4. g8 h g) |
    ais,2.(\p |
    fis2.) |
    R2. |
    \mark #30
    R2.*7 |
    \mark #31
    R2.*1

    % cl2 p7 5
    R2.*6
    \mark #32
    R2.*6
    \bar "|."
  }
}



% ---------------------------------------------------------

\bookpart {
  \header{
    instrument = "Klarinette I und II in A"
  }
  \score {
    <<
      \new Staff {
        \transpose a a \clarinet_I
      }
      \new Staff {
        \accidentalStyle Score.modern-cautionary
        \transpose a a \clarinet_II
      }
    >>
  }
}

%{
\bookpart {
  \header{
    instrument = "Klarinette I in Bb"
  }
  \score {
    \new Staff {
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose b b \clarinet_I
      }
    }
  }
}
%}

%{
\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
  }
  \score {
    \new Staff {
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose b b \clarinet_II
      }
    }
  }
}
%}
