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
  title = "The young person's guide to the orchestra"
  subtitle = ""
  composerShort = "Benjamin Britten"
  composer = "Benjamin Britten (1913 - 1976)"
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
moltoCresc = _\markup { \italic {"molto cresc."} }
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
  markup-system-spacing.basic-distance = #5
  markup-system-spacing.minimum-distance = #5
  markup-system-spacing.padding = #4
  % Distance between music systems
  system-system-spacing.basic-distance = #15
  system-system-spacing.minimum-distance = #15
  % system-system-spacing.padding = #10
  }

\layout {
  \context {
    \Score
    % Omit bar numbers
    \omit BarNumber
  }
  \context {
    \Staff
    % This allows the use of \startMeasureCount and \stopMeasureCount
    % See https://lilypond.org/doc/v2.23/Documentation/snippets/repeats#repeats-numbering-groups-of-measures
    \consists #Measure_counter_engraver
    % \RemoveAllEmptyStaves
  }
}

% ---------------------------------------------------------

britten_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 2/4
  \key g \major
  \clef violin
  \relative c' {
    R2 |
    \mBreak
    % cl1 p4 1
    <<
      {
        \override MultiMeasureRest.staff-position = #-7
        R2_\markup{\italic"(attacca subito)"} |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        gis''8 fis16 gis cis8-> r |
        \bar "||"
      }
    >>
    \time 4/4
    h8-!\ff^\markup { \column { \bold"VARIATION L" \smaller \bold "(Trombone & Tuba)" \bold "Allegro pomposo" } } r r4 r2 |
    r4 \appoggiatura { g16 a } h8-> a-> a-> h-> h-> a-> |
    h4-> r r2 |
    r4 c4-- r h-- |
    \mBreak

    % cl1 p4 2
    r4 c4-- r cis-- |
    r4 \appoggiatura { fis,16 g } a8-> g-> g-> a-> a-> g-> |
    a4-> r r2 |
    R1 |
    r8 d,,-.\mf a'-. fis-. d'-. a-. fis4 |
    \mBreak
    
    % cl1 p4 3
    r4 es'4-- r8 es,8-. c'-. as-. |
    es'8-. c-. as4-. r f' |
    r8 f,-. d'-. b-. r g-. es'-. b-. |
    r8 as-. es'-. c-. r as-. f'-. des-. |
    \mBreak
    
    % cl1 p4 4
    r8 g,-.\crescMolto d'-. h-. g'-. h,-. d-. h'-. |
    g8-. h-. \appoggiatura { g16 a } h8->\f\< a-> a-> h-> h-> a->
    r4 h-!\ff r h-! |
    r4 h-! r2 |
    r4 h-! r h-! |
    \mBreak
        
    % cl1 p4 5
    r2 r4 h-! |
    r8 h-!-> r4 r2 |
    r4 \appoggiatura { h16 c } d8-> c-> c-> d-> d-> c-> |
    d4-> \appoggiatura { g,,16 a } h8-.\mf a-. a-. h-. h-. a-. |
    h4-- \appoggiatura { e,,16 fis } g8-!\p\> fis-! fis-! g-! g-! fis-! |
    \mBreak
    
    % cl1 p4 6
    g8-! fis-! fis-! g-! fis-! g-! fis-! g-! |
    fis-! g8-! g8-! fis-! g-! fis-! fis-! g-! |
    fis4-! g-! g-! fis-! |
    g4-! r g-! r |
    r2 g4-!\! r4\fermata |
    \bar "||"
    \time 6/8
    \mBreak
    
    R2.
  }
}

britten_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 2/4
  \key g \major
  \clef violin
  \relative c' {
    R2 |
    \mBreak
    % cl2 p4 1
    \bar ".|:"
    \repeat volta 2 {
      R2^\markup{\italic"(repeat ad lib.)"}
    }
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R2^"1st Vlns" |
        R2 |
        \override MultiMeasureRest.staff-position = #-7
        R2 |
        R2_\markup{\italic"(attacca subito)"} |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        cis8\ppp r r4 |
        eis8 dis16 eis gis8\moltoCresc r|
        \stemUp
        cis8 h16 cis eis8 r |
        gis8 fis16 gis cis8-> r |
        \bar "||"
      }
    >>
    \time 4/4
    g8-!\ff^\markup { \column { \bold"VARIATION L" \smaller \bold "(Trombone & Tuba)" \bold "Allegro pomposo" } } r r4 r2 |
    \mBreak
    
    % cl2 p4 2
    r4 \appoggiatura { e16 fis } g8-> fis-> fis-> g-> g-> fis-> |
    g4-> r r2 |
    r4 a4-- r g-- |
    r4 g4-- r a-- |
    r4 \appoggiatura { d,16 e } fis8-> e-> e-> fis-> fis-> e-> |
    \mBreak
    
    % cl2 p4 3
    fis4-> r r2 |
    R1 |
    r8 d,-.\mf a'-. fis-. d'-. a-. fis4 |
    r4 es'4-- r8 es,8-. c'-. as-. |
    es'8-. c-. as4-. r f' |
    \mBreak
    
    % cl2 p4 4
    r8 f,-. d'-. b-. r g-. es'-. b-. |
    r8 as-. es'-. c-. r as-. f'-. des-. |
    r8 g,-.\crescMolto d'-. h-. g'-. h,-. d-. h'-. |
    g8-. h-. \appoggiatura { e,16 fis } g8->\f\< fis-> fis-> g-> g-> fis->
    \mBreak
        
    % cl2 p4 5
    r4 g-!\ff r g-! |
    r4 g-! r2 |
    r4 g-! r g-! |
    r2 r4 g-! |
    r8 g-!-> r4 r2 |
    \mBreak
    
    % cl2 p4 6
    r4 \appoggiatura { g16 a } h8-> a-> a-> h-> h-> a-> |
    h4-> \appoggiatura { e,,16 fis } g8-.\mf fis-. fis-. g-. g-. fis-. |
    g4-- \appoggiatura { e,16 fis } g8-!\p\> fis-! fis-! g-! g-! fis-! |
    g8-! fis-! fis-! g-! fis-! g-! fis-! g-! |
    \mBreak
    
    % cl2 p4 7
    fis-! g8-! g8-! fis-! g-! fis-! fis-! g-! |
    fis4-! g-! g-! fis-! |
    g4-! r g-! r |
    r2 g4-!\! r4\fermata |
    \bar "||"
    \time 6/8
    \mBreak
    
    R2.
  }
}

% ---------------------------------------------------------

%%{
\bookpart {
  \header{
    instrument = "Klarinette I in Bb"
  }
  \score {
    \new Staff {
      \transpose b a \britten_clarinet_I
    }
  }
}
%}
%%{
\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
  }
  \score {
    \new Staff {
      \transpose b a \britten_clarinet_II
    }
  }
}
%}

