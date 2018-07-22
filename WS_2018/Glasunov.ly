%{
%}

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
  title = "Stenka Rasin"
  subtitle = "Sinfonische Dichtung op.13"
  composer = "Alexandre Glasunow (1865 - 1936)"
  tagline = ""
}

% Adapt this for automatic line-breaks
mBreak = { \break }
#(set-global-staff-size 13)

% Useful snippets
pDolce = \markup { \dynamic p \italic \bold "dolce" }
pesante = _\markup {\italic {"pesante"} }
pocoRit = ^\markup {\italic {"poco rit."} }
moltoRit = ^\markup {\italic {"molto rit."} }
pocoAnimato = ^\markup {\italic {"poco animato"} }
pocoAPocoPiuAnimato = ^\markup {\italic {"poco a poco più animato"} }
lunga = _\markup {\italic {"lunga"} }
string = ^\markup {\italic {"string."} }
legato = _\markup {\italic {"legato"} }
solo = ^\markup { "Solo" }


clarinet_I_in_A_part_one_Music = {
  \relative c' {
    \transposition a
    \key f \major
    \numericTimeSignature
    \time 4/4
    \tempo "Andante" 4 = 72

    % page 1 line 1
    R1*13 |
    d1->\f\>~ |
    d1~ |
    d1~ |
    d2\! r2 |
    d1\p~ |
    d1 |
    d1~ |
    d1~\> |
    \mark #1
    d4\! r4 r2 |
    R1*12 |
    b1->\mf\>~ |
    b1~ |
    b2\pp r2 |
    R1 |
    \mBreak
    
    % page 1 line 2
    g''4.\p\solo g8 g( f e d) |
    c4( g') e2 |
    g4. g8 g( f e d) |
    c4( g') e2\>~ |
    \mark #2
    e4\pp r4 r2 |
    R1*2 |
    es2\mf( d |
    cis1) |
    R1*2 |
    c'4\f( es d c) |
    g4( b a g) |
    \mBreak
    
    % page 1 line 3
    r4 h~\f \tuplet 3/2 { h8 h\> h } \tuplet 3/2 { h8 h\! h }  |
    b2 b2 \> |
    R1\! |
    g1->\f\> |
    \bar "||" \time 3/4 \tempo "Allegro con brio" 4 = 120
    f8\p\! r8 r4 r4 |
    R2. |
    r8 a,16\f( h) c d c h a h a g |
    a8-. a16( h) c d c h a h a g |
    \mBreak
    
    % page 1 line 4
    a8-. r r a16( h) c d c h |
    a16 h a c h\< c h c %{ Fliegendreck, kein Staccato %} h c h c |
    d8-.\sf a16( h) c d c h a h a g |
    a8 a16( h) c d c h a h a g |
    \mBreak
    
    % page 1 line 5
    a8 r r a16( h) c d c h |
    a16 h a c h\< c h c h c h c |
    c8\sf c, b4 b8( a) |
    b8 b b4 b8( a) |
    b8 b b( a) b16( a g8) |
    \mBreak

    % page 1 line 6
    b8 b b4 c8( e) |
    R2.*4 |
    \mark #3
    c'8\f r b,16 c d es f g a b |
    a16( b) c8~ c b16 a g( f) d8 |
    r4 c'' d |
    d4\< d2\! |
    d4\< d2\! |
    c8 c,-. b c d( c16 b) |
    \mBreak
    
    % page 1 line 7
    a8-. a-. g a b( a16 g) |
    f8 r r4 r |
    r4 r b'16(\< c b c)\! |
    d8 r8 r4 r |
    r4 r d\< |
    d8\sf r8 r4 r |
    r4 r a16(\< h a g)\! |
    a8 r8 r4 r |
    \mBreak
    
    % page 1 line 8
    r4 r h16(\< a h c) |
    d2.\ff\>~ |
    d8\! r8 r4 r |
    d,2.\f\>~ |
    d8\! r8 r4 r |
    R2.*3 |
    h'8.\mf\< h16 h8-. h-. h-. h-. |
    \mark #4
    d8\f r16 a\ff g8\pesante a \acciaccatura { c8 } h( a16 g) |
    a8 g16( d f8) r8 r4 |
    \mBreak
    
    % page 1 line 9
    r8. a16\pesante g8 a \acciaccatura { c8 } h( a16 g) |
    a8 g16( d f8) r8 r4 |
    r8. f16\pesante e8 f \acciaccatura { a8 } g( f16 e) |
    f8 e16( a, d8) r8 r4 |
    r8. f16\pesante e8 f \acciaccatura { a8 } g( f16 e) |
    f8 e16( a, d8) r8 r4 |
    \mBreak
    
    % page 1 line 10
    R2. |
    r8\solo d16\p\<( e f g f e d e d c\! ) |
    b16( a g8) r4 r |
    r8 g'16(\< a b c b a g a g ges\! |
    f8) r8 r4 g\mf |
    f8 r8 r4 g |
    \mBreak
    
    % page 1 line 11
    fis8 r8 r4 c'8(-> a) |
    d8 r8 r4 c8(-> a) |
    d8 r8 r4 r |
    r4 as8\f\< r as\! r |
    b8\sf b16\mf b b8 b16 b b8 b16 b |
    b8 b16 b b8 b16 b b8\< b16 b |
    \mBreak
    
    % page 1 line 12
    b8 b16 b b8 b16 b b8 b16 b\! |
    b8 b16 b b8 b16 b b8 b16 b |
    g8 r8 r4 r |
    R2.*5 |
    cis8\mf cis16 cis cis8\< cis16 cis cis8 cis16 cis |
    \mark #5
    c8\sf r8 r4 r4 |
    R2.*3 |
    R2.*4\pocoRit |
    \mBreak
  }
}

