(**************************************************************************)
(*                                                                        *)
(*  This file is part of Frama-C.                                         *)
(*                                                                        *)
(*  Copyright (C) 2007-2016                                               *)
(*    CEA (Commissariat à l'énergie atomique et aux énergies              *)
(*         alternatives)                                                  *)
(*                                                                        *)
(*  All rights reserved.                                                  *)
(*  Contact CEA LIST for licensing.                                       *)
(*                                                                        *)
(**************************************************************************)

open Cil_types

type 'a alarm_gen =
  remove_trivial:bool ->
  on_alarm:(?status:Property_status.emitted_status ->
            Alarms.alarm ->
            unit) ->
  'a -> unit
(** ['a alarm_gen] is an abstraction over the process of generating a certain
    kind of RTEs over something of type ['a].
    The [on_alarm] argument receives all corresponding alarms, with
    optionally a status indicating that the alarm is red. *)

val lval_assertion: read_only: Alarms.access_kind -> lval alarm_gen
val divmod_assertion: exp alarm_gen
val signed_div_assertion: (exp * exp * exp) alarm_gen
val shift_alarm: (exp * int option) alarm_gen
val signed_shift_assertion: (exp * binop * exp * exp) alarm_gen
val mult_sub_add_assertion: (bool * exp * binop * exp * exp) alarm_gen
val uminus_assertion: exp alarm_gen
val signed_downcast_assertion: (typ * exp) alarm_gen
val unsigned_downcast_assertion: (typ * exp) alarm_gen
val float_to_int_assertion: (typ * exp) alarm_gen

(*
Local Variables:
compile-command: "make -C ../../.."
End:
*)