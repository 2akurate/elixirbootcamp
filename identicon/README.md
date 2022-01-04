### :egd issue
Because :egd isn’t the part of Erlang-OTP release anymore, so you’d need to add 
> {:egd, github: "erlang/egd"} 
to your dependencies

Once :egd is added to the dependencies, you’d need to install rebar, the erlang build tool, as this library depends on rebar. Run 
> mix local.rebar --force 
to install rebar (and rebar3). After installing rebar close and re-open your terminal and run 
> mix deps.get 
inside the project folder.