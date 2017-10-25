-record(mtp3_routing_label, {
          sls :: 0 .. 2#1111, % Signalling Link Selector
          opc :: 0 .. 16#3FF, % Originating Point Code
          dpc :: 0 .. 16#3FF  % Destination Point Code
       }).

-record(mtp3, {
          network_ind :: 0 .. 2#11,   % Network Indicator
          service_ind :: 0 .. 2#1111, % Service Indicator
          routing_label
       }).
