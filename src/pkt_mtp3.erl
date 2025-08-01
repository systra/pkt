-module(pkt_mtp3).

-include("pkt_mtp3.hrl").

-export([codec/1]).

codec(<<NI:2, _Spare:2, SI:4, RL:32/integer-little, Payload/binary>>) ->
    <<SLS:4, OPC:14, DPC:14>> = <<RL:32/integer-big>>,
    {#mtp3{network_ind = NI, service_ind = SI, routing_label = #mtp3_routing_label{sls = SLS, opc = OPC, dpc = DPC}}, Payload};
codec(#mtp3{network_ind = NI, service_ind = SI, routing_label = #mtp3_routing_label{sls = SLS, opc = OPC, dpc = DPC}}) ->
    <<RL:32/integer-little>> = <<SLS:4, OPC:14, DPC:14>>,
    <<NI:2, 0:2, SI:4, RL:32/integer-big>>.
