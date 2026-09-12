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
  title = "Cello Concerto, Op. 85"
  subtitle = ""
  composerShort = "Edward Elgar"
  composer = "Edward Elgar (1857 - 1934)"
  version = "v1"
}

% Adapt this for automatic line-breaks
% mBreak = {}
% pBreak = {}
mBreak = { \break }
pBreak = { \pageBreak }
#(set-global-staff-size 17.9)

% Just to make it easier to add rehearsal marks
rMark = { \mark \default }

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
fCresc = _\markup { \dynamic f \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
fCantabile = _\markup { \dynamic f \italic "cantabile" }
smorz = _\markup { \italic "smorz." }
sempreFf = _\markup { \italic "sempre" \dynamic ff }
sempreFff = _\markup { \italic "sempre" \dynamic fff }
sempreP = _\markup { \italic "sempre" \dynamic p }
semprePp = _\markup { \italic "sempre" \dynamic pp }
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
stringendoMolto = ^\markup { \italic "stringendo molto" }
pocoString = ^\markup { \italic "poco string." }
sempreStringendo = ^\markup { \italic "sempre stringendo" }
sempreString = ^\markup { \italic "sempre string." }
tuttaForza = _\markup { \italic "tutta forza" }
allargando = _\markup { \italic "allargando" }
pocoMenoMosso = ^\markup {\italic \bold {"Poco meno mosso."} }
rit = ^\markup {\italic {"rit."} }
rall = ^\markup {\italic {"rall."} }
riten = ^\markup {\italic {"riten."} }
ritenMolto = ^\markup {\italic {"riten. molto"} }
ritATempo = ^\markup { \center-align \italic {"  rit. a tempo"} }
aTempo = ^\markup { \italic {"a tempo"} }
moltoRit = ^\markup { \italic {"molto rit."} }
pocoRit = ^\markup {\italic {"poco rit."} }
pocoRiten = ^\markup {\italic {"poco riten."} }
sec = ^\markup {\italic {"sec."} }
pesante = ^\markup {\italic {"pesante"} }
pocoRall = ^\markup {\italic {"poco rall."} }
pPocoAPocoCresc = _\markup {\dynamic p \italic {"poco a poco cresc."} }
pocoAPocoRall = ^\markup {\italic {"poco a poco rall."} }
pocoAPocoAccel = ^\markup {\italic {"poco a poco accel."} }
pocoAnimando = ^\markup {\italic {"poco animando"} }
pocoAPocoAccelAlD = ^\markup {\italic {"poco a poco accel. al D"} }
sempreAccel = ^\markup {\italic {"sempre accel."} }
solo = ^\markup { "Solo" }
piuF = _\markup { \italic "più" \dynamic f }
piuP = _\markup { \italic "più" \dynamic p }
lento = ^\markup { \italic "Lento" }
accel = ^\markup { \bold { "accel." } }
tempoPrimo = ^\markup { \italic { "Tempo I" } }
incalcando = ^\markup { \italic "incalcando" }
comePrima = ^\markup { \italic "come prima" }
sff = _\markup { \dynamic { sff } } 
dimUnPoco = _\markup { \italic "dim. un poco" }
dimPocoAPoco = _\markup { \italic "dim. poco a poco" }
animando = ^\markup { \italic "animando" }
cantabile = ^\markup { \italic "cantabile" }
fMarcato = _\markup { \dynamic f \italic "marcato" }
leggieramente = _\markup { \italic "leggieramente" }
conEspressione = ^\markup { \italic "con espressione" }
dolcePossibile = ^\markup { \italic "dolce possibile" }
collaParte= ^\markup{ \italic "colla parte" }

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
      "   -   "
      \fromproperty #'header:title
      " (" \fromproperty #'header:subtitle ") "
      "   -   "
      \fromproperty #'header:instrument
    }
    \if \should-print-page-number \fromproperty #'page:page-number-string
  }
  evenHeaderMarkup = \markup
  \fill-line {
    \if \should-print-page-number \fromproperty #'page:page-number-string
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:composerShort
      "   -   "
      \fromproperty #'header:title
      " (" \fromproperty #'header:subtitle ") "
      "   -   "
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
  markup-system-spacing.padding = #3
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

elgar_I_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Adagio"
  \key b \major
  \clef violin
  \relative c' {
    % cl1 p1 1
    <<
      {
        \override MultiMeasureRest.staff-position = #-10
        R1*4 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        <g' es' b'>2\solo <es b' g' es'>2 |
        <c g' es' d'>8[ c''] b c <dis,, b' f' a>4 a''~ |
        a8 g f \appoggiatura a g c,2~ |
        c8 b a \appoggiatura d c { \override Flag.stroke-style = #"grace" \afterGrace b2(\fermata es,8) }|
      }
    >>
    g2--\p\<\aTempo g2--\f\breathe |
    g2\pp\rit\breathe r4 r8\fermata r8 |
    R1\collaParte
    r1\fermata\rit |
    \bar "||"
    \mBreak
    
    % cl1 p1 2
    \rMark
    \time 9/8
    \tempo "Moderato"
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*9/8*6 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        a4(_"Vla." b8 a4 c8 d4 c8) |
        R1*9/8*4 |
        d4(^"Tutti Celli" b8) a4( b8 g4 f8) |
      }
    >>
    \rMark
    r4. es4.~\pp es4 r8 |
    r4. b'4.--~ b4 r8 |
    r4. es,4.~ es4 r8 |
    \mBreak
  }
}

elgar_I_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Adagio"
  \key b \major
  \clef violin
  \relative c' {
    % cl2 p1 1
    <<
      {
        \override MultiMeasureRest.staff-position = #-10
        R1*4 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        <g' es' b'>2\solo <es b' g' es'>2 |
        <c g' es' d'>8[ c''] b c <dis,, b' f' a>4 a''~ |
        a8 g f \appoggiatura a g c,2~ |
        c8 b a \appoggiatura d c { \override Flag.stroke-style = #"grace" \afterGrace b2(\fermata es,8) }|
      }
    >>
    g2--\p\<\aTempo g2--\f\breathe |
    g2\pp\rit\breathe r4 r8\fermata r8 |
    R1\collaParte
    r1\fermata\rit |
    \bar "||"
    \mBreak
    
    % cl2 p1 2
    \rMark
    \time 9/8
    \tempo "Moderato"
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*9/8*6 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        a4(_"Vla." b8 a4 c8 d4 c8) |
        R1*9/8*4 |
        d4(^"Tutti Celli" b8) a4( b8 g4 f8) |
      }
    >>
    \rMark
    r4. es4.~\pp es4 r8 |
    r4. b'4.--~ b4 r8 |
    r4. es,4.~ es4 r8 |
    \mBreak
  }
}

% ---------------------------------------------------------

%%{
\bookpart {
  \header{
    instrument = "Klarinette I in A"
    subtitle = "I"
  }
  \score {
    \new Staff {
      \transpose a a \elgar_I_clarinet_I
    }
  }
}
%%}

%%{
\bookpart {
  \header{
    instrument = "Klarinette II in A"
    subtitle = "I"
  }
  \score {
    \new Staff {
      \transpose a a \elgar_I_clarinet_II
    }
  }
}
%%}