clarinet_I_in_B_Music = {
  \relative c' {

    % page 2 line 1
    g''2.\p\solo~ |
    g2.~ |
    \bar "||"
    \tempo "Allegro moderato" 4 = 100
    \key c \major
    g2.~ |
    g2.\> |
    g4\! e8( f g4~ |
    g8) g( f e d c) |
    e4 c8( d e4~ |
    e8) e( d c h a) |
    c4 a8( h c4~ |
    c8) d( c h a g) |
    a4 e8( g a4~ |
    \mBreak
    
    % page 2 line 2
    a8) h( c d e a) |
    g4\mf e8( f g4~ |
    g8) g( f e d c) |
    e4 c8( d e4~ |
    e8) e( d c h a) |
    c4 as8( b c4~ |
    c8) c( b as g f) |
    as4 f8( g a4~\> |
    a4) g2(\! |
    \mBreak
    
    % page 2 line 3
    \mark #6
    c8) r8 r4 r |
    R2. |
    b'4\pp( c b\> |
    c4 b a)\! |
    R2.*2 |
    b4( c b\> |
    c4 b a)\! |
    R2.*2 |
    g4( as g |
    as4\> g as)\! |
    R2.*7 |
    as4(\mf f8 as) as4(\> |
    \mBreak

    % page 2 line 4
    g8) r8\! r4 r |
    as4( f8 as) as4(\> |
    g8) r8\! r4 r |
    R2. |
    \mark #7
    R2.*8 |
    r4 es8(\p c) d( c) |
    R2. |
    c'2(\p h4 |
    b2 a4 |
    as2 g4 |
    fis2 f4) |
    e2( dis4 |
    d2. |
    \mBreak
    
    % page 2 line 5
    c4. h8 a4~ |
    a2.) |
    des'2(\mf c4 |
    h2 b4 |
    a2 as4\> |
    g2 fis4)\! |
    f2( e4 |
    es2 d 4 |
    des2 c4 |
    h2.) |
    \mark #8
    e,4(\p c e |
    c\< e c)\! |
    g'4( c, g' |
    c, g'\> c,)\! |
    \mBreak
    
    % page 2 line 6
    e4( c e |
    c4 \<e c)\! |
    g'4( c, g' |
    c,4 g'\< c,)\! |
    ges'2.\cresc~ |
    ges2. |
    fes2. |
    des''2( b4) |
    g8(\f e) a( e) g( e) |
    a8( e)\> g( e) a( e) |
    g8(\mf e) a( e) g( e) |
    \mBreak
    
    % page 2 line 7
    a8(\> e) g( e) a( e)\! |
    R2.*2 |
    \bar "||" \tempo "Allegro con brio (come prima)"
    R2.*8 |
    as4(\p c2) |
    as4( c2) |
    as4 as8( b) as( g) |
    as4 as8( b) as4 |
    g8 r8 r4 r |
    R2.*6 |
    \mark #9
    c,4(\p e2)
    c4( e2)
    \mBreak
    
    % page 2 line 8 (start)
    c4 c8( d) c( h) |
    c4 c8( d) c( h) |
    a8 r8 r4 r |
    R2.*8 |
    <<
      {
       \override MultiMeasureRest.staff-position = #-4
        R2.*2
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \cueClef "bass" \stemUp des,,8^"Bassi" h e4 h | des8 h e4 h | \cueClefUnset
      }
    >>
  }
}

