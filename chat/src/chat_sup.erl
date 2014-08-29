%%%-------------------------------------------------------------------
%%% @doc
%%%
%%% @end
%%% Created : 29 Aug 2014 by Eric Merritt <ericbmerritt@gmail.com>
%%%-------------------------------------------------------------------
-module(chat_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%%===================================================================
%%% API functions
%%%===================================================================

%% @doc
%% Starts the supervisor
-spec start_link() -> {ok, pid()} | ignore | {error, Error::any()}.
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%% @private
init([]) ->
    RestartStrategy = one_for_one,
    MaxRestarts = 1000,
    MaxSecondsBetweenRestarts = 3600,

    SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},

    Restart = permanent,
    Shutdown = 2000,
    Type = worker,

    ChatServer = {chat_server, {chat_server, start_link, []},
              Restart, Shutdown, Type, [chat_server]},

    {ok, {SupFlags, [ChatServer]}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
