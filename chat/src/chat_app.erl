%%%-------------------------------------------------------------------
%%% @author Eric Merritt <ericbmerritt@gmail.com>
%%% @copyright (C) 2014, Eric Merritt
%%% @doc
%%%
%%% @end
%%% Created : 29 Aug 2014 by Eric Merritt <ericbmerritt@gmail.com>
%%%-------------------------------------------------------------------
-module(chat_app).

-behaviour(application).

%% API
-export([manual_start/0, manual_stop/0]).

%% Application callbacks
-export([start/2, stop/1]).

%%%===================================================================
%%% API
%%%===================================================================
manual_start() ->
    ok = lager:start(),
    application:start(?MODULE).

manual_stop()  ->
    application:stop(?MODULE).

%%%===================================================================
%%% Application callbacks
%%%===================================================================
start(_Type, _Args) ->
    chat_sup:start_link().

stop(_State) ->
    ok.
