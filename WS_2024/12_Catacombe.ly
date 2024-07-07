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
  title = "VIII Catacombe"
  subtitle = "(Sepulchrum romanum)"
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
  \time 3/4
  \tempo "Largo"
  \key f \major
  \clef violin
  \relative c'' {
    % cl1 p17 1
    % FIXME: How to get two fermatas hovering over the multi-measure rest ?
    \mark #72
    R2.*11 |
    \mark #73
    <<
      {
        R2.*5 |
      }
      % Transposition adapted to clarinet (written in C, and partly wrong)
      \new CueVoice \transpose a, c \relative {
        \stemDown
        \clef bass
        \key d \major
        h,,2.\fermata^"Fagott" |
        b2.\fermata
        \mBreak
        
        % cl1 p17 2
        <<
          { 
            b'2~\fermata b8 r |
            e,2.~\p |
            e2. |
          } 
          {
            g'2~\fermata g8 r |
            a,2.~ |
            a2. |
          }
        >>
        \clef violin
        \stemNeutral
      }
    >>
    \key f \major
    e,,2.(\p\<^"Clar. a 2" |
    f2.) |
    a2.( |
    \mBreak
    
    % cl1 p17 3
    a2.) |
    f2.~\> |
    f4~ f8\! r r4 |
    \mark #74
    R2.*6 |
    <<
      {
        R2. |
        f2\!\fermata\pp^"Clar.I"
      }
      % Transposition adapted to clarinet (written in C)
      \new CueVoice \transpose a, c \relative {
        \stemUp
        \clef bass
        \key d \major
        fis2.^"Kontrafagott"\ff\>
        \clef violin
        s2.\!\hideNotes |
        \stemNeutral
      }
    >>
    \key f \major
    \bar "|."
  }
}

clarinet_bass = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 3/4
  \tempo "Largo"
  \key f \major
  \clef violin
  \relative c'' {
    % clb p6 1
    \mark #72
    R2.*11 |
    \mark #73
    R2.*11 |
    \mark #74
    R2.*2
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R2.*5 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to clarinet (written in Es?)
      \new CueVoice \transpose a h \relative {
        \stemDown
        \clef bass
        \key es \major
        % Dynamics as written here is correct from score, wrong in cue notes
        g,2.~^"Fagott"\f\> |
        g2.~ |
        g2.~ |
        g2.\p |
        c2.\ff\fermata
        \clef violin
        \stemNeutral
      }
    >>
    \key f \major
    d,2\pp\fermata^"Clar.Bass." r4 |
    \bar "|."
  }
}

% ---------------------------------------------------------

\bookpart {
  \header{
    instrument = "Klarinette I und II in A"
  }
  \score {
    % For simplicity, we treat this as if there was only one voice
    <<
      \new Staff {
        \transpose a a \clarinet_I
      }
    >>
  }
}

\bookpart {
  \header{
    instrument = "Bassklarinette in A"
  }
  \score {
    \new Staff {
      \transpose a a \clarinet_bass
    }
  }
}
