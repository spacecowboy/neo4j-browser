###!
Copyright (c) 2002-2016 "Neo Technology,"
Network Engine for Objects in Lund AB [http://neotechnology.com]

This file is part of Neo4j.

Neo4j is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
###

if typeof String::trim isnt "function"
  String::trim = ->
    @replace /^\s+|\s+$/g, ""

Object.keys = Object.keys or (o, k, r) ->
  # object
  # key
  # result array

  # initialize object and result
  r = []

  # iterate over object keys
  for k of o

    # fill result array with non-prototypical keys
    r.hasOwnProperty.call(o, k) and r.push(k)

  # return result
  r

if not Function.prototype.bind
  Function.prototype.bind = (oThis) ->
    if typeof this isnt 'function'
      throw new TypeError('Function.prototype.bind - what is trying to be bound is not callable')

    aArgs = Array.prototype.slice.call(arguments, 1)
    fToBind = this
    fNOP = ->
    fBound = ->
      return fToBind.apply(
        (if this instanceof fNOP then this else oThis)
        , aArgs.concat(Array.prototype.slice.call(arguments)))

    if this.prototype
      fNOP.prototype = this.prototype;
    fBound.prototype = new fNOP()
    return fBound

unless String.prototype.includes
  String.prototype.includes = () ->
    String.prototype.indexOf.apply(this, arguments) isnt -1