clarinet_I_in_A_part_two_Music = {
  \relative c' {
    \transposition a

    % page 2 line 8 (continued)
    r4 a''8(\f fis) h d |
    cis8 h a( fis) h d |
    cis8 h a( fis) h4 |
    \mBreak

    % page 2 line 9
    fis4 a8( fis) h4 |
    fis4-> a-> fis-> |
    h8-> r8 r4 r |
    \mark #11
    e4\ff e e8-. e-. |
    e4 e e8-. e-. |
    es 8 r8 es,2->\mf~ |
    es2. |
    R2.*2 |
    e8(\mf\solo cis8) fis8( cis8) e8( cis8) |
    fis8(\> cis) e( cis) fis( cis) |
    \mBreak
    
    % page 2 line 10
    a'8(\ff fis) h( d) c-. h-. |
    a8( fis) h( d) c-. h-. |
    a8( fis) h( fis) a( fis) |
    h8(\< fis) a( fis) h( fis) |
    g8\sf\! r8 r4 r |
    R2. |
    f,,2.\p\startTrillSpan~ |
    f2 f32(\<\stopTrillSpan g a h c d e f |
    \mBreak

    % page 2 line 11
    g2.)\mf\startTrillSpan~ |
    g2~ g8\stopTrillSpan \tuplet 6/4 { g32( a h c d e } |
    f2.)\startTrillSpan~ |
    f2\<~ f8\stopTrillSpan \tuplet 6/4 { es32( f g a b c } |
    \mark #12
    d8\!) r8 \pitchedTrill d,,2\f\startTrillSpan~ e |
    d2~ d8\stopTrillSpan \tuplet 6/4 { d32_( e fis g a h } |
    c2.)\startTrillSpan~ |
    c2\stopTrillSpan\< c32( d e fis g a h c)\! |
    \mBreak
    
    % page 2 line 12
    a8( fis) h( d) c-. h-. |
    a8( fis) e( g) fis( a) |
    g( e) a( c) h-. a-. |
    g8( e) c(\< d) e-. d'-. |
    cis8.\ff cis16 cis4~ cis8 e,8\f |
    e8. e16 e4\>~ e8\! r8 |
    r4 r4 r8 d,\mf |
    \mBreak
    
    % page 2 line 13
    d8. d16 d4\>~ d8\! a''8 |
    \pitchedTrill a2_~ \startTrillSpan b a8\stopTrillSpan r8 |
    \bar "||" \key a \major
    R2.*4 |
    fis,8.\mf fis16 fis2->~ |
    fis16 d( e fis) a( fis e fis) e( d h d) |
    d8. d16 d4. e8 |
    fis8.\< fis16 fis4. a8\! |
    cis8. cis16 cis4~ cis8 d\f |
    \mBreak
    
    % page 2 line 14
    fis8. fis16 fis4.\< a8\! |
    cis8. cis16 cis4~ cis8 d\ff |
    \mark #13
    a8. a16 a2\> |
    R2.\pp\pocoRit |
    \tempo "Meno mosso"
    d,2\mf( cis4\> |
    his2 fis'4) |
    d2\mf( cis4\> |
    his2 fis'4) |
    e2\mf( dis4\> |
    cisis2 gis'4) |
    e2\mf( dis4\> |
    cisis2 gis'4)\! |
    \mBreak
    
    % page 3 line 1
    fis2( dis4) |
    d2->\mf(~ d8\> dis)\! |
    fis4 dis8( eis fis4~\>) |
    fis4\! e8( fis e dis) |
    fis4( f) e->(\( |
    dis4) e\> fis\)\! |
    \bar "||" \key c \major
    \mark #14
    \repeat tremolo 12 { des16\mf \pocoAnimato } |
    des8 b16( c des es des c) b( c des es) |
    \repeat tremolo 12 { des16 } |
    \mBreak
    
    % page 3 line 2
    des8 b16( c des es des c) b( c des d) |
    \repeat tremolo 12 { es16 } |
    es8 c16( d es f es d) c( d es f) |
    \repeat tremolo 12 { es16 } |
    es8 c16( d es f es d) c( cis d es) |
    \repeat tremolo 12 { d16\< } |
    \mBreak

    % page 3 line 3
    c8\! c16( d es f es d) c( d c h) |
    c8 r8 r4 \repeat tremolo 4 { des16-> } |
    des8 r8 r4 r |
    r4 r des'4->~ |
    des8\> b,16(\! c des es des c) b(\> d e b') |
    \bar "||" \key f \major \tempo "Tempo I" 4 = 120
    d2.\f |
    e2( dis4 |
    \mBreak

    % page 3 line 4
    d2.)~ |
    d4 e( dis |
    d2)\cresc e4( |
    dis4) d2 |
    e8( dis) d2->\ff\>~ |
    d2.\pp
    \mark #15
    R2.*2 |
    gis,,,2.\p->~ |
    gis2.
    R2.*2 |
    b2.->~ | % FIXME: Shouldn't that also have a \p like in 2nd clarinet?
    b2. |
    e2.\mf |
    h2.
    \mBreak
    
    % page 3 line 5
    f''16\f( g f es) es( f es d) d( es f g) |
    as16( b as g) g( as g f) f( g f es) |
    f8 r8 r4 r |
    R2. |
    \bar "||"
    \mark #16
    d'8\sf r8 r4 r |
    r4 r d\ff |
    d8 r8 r4 r |
    \mBreak
    
    % page 3 line 6
    r4 r d |
    d8\sf r8 r4 r |
    r4 r a16\mf\< h a g |
    a8\sf r8 r4 r |
    r4 r h16\mf\< a h c |
    c2.->\ff |
    h2.\> |
    d16\f e d cis c d c h h c h a |
    \mBreak
    
    % page 3 line 7
    a16 h a g g\> a g f f g f e |
    d8\! r8 r4 r |
    h'8.-.\mp\< h16-. h8-. h8-. h8-. h8-. |
    d8\! r8 r4\cresc r |
    h8.-. h16-. \repeat tremolo 4 { h8-. } |
    \mark #17
    d8\sf d\fff f\pesante f f g,16( d) |
    f8 r8 r4 r |
    \mBreak
    
    % page 3 line 8
    r8 f' f f f g,16( d) |
    f8 r8 r4 r |
    r8 a\pesante g b a e16( a,) |
    d8 r8 r4 r |
    r8 a'\pesante g b a e16( a,) |
    d8 r8 r4 r |
    r4 r r8 \tuplet 3/2 { d16(\mf\< es e)\! } |
    \mBreak
    
    % page 3 line 9
    f16( g f e d e d c b c b a) |
    g16( f es) r r4 r8 \tuplet 3/2 { g16(\< as a)\! }
    b16( c b a g a g f es f es d) |
    c8 c'(\mf b) c \acciaccatura { e } d( c16 b) |
    \mBreak
    
    % page 3 line 10
    c8 c( b) c \acciaccatura { e } d( c16 b) |
    a8 r r \tuplet 3/2 { e'16\f f fis } g8->( e) |
    a8-> r r \tuplet 3/2 { e16 f fis } g8->( e) |
    a8 r8 r4 r |
    r4 b8 r h r |
    \mark #18 
    c8\f r8 r4 r |
    r4 r f,16(\< g f g)\! |
    \mBreak
    
    % page 3 line 11
    a8 r8 r4 r |
    r4 r f16( g a b) |
    a2.(->\mf |
    f2 a4) |
    a2.~ |
    a2. |
    b2.~ |
    b2. |
    a4.( c8 d4)~ |
    d2.\< |
    es2.(\! |
    d2.) |
    cis2.( |
    d4\>) (a2)\! |
    \mBreak
    
    % page 3 line 12
    des2.( |
    as2 f4) |
    b4.( c8 des4~ |
    des4\>) c2 |
    \mark #19
    a8-.\mf a16-. a16-. \repeat unfold 2 { a8-. a16-. a16-. } |
    \repeat unfold 3 { a8-. a16-. a16-. } |
    \repeat unfold 3 { c8-. c16-. c16-. } |
    \repeat unfold 2 { c8-. c16-. c16-. } b8-. b16-. b16-. |
    \mBreak

    % page 3 line 13
    \repeat unfold 3 { a8-. a16-. a16-. } |
    \repeat unfold 3 { a8-. a16-. a16-. } |
    \repeat unfold 3 { c8-. c16-. c16-. } |
    \repeat unfold 2 { c8 c16 c16 } b8 b16 b16 |
    \repeat unfold 3 { a8 a16 a16 } |
    \mBreak
    
    % page 3 line 14
    \repeat unfold 3 { a8 a16 a16 } |
    a8 a16 a16 as8 as16 as16 a8 a16 a16 |
    \repeat unfold 3 { as8 as16 as16 } |
    ges8 r8 r4 r |
    r4 r8 ges16\p\< ges b8 ges16 ges\! |
    as8 r8 r4 r |
    R2.*2 |
    \mBreak
    
    % page 4 line 1
    r4 r8 ges16 ges b8 ges16 ges |
    as8 c16 c as8 c16 c as8\< f16 f |
    e8\f e16 e e8 e16 e e8(\> f8) |
    as8\mf c16 c as8 c16 c as8\< f16 f |
    e8\f e16\pesante e e8 e16 e e8(\> f8) |
    \mBreak

    % page 4 line 2
    as8\mf as16 as as8 as16 as as8 as16 as |
    as8 as16 as as8\> as16 as as8\! r8 |
    \mark #20
    R2.*14 |
    \tuplet 3/2 { f,8\p\cresc f f } \tuplet 3/2 { \repeat tremolo 3 f8 } \tuplet 3/2 { \repeat tremolo 3 f8 } |
    \repeat unfold 3 \tuplet 3/2 { \repeat tremolo 3 f8 } |
    \mark #21
    des''8\sf b8\ff b\pesante b b r8 |
    R2. |
    \mBreak
    
    % page 4 line 3
    des8\sf b8\pesante b b b r8 |
    R2. |
    des8\sf\pocoAnimato r8 r4 r4 |
    r8 g,16(\f\< a) b( c b a) a( b a g)\! |
    f16( g f es) g8 r8 r4 |
    r8 g16(\f\< a) b( c b a) a( b a g)\! |
    \mBreak
    
    % page 4 line 4
    b8 g16(\cresc a) b( c b a) a( b a g) |
    b8 g16( a) b( c b a) g( b c des) |
    es8\fff b16-. b-. es8 b8 es,8 b16-. b-. |
    es8 b es, b16 b es8 b |
    r4 es''8\sf r8\lunga r4\fermata |
    \bar "||" \time 4/4 
    \mBreak
    
    % page 4 line 5
    \tempo "Tempo del comincio"
    R1*2 |
    R1*2\moltoRit |
    \mark #22
    R1*2\pocoAPocoPiuAnimato | % FIXME: Why does that not appear after V?
    r4 g,,4\p\<~ g2\! |
    g4( ges f a\> |
    d8)\! r8 r4 \tuplet 3/2 { h'8(\< c cis } \tuplet 3/2 { d dis e)\! } |
    f8 r8 r4 \tuplet 3/2 { h,8(\< c cis } \tuplet 3/2 { d e eis)\! } |
    \bar "||" \key d \major
    \mBreak

    % page 4 line 6
    \tempo "Andante mosso" 4 = 100
    fis8 r8 r4 r2 |
    \tuplet 3/2 { h,8(\f c cis } \tuplet 3/2 { d dis e } \tuplet 3/2 { eis,\< fis g } \tuplet 3/2 { gis a ais\!) } |
    h8 r8 r4 r2 |
    \tuplet 3/2 { h8( c cis } \tuplet 3/2 { d dis e } \tuplet 3/2 { eis,\< fis g } \tuplet 3/2 { gis a ais\!) } |
    h8 r8 r4 r2 |
    R1*2
    \mBreak
    
    % page 4 line 7
    \tuplet 3/2 { h8( c cis } \tuplet 3/2 { d dis e } \tuplet 3/2 { eis,\< fis g } \tuplet 3/2 { gis ais h\!) } |
    \mark #23
    a16( d, dis e eis fis g gis a ais h c cis d) r8 |
    r2 \tuplet 3/2 { d8( cis c } \tuplet 3/2 { h ais h) }
    \mBreak
    
    % page 4 line 8
    c16( d, dis e eis fis g gis a ais h c cis d) r8 |
    r2 \tuplet 3/2 { d8( cis c } \tuplet 3/2 { h ais h) } |
    d16( g, gis a ais h c cis d) r16 r8 r4 |
    \mBreak
    
    % page 4 line 9
    r4 d16( dis e f) \tuplet 3/2 { e8( dis d } \tuplet 3/2 { cis c h) } |
    as16( f g as a b h c cis d) r8 r4 |
    r4 r16 d( dis e) \tuplet 3/2 { f8( cis d } \tuplet 3/2 { dis e f) } |
    \mBreak

    % page 4 line 10
    \mark 24
    \tuplet 3/2 { g8( fis f } \tuplet 3/2 { e es d) } \tuplet 3/2 { f( e es } \tuplet 3/2 { d cis d)} |
    \tuplet 3/2 { b8( c cis } \tuplet 3/2 { d dis e) } \tuplet 3/2 { f( f, fis } \tuplet 3/2 { g gis a) } |
    \tuplet 3/2 { b8( d cis } \tuplet 3/2 { c h b) } \tuplet 3/2 { a( e' d } \tuplet 3/2 { cis c b) } |
    \mBreak
    
    % page 4 line 11
    \tuplet 3/2 { f'8( e es } \tuplet 3/2 { d c b) } \tuplet 3/2 { d( cis c } \tuplet 3/2 { h ais a) } |
    d1->\cresc\string~ |
    d1 |
    d1~ |
    d1 |
    \mark #25
    \tempo "Allegro molto"
    fis,16(\fff d \repeat unfold 6 { fis d } fis d) |
    \mBreak
    
    % page 4 line 12
    a'16( f \repeat unfold 6 { a16 f } g d) |
    fis16( d \repeat unfold 6 { fis d } fis d) |
    a'16( f \repeat unfold 6 { a f } g d) |
    \mBreak
    
    % page 4 line 13
    fis16(\legato d \repeat unfold 6 { fis d } fis d) |
    \repeat tremolo 4 { fis16( d } \repeat tremolo 4 { fis16 d) } |
    \repeat tremolo 4 { fis16( a } \repeat tremolo 4 { fis16 a) } |
    \repeat tremolo 4 { fis16( a } \repeat tremolo 4 { fis16 a) } |
    fis8\sf r8 r4 r2 |
    \bar "|."
  }
}

clarinet_II_in_A_part_one_Music = {
  \relative c' {
    \transposition a
    \key f \major
    \numericTimeSignature
    \time 4/4
    \tempo "Andante" 4 = 72

    % page 1 line 1
    R1*13 |
    c1->\f\>~ |
    c1~ |
    c1~ |
    c2( h4 a)\ppp  |
    R1*4 |
    \mark #1
    R1*13
    g1->\mf\>~ |
    g1~ |
    g2\pp r2 |
    R1*5 |
    \mBreak
    
    % page 1 line 2
    \mark #2
    R1*3 |
    g'1~ |
    g1 |
    R1*2 |
    es'1(\f |
    d4) r4 r2 |
    r4 gis~\f \tuplet 3/2 { gis8 gis\> gis } \tuplet 3/2 { gis8 gis gis\! } |
    g2 g2 \> |
    d2\p\< f |
    es1->\f\> |
    \mBreak

    % page 1 line 3
    \bar "||" \time 3/4 \tempo "Allegro con brio" 4 = 120
    d8\p r8 r4 r4 |
    R2. |
    r8 a16\f( h) c d c h a h a g |
    a8-. a16( h) c d c h a h a g |
    a8-. r r a16( h) c d c h |
    a16 h a c h\< c h c h c h c |
    \mBreak

    % page 1 line 4
    d8-.\sf a16( h) c d c h a h a g |
    a8 a16( h) c d c h a h a g |
    a8 r r a16( h) c d c h |
    a16 h a c h\< c h c h c h c |
    \mBreak
    
    % page 1 line 5
    c8\sf r8 r4 r4 |
    R2.*7
    \mark #3
    a8\f r b,16 c d es f g a b |
    a16( b) c8~ c b16 a g( f) d8 |
    r4 c'' b |
    a4\< b2\! |
    a4\< b2\! |
    f8 c-. b c d( c16 b) |
    \mBreak

    % page 1 line 6
    a8-. a-. g a b( a16 g) |
    f8 r r4 r |
    r4 r es'\< |
    f8\! r8 r4 r4 |
    r4 r f16(\< g f g) |
    a8\sf r8 r4 r |
    r4 r a,16(\< h a g)\! |
    a8 r8 r4 r |
    \mBreak
    
    % page 1 line 7
    r4 r h16(\< a h c) |
    a'2.\ff\>~ |
    a8\! r8 r4 r |
    c,2.(\f\> |
    h8)\! r8 r4 r |
    R2.*3 |
    d8.\mf\< d16 d8-. d-. d-. d-. |
    \mark #4
    d8\sf r16 f\ff f8\pesante f f4 |
    f8 g,16( d f8) r8 r4 |
    \mBreak
    
    % page 1 line 8
    r8. f'16\pesante f8 f f4 |
    f8 g,16( d f8) r8 r4 |
    r8. a'16\pesante g8 a b4 |
    a8 e,16( a, d8) r8 r4 
    r8. a''16\pesante g8 a b4 |
    a8 e16( a, d8) r8 r4 |
    R2.*4
    \mBreak
    
    % page 1 line 9
    r4 r4 g,\mf |
    f8 r8 r4 g |
    fis8 r8 r4 f'4-> |
    fis8 r8 r4 f-> |
    fis8 r8 r4 r |
    r4 es8\f\< r es\! r |
    es8\sf g16\mf g g8 g16 g g8 g16 g |
    g8 g16 g g8 g16 g g8\< g16 g |
    \mBreak
    
    % page 1 line 10
    f8 f16 f f8 f16 f f8 f16 f\! |
    e8 e16 e e8 e16 e e8 e16 e |
    e8 r8 r4 r |
    R2.*5 |
    a8\mf a16 a fis8\< fis16 fis fis8 fis16 fis |
    \mark #5
    gis8\sf r8 r4 r4 |
    R2.*3 |
    R2.*6\pocoRit |
    \mBreak
  }
}

clarinet_II_in_B_Music = {
  \relative c' {

    % page 1 line 11
    \bar "||"
    \tempo "Allegro moderato" 4 = 100
    \key c \major
    c'2.\pp~ |
    c2.( |
    e,2.)~ |
    e2.~ |
    e2.~ |
    e2. |
    f2.~ |
    f2.( |
    e4) r4 r4 |
    R2. |
    b'2.(\mf |
    a2.)( |
    e2.)~ |
    e2.\> |
    f2(\! e4 |
    \mBreak
    
    % page 1 line 12
    es2.) |
    d2.~\> d2.( |
    \mark #6
    e8)\! r8 r4 r4 |
    R2. |
    es'4\pp( g es\> |
    g4 es f)\! |
    R2.*2 |
    es4( g f\> |
    g4 es f)\! |
    R2.*2 |
    e4( c e |
    c4\> e c)\! |
    R2.*4 |
    \mBreak

    % page 2 line 1
    f,2.~ |
    f2.(\<( |
    es8)\! r8 r4 r4 |

    f'4(\mf as,8 f') f4(\> |
    es8) r8\! r4 r |
    f4( as,8 f') f4(\> |
    es8) r8\! r4 r |
    R2. |
    \mark #7
    R2.*8 |
    \mBreak

    % page 2 line 2
    r4 as,8(\p es) as( d,) |
    R2. |
    c'2(\p h4 |
    b2 a4 |
    as2 g4 |
    fis2 f4) |
    e2( dis4 |
    d2. |
    c4. h8 a4~ |
    a2.) |
    \mBreak

    % page 2 line 3
    des'2(\mf c4 |
    h2 b4 |
    a2 as4\> |
    g2 fis4)\! |
    f2( e4 |
    es2 d 4 |
    des2 c4 |
    h2.) |
    \mark #8
    c4(\p a c |
    a\< c a)\! |
    g4( c g |
    c g\> c)\! |
    \mBreak

    % page 2 line 4
    c4(\p a c |
    a c a) |
    g4( c\< g\! |
    c g\< c)\! |
    b2.\cresc~ |
    b2. |
    des2. |
    as''2( e4) |
    c8(\f g) c( a) c( g) |
    c8( a)\> c( g) c( a) |
    c8(\mf g) c( a) c( g) |
    \mBreak
    
    % page 2 line 5
    c8(\> a) c( g) c( a)\! |
    R2.*2 |
    \bar "||" \tempo "Allegro con brio (come prima)"
    R2.*8 |
    c,4(\p f2) |
    c4( f2) |
    c4( des4) es |
    c4( des4) es8( c8) |
    c8 r8 r4 r |
    R2.*6 |
    \mBreak
    
    % page 2 line 6 (start)
    \mark #9
    g'4(\p c2)
    g4( c2)
    g4( a) g |
    g4( a) g8( gis) |
    e8 r8 r4 r |
    R2.*8 |
    <<
      {
       \override MultiMeasureRest.staff-position = #-4
        R2.*2
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \cueClef "bass" \stemUp des,8^"Bassi" h e4 h | des8 h e4 h | \cueClefUnset
      }
    >>
  }
}

clarinet_II_in_A_part_two_Music = {
  \relative c' {
    \transposition a

    % page 2 line 6 (continued)
    r4 a''8(\f fis) h d |
    cis8 h a( fis) h d |
    \mBreak

    % page 2 line 7
    cis8 h a( fis) h4 |
    fis4 a8( fis) h4 |
    fis4-> a-> fis-> |
    h8-> r8 r4 r |
    \mark #11
    c4\ff c c8-. c-. |
    c4 c c8-. c-. |
    b8 r8 r4 r4 |
    R2. |
    cis,8(\ff ais) dis( fis) e-. dis-. |
    \mBreak
    
    % page 2 line 8
    cis8( ais) dis( fis) e-. dis-. |
    R2. |
    a'8(\ff fis) h( d) c-. h-. |
    a8( fis) h( d) c-. h-. |
    a8( fis) h( fis) a( fis) |
    h8(\< fis) a( fis) h( fis) |
    \mBreak

    % page 2 line 9
    g8\sf\! r8 r4 r |
    R2.*3 |
    g,2.\mf\startTrillSpan~ |
    g2~ g8\stopTrillSpan \tuplet 6/4 { g32( a h c d e } |
    f2.)\startTrillSpan~ |
    f2\<~ f8\stopTrillSpan \tuplet 6/4 { es32( f g a b c } |
    \mark #12
    d8\!) r8 \pitchedTrill d,,2\f\startTrillSpan~ e |
    d2~ d8\stopTrillSpan \tuplet 6/4 { d32_( e fis g a h } |
    \mBreak
    
    % page 2 line 10
    c2.)\startTrillSpan~ |
    c2\stopTrillSpan\< c32( d e fis g a h c)\! |
    a8( fis) h( d) c-. h-. |
    a8( fis) e( g) fis( a) |
    g( e) a( c) h-. a-. |
    g8( e) c(\< d) e-. g-. |
    \mBreak

    % page 2 line 11
    a8.\ff a16 a4~ a8 d,8\f |
    d8. d16 d4\>~ d8\! r8 |
    r4 r4 r8 b,\mf |
    b8. b16 b4\>~ b8\! r8 |
    R2. |
    \bar "||" \key a \major
    R2.*4 |
    fis'8.\mf fis16 fis2->~ |
    fis16 d( e fis) a-> %{ FIXME: really accent? Not in 1st clarinet %} ( fis e fis) e( d h d) |
    \mBreak

    % page 2 line 12
    d8. d16 d4. e8 |
    a,8.\< a16 a4. fis'8\! |
    fis8. fis16 fis4~ fis8 a\f |
    a8. a16 a4.\< fis'8\! |
    fis8. fis16 fis4~ fis8 fis\ff |
    \mark #13
    fis8. fis16 fis2\> |
    R2.\pp\pocoRit |
    \tempo "Meno mosso"
    R2.*9 |
    \mBreak
    
    % page 2 line 13
    d2->\mf(~ d8\> dis)\! |
    R2.*2 |
    h2 e4->(\( |
    dis4) c2\)\! |
    \bar "||" \key c \major
    \mark #14
    \repeat tremolo 12 { b16\mf \pocoAnimato } |
    b8 b16( c des es des c) b( c des es) |
    \repeat tremolo 12 { b16 } |
    b8 b16( c des es des c) b( c des) r16 |
    \mBreak
    
    % page 3 line 1
    \repeat tremolo 12 { c16 } |
    c8 c16( d es f es d) c( d es f) |
    \repeat tremolo 12 { c16 } |
    c8 c16( d es f es d) c( cis d es) |
    \repeat tremolo 12 { b16\< } |
    c8\! c16( d es f es d) c( d c h) |
    \mBreak
    
    % page 3 line 2
    c8 r8 r4 \repeat tremolo 4 { des16-> } |
    b8 r8 r4 r |
    r4 r as'4->( |
    g8)\> b,16(\! c des es des c) b(\> d e\! r16) |
    \bar "||" \key f \major \tempo "Tempo I" 4 = 120
    d2.\f |
    e2( dis4 |
    d2.)~ |
    d4 e( dis |
    d2)\cresc e4( |
    \mBreak

    % page 3 line 3
    dis4) d2 |
    e8( dis) d2->\ff\>~ |
    d2.\pp
    \mark #15
    R2.*2 |
    gis,,2.->\p~ |
    gis2.
    R2.*2 |
    as2.->\p~ |
    as2. |
    e'2.\mf |
    h2.
    d'16\f( es d c) c( d c b) b( c d es) |
    \mBreak

    % page 3 line 4
    f16( g f es) es( f es d) d( es d c) |
    d8 r8 r4 r |
    R2. |
    \bar "||"
    \mark #16
    d'8\sf r8 r4 r |
    r4 r d,16(\ff e d e |
    f8) r8 r4 r |
    r4 r d16( e f g |
    a8)\sf r8 r4 r |
    \mBreak
    
    % page 3 line 5
    r4 r a16\mf\< h a g |
    a8\sf r8 r4 r |
    r4 r h16\mf\< a h c |
    a2.->\ff |
    a2.\> |
    d,16\f e d cis c d c h h c h a |
    a16 h a g g\> a g f f g f e |
    \mBreak
    
    % page 3 line 6
    d8\! r8 r4 r |
    R2. |
    a''8.-.\cresc a16-. a8-. a8-. a8-. a8-. |
    a8.-. a16-. a8-. a8-. a8-. a8-. |
    \mark #17
    a8\sf a\fff g\pesante h a g16( d) |
    f8 r8 r4 r |
    r8 a g\pesante h a g16( d) | % FIXME: Does clarinet 1 have all the \pesante here?
    \mBreak
    
    % page 3 line 7
    f8 r8 r4 r |
    r8 f e\pesante g f e16( a,) |
    d8 r8 r4 r |
    r8 f e\pesante g f e16( a,) |
    d8 r8 r4 r |
    r4 r r8 \tuplet 3/2 { d16(\mf\< es e)\! } |
    f16( g f e d e d c b c b a) |
    \mBreak
    
    % page 3 line 8
    g16( f es) r r4 r8 \tuplet 3/2 { g16(\< as a)\! }
    b16( c b a g a g f es f es d) |
    c8 c'(\mf b) c \acciaccatura { e } d( c16 b) |
    c8 c( b) c \acciaccatura { e } d( c16 b) |
    a8 r r \tuplet 3/2 { e16\f f fis } g8->( e) |
    \mBreak
    
    % page 3 line 9
    a8-> r r \tuplet 3/2 { e16 f fis } g8->( e) |
    a8 r8 r4 r |
    r4 f'8 r as r |
    \mark #18 
    a8\sf r8 r4 r | % Clarinet 1 has \f here?
    r4 r f,16(\< g f g)\! |
    a8 r8 r4 r |
    r4 r f16( g a b) |
    c2.\>~ | % Apparently this isn't an accent in clarinet 1, too
    c2.\mf |
    \mBreak
    
    % page 3 line 10
    cis2.( |
    d2)( f4) |
    d2.(~ |
    d2 f4) |
    f2.( |
    a2\< f4)\! |
    fis2.(~ |
    fis4 g b) |
    f2.(~ |
    f4\> d f)\! |
    f2.(~ |
    f2 des4) |
    f2.( |
    e2.)\> |
    \mBreak
    
    % page 3 line 11
    \mark #19
    f8-.\mf\solo f16-. f16-. \repeat unfold 2 { f8-. f16-. f16-. } | % FIXME: Should that also be Solo in clarinet 1
    \repeat unfold 3 { f8-. f16-. f16-. } |
    \repeat unfold 3 { as8-. as16-. as16-. } |
    \repeat unfold 2 { as8-. as16-. as16-. } f8-. f16-. f16-. |
    \repeat unfold 3 { f8 f16 f16 } | % FIXME: Does clarinet 1 still have staccato here?
    \mBreak

    % page 3 line 12
    \repeat unfold 3 { f8 f16 f16 } |
    \repeat unfold 3 { as8 as16 as16 } |
    \repeat unfold 2 { as8 as16 as16 } f8 f16 f16 |
    \repeat unfold 3 { f8 f16 f16 } |
    \repeat unfold 3 { f8 f16 f16 } |
    \mBreak

    % page 3 line 13
    \repeat unfold 3 { f8 f16 f16 } |
    \repeat unfold 3 { f8 f16 f16 } |
    des8 r8 r4 r |
    r4 r8 b16\p\< b des8 b16 b\! |
    c8 r8 r4 r |
    R2.*2 |
    \mBreak
    
    % page 4 line 1
    r4 r8 b16 b des8 b16 b |
    \mBreak
%{
    
   
    as8 c16 c as8 c16 c as8\< f16 f |
    e8\f e16 e e8 e16 e e8(\> f8) |
    as8\mf c16 c as8 c16 c as8\< f16 f |
    e8\f e16\pesante e e8 e16 e e8(\> f8) |
    \mBreak

    % page 4 line 2
    as8\mf as16 as as8 as16 as as8 as16 as |
    as8 as16 as as8\> as16 as as8\! r8 |
    \mark #20
    R2.*14 |
    \tuplet 3/2 { f,8\p\cresc f f } \tuplet 3/2 { \repeat tremolo 3 f8 } \tuplet 3/2 { \repeat tremolo 3 f8 } |
    \repeat unfold 3 \tuplet 3/2 { \repeat tremolo 3 f8 } |
    \mark #21
    des''8\sf b8\ff b\pesante b b r8 |
    R2. |
    \mBreak
    
    % page 4 line 3
    des8\sf b8\pesante b b b r8 |
    R2. |
    des8\sf\pocoAnimato r8 r4 r4 |
    r8 g,16(\f\< a) b( c b a) a( b a g)\! |
    f16( g f es) g8 r8 r4 |
    r8 g16(\f\< a) b( c b a) a( b a g)\! |
    \mBreak
    
    % page 4 line 4
    b8 g16(\cresc a) b( c b a) a( b a g) |
    b8 g16( a) b( c b a) g( b c des) |
    es8\fff b16-. b-. es8 b8 es,8 b16-. b-. |
    es8 b es, b16 b es8 b |
    r4 es''8\sf r8\lunga r4\fermata |
    \bar "||" \time 4/4 
    \mBreak
    
    % page 4 line 5
    \tempo "Tempo del comincio"
    R1*2 |
    R1*2\moltoRit |
    \mark #22
    R1*2\pocoAPocoPiuAnimato | % FIXME: Why does that not appear after V?
    r4 g,,4\p\<~ g2\! |
    g4( ges f a\> |
    d8)\! r8 r4 \tuplet 3/2 { h'8(\< c cis } \tuplet 3/2 { d dis e)\! } |
    f8 r8 r4 \tuplet 3/2 { h,8(\< c cis } \tuplet 3/2 { d e eis)\! } |
    \bar "||" \key d \major
    \mBreak

    % page 4 line 6
    \tempo "Andante mosso" 4 = 100
    fis8 r8 r4 r2 |
    \tuplet 3/2 { h,8(\f c cis } \tuplet 3/2 { d dis e } \tuplet 3/2 { eis,\< fis g } \tuplet 3/2 { gis a ais\!) } |
    h8 r8 r4 r2 |
    \tuplet 3/2 { h8( c cis } \tuplet 3/2 { d dis e } \tuplet 3/2 { eis,\< fis g } \tuplet 3/2 { gis a ais\!) } |
    h8 r8 r4 r2 |
    R1*2
    \mBreak
    
    % page 4 line 7
    \tuplet 3/2 { h8( c cis } \tuplet 3/2 { d dis e } \tuplet 3/2 { eis,\< fis g } \tuplet 3/2 { gis ais h\!) } |
    \mark #23
    a16( d, dis e eis fis g gis a ais h c cis d) r8 |
    r2 \tuplet 3/2 { d8( cis c } \tuplet 3/2 { h ais h) }
    \mBreak
    
    % page 4 line 8
    c16( d, dis e eis fis g gis a ais h c cis d) r8 |
    r2 \tuplet 3/2 { d8( cis c } \tuplet 3/2 { h ais h) } |
    d16( g, gis a ais h c cis d) r16 r8 r4 |
    \mBreak
    
    % page 4 line 9
    r4 d16( dis e f) \tuplet 3/2 { e8( dis d } \tuplet 3/2 { cis c h) } |
    as16( f g as a b h c cis d) r8 r4 |
    r4 r16 d( dis e) \tuplet 3/2 { f8( cis d } \tuplet 3/2 { dis e f) } |
    \mBreak

    % page 4 line 10
    \mark 24
    \tuplet 3/2 { g8( fis f } \tuplet 3/2 { e es d) } \tuplet 3/2 { f( e es } \tuplet 3/2 { d cis d)} |
    \tuplet 3/2 { b8( c cis } \tuplet 3/2 { d dis e) } \tuplet 3/2 { f( f, fis } \tuplet 3/2 { g gis a) } |
    \tuplet 3/2 { b8( d cis } \tuplet 3/2 { c h b) } \tuplet 3/2 { a( e' d } \tuplet 3/2 { cis c b) } |
    \mBreak
    
    % page 4 line 11
    \tuplet 3/2 { f'8( e es } \tuplet 3/2 { d c b) } \tuplet 3/2 { d( cis c } \tuplet 3/2 { h ais a) } |
    d1->\cresc\string~ |
    d1 |
    d1~ |
    d1 |
    \mark #25
    \tempo "Allegro molto"
    fis,16(\fff d \repeat unfold 6 { fis d } fis d) |
    \mBreak
    
    % page 4 line 12
    a'16( f \repeat unfold 6 { a16 f } g d) |
    fis16( d \repeat unfold 6 { fis d } fis d) |
    a'16( f \repeat unfold 6 { a f } g d) |
    \mBreak
    
    % page 4 line 13
    fis16(\legato d \repeat unfold 6 { fis d } fis d) |
    \repeat tremolo 4 { fis16( d } \repeat tremolo 4 { fis16 d) } |
    \repeat tremolo 4 { fis16( a } \repeat tremolo 4 { fis16 a) } |
    \repeat tremolo 4 { fis16( a } \repeat tremolo 4 { fis16 a) } |
    fis8\sf r8 r4 r2 |
    \bar "|."
%}
  }
}

\bookpart {
  \header{
    instrument = "Klarinette I in A"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      % Make grace notes smaller and more fragile
      $(add-grace-property 'Voice 'NoteHead 'font-size '-5)
      $(add-grace-property 'Voice 'Slur 'height-limit '0.5)
      $(add-grace-property 'Voice 'Flag 'font-size '-5)
      $(add-grace-property 'Voice 'Stem 'length '8)
      $(add-grace-property 'Voice 'Beam 'beam-thickness '0.3)
      $(add-grace-property 'Voice 'Beam 'length-fraction '0.5)
      $(add-grace-property 'Voice 'Beam 'shorten '1)
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        {
          % \transpose b a
          \clarinet_I_in_A_part_one_Music
        }
        \clarinet_I_in_B_Music
        {
          % \transpose b a
          \clarinet_I_in_A_part_two_Music
        }
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
      \compressFullBarRests
      % Make grace notes smaller and more fragile
      $(add-grace-property 'Voice 'NoteHead 'font-size '-5)
      $(add-grace-property 'Voice 'Slur 'height-limit '0.5)
      $(add-grace-property 'Voice 'Flag 'font-size '-5)
      $(add-grace-property 'Voice 'Stem 'length '8)
      $(add-grace-property 'Voice 'Beam 'beam-thickness '0.3)
      $(add-grace-property 'Voice 'Beam 'length-fraction '0.5)
      $(add-grace-property 'Voice 'Beam 'shorten '1)
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        {
          % \transpose b a
          \clarinet_II_in_A_part_one_Music
        }
        \clarinet_II_in_B_Music
        {
          % \transpose b a
          \clarinet_II_in_A_part_two_Music
        }
      }
    }
  }
}
