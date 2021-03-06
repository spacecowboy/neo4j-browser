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

'use strict';

angular.module('neo4jApp.filters')
  .filter('neo4jdoc', () ->
    (input) ->
      return '' unless typeof input is 'string'
      input.replace /^(\d\.\d)\.\d(-.+)?$/, (match, majorMinor, nonGaSuffix) ->
        if nonGaSuffix then majorMinor + '-beta' else majorMinor
  ).filter('neo4jDeveloperDoc', ['neo4jdocFilter', (neo4jdocFilter) ->
    (input) ->
      return '' unless typeof input is 'string'
      return 'http://neo4j.com/docs/developer-manual/' + neo4jdocFilter(input)
  ])
  .filter('neo4jOperationsDoc', ['neo4jdocFilter', (neo4jdocFilter) ->
    (input) ->
      return '' unless typeof input is 'string'
      return 'http://neo4j.com/docs/operations-manual/' + neo4jdocFilter(input)
  ])
  .filter('neo4jCypherRefcardDoc', ['neo4jdocFilter', (neo4jdocFilter) ->
    (input) ->
      return '' unless typeof input is 'string'
      return 'http://neo4j.com/docs/cypher-refcard/' + neo4jdocFilter(input)
  ])
