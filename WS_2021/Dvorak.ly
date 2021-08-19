\version "2.18.2"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##t
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
#(set-global-staff-size 17)

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
pMoltoCresc = _\markup { \dynamic p \italic "molto cresc." }
stringendo = ^\markup { \italic "stringendo" }
allargando = _\markup { \italic "allargando" }
pocoRit = _\markup {\italic {"poco rit."} }
rit = _\markup {\italic {"rit."} }
solo = ^\markup { "Solo" }
piuTranquillo = ^\markup { \italic "PiÃ¹ tranquillo" }
accel = ^\markup { \bold { "accel." } }
tempoPrimo = ^\markup { \bold { "Tempo I" } }

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
  \defaultTimeSignature
  \time 4/4
  \tempo "Allegro con brio"
  \key b \major
  \relative c'' {
    % m1 page 1 line 1
    \mBreak

    % m1 page 1 line 2
    \mBreak

    % m1 page 1 line 3
    \mBreak

    % m1 page 1 line 4
    \mBreak

    % m1 page 1 line 5
    \mBreak

    % m1 page 1 line 6
    \mBreak

    % m1 page 1 line 7
    \mBreak

    % m1 page 1 line 8
    \mBreak

    % m1 page 1 line 9
    \mBreak

    % m1 page 2 line 1
    \mBreak

    % m1 page 2 line 2
    \mBreak

    % m1 page 2 line 3
    \mBreak

    % m1 page 2 line 4
    \mBreak

    % m1 page 2 line 5
    \mBreak

    % m1 page 2 line 6
    \mBreak

    % m1 page 2 line 7
    \mBreak

    % m1 page 2 line 8
    \mBreak

    % m1 page 2 line 9
    \mBreak

    % m1 page 2 line 10
    \mBreak

    % m1 page 2 line 11
    \mBreak

    % m1 page 3 line 1
    \mBreak

    % m1 page 3 line 2
    \mBreak

    % m1 page 3 line 3
    \mBreak

    % m1 page 3 line 4
    \mBreak

    % m1 page 3 line 5
    \mBreak

    % m1 page 3 line 6
    \mBreak

    % m1 page 3 line 7
    \mBreak

    % m1 page 3 line 8
    \mBreak

    % m1 page 3 line 9
    \mBreak

    % m1 page 3 line 10
    \mBreak

    % m1 page 4 line 1
    \mBreak

    % m1 page 4 line 2
    \mBreak

    % m1 page 4 line 3
    \mBreak

    % m1 page 4 line 4
    \mBreak

    % m1 page 4 line 5
    \mBreak

    % m1 page 4 line 6
    \mBreak

    % m1 page 4 line 7
    \bar "|."
  }
}

clarinet_II_AllegroNonTroppo = {
  \defaultTimeSignature
  \time 2/4
  \tempo "Allegro non troppo"
  \key b \major
  \relative c'' {
    % m4 page 1 line 1
    \mBreak

    % m4 page 1 line 2
    \mBreak

    % m4 page 1 line 3
    \mBreak

    % m4 page 1 line 4
    \mBreak

    % m4 page 1 line 5
    \mBreak

    % m4 page 1 line 6
    \mBreak

    % m4 page 1 line 7
    \mBreak

    % m4 page 2 line 1
    \mBreak

    % m4 page 2 line 2
    \mBreak

    % m4 page 2 line 3
    \mBreak

    % m4 page 2 line 4
    \mBreak

    % m4 page 2 line 5
    \mBreak

    % m4 page 2 line 6
    \mBreak

    % m4 page 2 line 7
    \mBreak

    % m4 page 2 line 8
    \mBreak

    % m4 page 2 line 9
    \mBreak

    % m4 page 2 line 10
    \mBreak

    % m4 page 2 line 11
    \mBreak

    % m4 page 2 line 12
    \mBreak

    % m4 page 3 line 1
    \mBreak

    % m4 page 3 line 2
    \mBreak

    % m4 page 3 line 3
    \mBreak

    % m4 page 3 line 4
    \mBreak

    % m4 page 3 line 5
    \mBreak

    % m4 page 3 line 6
    \mBreak

    % m4 page 3 line 7
    \mBreak

    % m4 page 3 line 8
    \mBreak

    % m4 page 3 line 9
    \mBreak

    % m4 page 3 line 10
    \mBreak

    % m4 page 3 line 11
    \bar "|."
  }
}

\bookpart {
  \header{
    instrument = "Klarinette II in A"
  }
  \accidentalStyle Score.modern-cautionary
  \score {
    \transpose a a \clarinet_II_AllegroConBrio
  }
  \score {
    \transpose a a \clarinet_II_AllegroNonTroppo
  }
}
