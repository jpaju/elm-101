module Navbar exposing (view)

import Element
    exposing
        ( Element
        , centerX
        , fill
        , paddingEach
        , paddingXY
        , pointer
        , row
        , spacing
        , width
        )
import Element.Background as Background
import Element.Border as Border
import Element.Region as Region
import Ui.Colors exposing (blue)
import Page as Page exposing (Page(..))
import Route exposing (Route)


view : Page -> Element msg
view currPage =
    let
        navLink =
            navElement currPage
    in
    row
        [ width fill
        , paddingEach { top = 0, right = 5, bottom = 20, left = 5 }
        , spacing 5
        , Region.navigation
        ]
        [ navLink Route.Counter "Counter"
        , navLink Route.Player "Player"
        , navLink Route.FunStuff "FunStuff"
        ]


navElement : Page -> Route -> String -> Element msg
navElement currPage route label =
    let
        isActivePage =
            isActive route currPage

        backgroundColor =
            if isActivePage then
                Background.color Ui.Colors.red

            else
                Background.color blue
    in
    Element.link
        [ centerX
        , width fill
        , backgroundColor
        , Border.rounded 3
        , paddingXY 20 10
        , pointer
        ]
        { url = Route.href route, label = Element.text label }


isActive : Route -> Page -> Bool
isActive route page =
    case ( route, page ) of
        ( Route.Counter, Page.Counter ) ->
            True

        ( Route.Player, Page.Player ) ->
            True

        ( Route.FunStuff, Page.Memes ) ->
            True

        _ ->
            False