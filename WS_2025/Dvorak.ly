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
  title = "Czech Suite"
  subtitle = ""
  composerShort = "Antonin Dvorak"
  composer = "Antonin Dvorak"
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
grandioso = _\markup { \italic "grandioso" }

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
  system-system-spacing.basic-distance = #12
  system-system-spacing.minimum-distance = #12
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

dvorak_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 3/4
  \tempo "Presto"
  \key f \major
  \clef violin
  \relative c' {
    \set Score.currentBarNumber = #164
    R2. |
    \break
    % cl1 p2 165
    \mark #4
    R2.*23
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R2.*3 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        c'8(_"Viol.I" b a4) b8( a |
        g4) a8( g f4) |
        g4 d-. g-. |
      }
    >>
    \mark #5
    a'2->\f h4~-> |
    h4 a2-> |
    R2.*3 |
    a2->\f h4~-> |
    h4 a2-> |
    R2.*3 |
    ges2-> ges4~-> |
    \mBreak
    
    % cl1 p2 202
    ges4 g2-> |
    g2-> as4~-> |
    as4 a2-> |
    b2-> h4~ |
    h4 c2-> |
    R2. |
    r4 c,(\f
    d8 e |
    c4) r r |
    r4 c4(\< d8 e) |
    a2->\ff g4~->\grandioso |
    g4 a2-> |
    \mBreak

    % cl1 p3 213
    h4-. a-. g-. |
    g4-. f-. f-. |
    a2 c4~ |
    c4 c2 |
    h4-. a-. g-. |
    g4-. f-. r |
    R2.*8 |
    \mark #6
    R2.*6 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2. |
        \stemDown
        r4 r d'-.\p |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        d,4-.^"Ob.I" c-. b-. |
        b4-. a-. s |
      }
    >>
    \mBreak
    
    % cl1 p3 235
    d'4-. c-. h-. |
    h4-. a-. d-. |
    d4-. c-. h-. |
    h4-. a-. c\pp |
    c4( b) a-- |
    a4( g) c-- |
    c4( b) as-- |
    as4( g) as-- |
    as4( g) as-- |
    as4( g) as-- |
    as2. |
    \mBreak
  
    % cl1 p3 246
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        \stemDown
        g2\fermata r4 |
        \bar "||"
        \transpose a b \relative c'' {
          \key g \major
          R2.
          \revert MultiMeasureRest.staff-position
        }
      }
      \\
      \new CueVoice {
        \voiceOne \stemUp
        s2 a,4_"Ob.I" |
        \bar "||"
        \transpose a b \relative c'' {
          \key g \major
          a4 a( h8 cis) |
        }
      }
    >>
    \transpose a b \relative c'' {
      R2.*17 |
      <<
        {
          \override MultiMeasureRest.staff-position = #-2
          \voiceTwo \stemDown
          R2.*2
          r4 r f\p
          \revert MultiMeasureRest.staff-position
        }
        \\
        \new CueVoice {
          \voiceOne \stemUp
          cis'8(_"Viol.I" d h4) h |
          a8( h g4) g |
          fis8( g es4) s |
        }
      >>
      f8(\< e d e f g) |
      f4(\> e)\! r |
      R2.*3 
      \mark #7
      R2.*20 |
      \mBreak
    }
  }
}

dvorak_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 3/4
  \tempo "Presto"
  \clef violin
  \relative c' {
    \set Score.currentBarNumber = #152
    \transpose a b \relative c' {
      \key g \major
      R2. |
      \break
      
      % cl2 p2 153
      r4 r h'8-.\f h-. |
      h8( e) e,4 r |
      r4 r h'8-. h-. |
      h8( e) e,4 h'8-. h-. |
      h4 e h8-. h-. |
      h4 e h |
      e4 h e |
      R2.*5 |
      \bar "||"
    }
    \mark #4
    \key f \major
    R2.*23
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2. |
        \override MultiMeasureRest.staff-position = #2
        R2.*2 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        c'8(_"Viol.I" b a4) b8( a |
        \mBreak
        % cl2 p2 189
        g4) a8( g f4) |
        g4 d-. g-. |
      }
    >>
    \mark #5
    d'2->\f d4~-> |
    d4 d2-> |
    R2.*3 |
    d2->\f d4~-> |
    d4 d2-> |
    R2.*3 |
    d2-> d4~-> |
    d4 d2-> |
    es2-> es4~-> |
    \mBreak
    
    % cl2 p2 204
    es4 f2-> |
    f2-> g4~-> |
    g4 g2-> |
    R2. |
    r4 c,(\f
    d8 e |
    c4) r r |
    r4 c4(\< d8 e) |
    f2->\ff e4~->\grandioso |
    e4 e2-> |
    g4-. f-. e-. |
    e4-. d-. f-. |
    \mBreak

    % cl2 p3 215
    f2 e4~ |
    e4 a2 |
    b4-. a-. g-. |
    g4-. f-. r |
    R2.*8 |
    \mark #6
    R2.*6 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2. |
        \stemDown
        r4 r f-.\p |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        d4-.^"Ob.I" c-. b-. |
        b4-. a-. s |
      }
    >>
    f'4-. e-. d-. |
    d4-. c-. f-. |
    f4-. e-. d-. |
    \mBreak
    
    % cl2 p3 238
    d4-. c-. e-.\pp |
    e4( d) c-. |
    c4( b) e-. |
    e4( des) c-- |
    c4( b) c-- |
    c4( b) c-- |
    c4( b) c-- |
    c2. |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        \stemDown
        b2\fermata r4 |
        \bar "||"
        \transpose a b \relative c'' {
          \key g \major
          R2.
          \revert MultiMeasureRest.staff-position
        }
      }
      \\
      \new CueVoice {
        \voiceOne \stemUp
        s2 a4_"Ob.I" |
        \bar "||"
        \transpose a b \relative c'' {
          \key g \major
          a4 a( h8 cis) |
        }
      }
    >>
    \transpose a b \relative c'' {
      R2.*17 |
    }
    \mBreak
  }
}


%{  

%}

% ---------------------------------------------------------

%%{
\bookpart {
  \header{
    instrument = "Klarinette I und II in A"
  }
  \score {
    \new Staff {
      \transpose b a \dvorak_clarinet_I
    }
  }

  \score {
    \new Staff {
      \transpose b a \dvorak_clarinet_II
    }
  }
}
%%}
