GNATdoc.Documentation = {
  "label": "Spark_Unbound.Arrays",
  "qualifier": "",
  "summary": [
    {
      "kind": "paragraph",
      "children": [
        {
          "kind": "span",
          "text": "This package is intended as a safe and proven alternative to `Ada.Containers.Vector`.\n"
        }
      ]
    }
  ],
  "description": [
    {
      "kind": "paragraph",
      "children": [
        {
          "kind": "span",
          "text": "This package offers proven functions/procedures for an unbound array that are inspired by the `Ada.Containers.Vector` package.\n"
        }
      ]
    },
    {
      "kind": "paragraph",
      "children": [
        {
          "kind": "span",
          "text": "Note: The range of `Index_Type` must be smaller than `Natural'Range_Length` since `Capacity' and `Length` return type `Natural`.\n"
        },
        {
          "kind": "span",
          "text": "This is NOT enforced by the compiler!\n"
        }
      ]
    }
  ],
  "entities": [
    {
      "entities": [
        {
          "label": "No_Index",
          "qualifier": "",
          "line": 38,
          "column": 4,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 38,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "No_Index"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "constant"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Extended_Index"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":="
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Extended_Index"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "'"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "First"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Index used to indicate 'out of range`.\n"
                }
              ]
            }
          ]
        }
      ],
      "label": "Constants and variables"
    },
    {
      "entities": [
        {
          "label": "Array_Type",
          "qualifier": "",
          "line": 41,
          "column": 9,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 41,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "type"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Array_Type",
                      "href": "docs/spark_unbound__arrays___spec.html#L41C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "is"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "array"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index_Type",
                      "href": "docs/spark_unbound__arrays___spec.html#L13C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "range"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "<>"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "of"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Element_Type"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Note: Type should be treated as private.\n"
                }
              ]
            }
          ]
        },
        {
          "label": "Extended_Index",
          "qualifier": "",
          "line": 33,
          "column": 12,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 33,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "subtype"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Extended_Index",
                      "href": "docs/spark_unbound__arrays___spec.html#L33C12"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "is"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 34,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index_Type",
                      "href": "docs/spark_unbound__arrays___spec.html#L13C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "'"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Base"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "range"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 35,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "       "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index_Type",
                      "href": "docs/spark_unbound__arrays___spec.html#L13C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "'"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "First"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "-"
                    },
                    {
                      "kind": "span",
                      "cssClass": "number",
                      "text": "1"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ".."
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index_Type",
                      "href": "docs/spark_unbound__arrays___spec.html#L13C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "'"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Min"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index_Type",
                      "href": "docs/spark_unbound__arrays___spec.html#L13C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "'"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Base"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "'"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Last"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "-"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "number",
                      "text": "1"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ","
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index_Type",
                      "href": "docs/spark_unbound__arrays___spec.html#L13C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "'"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Last"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "+"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "number",
                      "text": "1"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Type to provide the possibility of one invalid index.\n"
                }
              ]
            }
          ]
        }
      ],
      "label": "Simple types"
    },
    {
      "entities": [
        {
          "label": "Array_Acc",
          "qualifier": "",
          "line": 43,
          "column": 9,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 43,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "type"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Array_Acc",
                      "href": "docs/spark_unbound__arrays___spec.html#L43C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "is"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "access"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Array_Type",
                      "href": "docs/spark_unbound__arrays___spec.html#L41C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Note: Type should be treated as private.\n"
                }
              ]
            }
          ]
        }
      ],
      "label": "Access types"
    },
    {
      "entities": [
        {
          "label": "Unbound_Array",
          "qualifier": "",
          "line": 50,
          "column": 9,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 50,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "type"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "is"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "record"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 51,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "      "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Last",
                      "href": "docs/spark_unbound__arrays___spec.html#L51C7"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Extended_Index",
                      "href": "docs/spark_unbound__arrays___spec.html#L33C12"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":="
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "No_Index"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 52,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "      "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Arr",
                      "href": "docs/spark_unbound__arrays___spec.html#L52C7"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Array_Acc",
                      "href": "docs/spark_unbound__arrays___spec.html#L43C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":="
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 53,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "end"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "record"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 54,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Dynamic_Predicate => ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Arr = "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 55,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                                  Last = No_Index"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 56,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                                  "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 57,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                                    (Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'First = Index_Type'First "
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 58,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                                     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'First <= Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'Last"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 59,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                                     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'Length <= 0 "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last = No_Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last <= Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'Last)))"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Main type for `Unbound_Array` handling.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Note: `Last` and `Arr` should not be changed manually.\n"
                }
              ]
            }
          ],
          "fields": [
            {
              "label": "Last",
              "line": 51,
              "column": 7,
              "type": {
                "label": "Spark_Unbound.Arrays.Extended_Index",
                "docHref": "docs/spark_unbound__arrays___spec.html#L33C12"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Index of the last valid entry in Arr.all.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Arr",
              "line": 52,
              "column": 7,
              "type": {
                "label": "Spark_Unbound.Arrays.Array_Acc",
                "docHref": "docs/spark_unbound__arrays___spec.html#L43C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Reference to the underlying allocated array.\n"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ],
      "label": "Record types"
    },
    {
      "entities": [
        {
          "label": "=",
          "qualifier": "",
          "line": 97,
          "column": 14,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This function compares two `Unbound_Array`s by comparing each element (using the generic formal equality operator)\n"
                },
                {
                  "kind": "span",
                  "text": "if `Left` and `Right` have the same length.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Note: The capacity can be different and `Left` and `Right` are still considered equal.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(n) => All elements might be compared.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Left",
              "line": 97,
              "column": 18,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "`Unbound_Array` compared against `Right`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Right",
              "line": 97,
              "column": 24,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "`Unbound_Array` compared against `Left`.\n"
                    }
                  ]
                }
              ]
            }
          ],
          "returns": {
            "description": [
              {
                "kind": "paragraph",
                "children": [
                  {
                    "kind": "span",
                    "text": "`True` if `Left` and `Right` have the same elements in the same sequence. Otherwise, `False` is returned.\n"
                  }
                ]
              }
            ]
          }
        },
        {
          "label": "Append",
          "qualifier": "",
          "line": 248,
          "column": 14,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 248,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "procedure"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Append",
                      "href": "docs/spark_unbound__arrays___spec.html#L248C14"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L248C22"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "in"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "out"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "New_Item",
                      "href": "docs/spark_unbound__arrays___spec.html#L248C51"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "in"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Element_Type"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Success",
                      "href": "docs/spark_unbound__arrays___spec.html#L248C79"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "out"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Boolean"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 249,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Pre => Self.Arr /= "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " In_Range(Arg => Long_Natural_To_Big.To_Big_Integer(Capacity(Self)),"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 250,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                                                    Low => Long_Natural_To_Big.To_Big_Integer(Long_Natural'First), "
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 251,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                                                    High => "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "abs"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "(Index_Type_To_Big.To_Big_Integer(Index_Type'Last) - Index_Type_To_Big.To_Big_Integer(Index_Type'First))),"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 252,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     Post => ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Success "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 253,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                Self.Arr /= "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Element(Self) = New_Item "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Last = Self.Last'Old + 1"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 254,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Last'Old /= No_Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Ghost_Arr_Equals(Left => Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": ", Right => Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'Old, First => First_Index(Self), Last => Self.Last'Old))"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 255,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "              "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "elsif"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Arr = "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Last = No_Index "
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 256,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "              "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " (Self.Last = Self.Last'Old "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Ghost_Arr_Equals(Left => Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": ", Right => Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'Old, First => First_Index(Self), Last => Last_Index(Self))))"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Procedure that tries to append `New_Item` to `Self`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Note: The underlying array of `Self` is tried to be increased automatically if `Capacity(Self) = Length(Self)`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(n) => `Capacity(Self)` is tried to be doubled if `Capacity(Self) = Length(Self)` is reached.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 248,
              "column": 22,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "New_Item",
              "line": 248,
              "column": 51,
              "type": {
                "label": "Spark_Unbound.Arrays.Element_Type",
                "docHref": "docs/spark_unbound__arrays___spec.html#L12C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Element that is appended to `Self` if `Success = True`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Success",
              "line": 248,
              "column": 79,
              "type": {
                "label": "Boolean"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "`True` if `New_Item` got appended to `Self`.\n"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "label": "Capacity",
          "qualifier": "",
          "line": 114,
          "column": 13,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 114,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "function"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Capacity",
                      "href": "docs/spark_unbound__arrays___spec.html#L114C13"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L114C23"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "return"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Long_Natural",
                      "href": "docs/spark_unbound___spec.html#L19C12"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 115,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Post => ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Arr /= "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Capacity'Result = Ghost_Acc_Length(Self.Arr) "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Capacity'Result = Long_Natural'First)"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This function returns the capacity of `Self`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => Size of underlying array is always known.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 114,
              "column": 23,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            }
          ],
          "returns": {
            "description": [
              {
                "kind": "paragraph",
                "children": [
                  {
                    "kind": "span",
                    "text": "The capacity of `Self` (More precise: The length of the underlying allocated array).\n"
                  }
                ]
              }
            ]
          }
        },
        {
          "label": "Clear",
          "qualifier": "",
          "line": 160,
          "column": 14,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 160,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "procedure"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Clear",
                      "href": "docs/spark_unbound__arrays___spec.html#L160C14"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L160C21"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "in"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "out"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 161,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Post => Self.Arr = "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Last = No_Index"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This procedure deallocates the underlying array of `Self` and sets `Self.Last = No_Index`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => Unchecked_Deallocation of underlying array.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 160,
              "column": 21,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "label": "Contains",
          "qualifier": "",
          "line": 356,
          "column": 13,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This function searches the elements of `Self` for an element equal to `Item` (using the generic formal equality operator).\n"
                },
                {
                  "kind": "span",
                  "text": "The search starts at position `Index` and proceeds towards `Last_Index(Self)`.\n"
                },
                {
                  "kind": "span",
                  "text": "If no equal element is found, then `Contains` returns `False`. Otherwise, `Contains` returns true.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(n) => All elements might get compared against `Item`.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 356,
              "column": 23,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Item",
              "line": 356,
              "column": 45,
              "type": {
                "label": "Spark_Unbound.Arrays.Element_Type",
                "docHref": "docs/spark_unbound__arrays___spec.html#L12C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Element that is searched for in `Self`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Index",
              "line": 356,
              "column": 66,
              "type": {
                "label": "Spark_Unbound.Arrays.Index_Type",
                "docHref": "docs/spark_unbound__arrays___spec.html#L13C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Array index to start searching towards `Last_Index(Self)` for `Item`.\n"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "label": "Copy",
          "qualifier": "",
          "line": 199,
          "column": 14,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 199,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "procedure"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Copy",
                      "href": "docs/spark_unbound__arrays___spec.html#L199C14"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Target",
                      "href": "docs/spark_unbound__arrays___spec.html#L199C20"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "out"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Source",
                      "href": "docs/spark_unbound__arrays___spec.html#L199C48"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Success",
                      "href": "docs/spark_unbound__arrays___spec.html#L199C72"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "out"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Boolean"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 200,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Post => ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Success "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Target = Source "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Capacity(Target) = Capacity(Source)"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 201,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " (Target.Last = No_Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Target.Arr = "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "))"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Procedure that tries to copy elements of `Source` to `Target`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Note: `Target` is set to `Target.Arr = null` and `Target.Last = No_Index` if `Success = False`. `Source` remains unchanged.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(n) => All elements must be copied, but allocation might fail before.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Target",
              "line": 199,
              "column": 20,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array` with `Target = Source` and `Capacity(Target) = Capacity(Source)` on `Success = True`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Source",
              "line": 199,
              "column": 48,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array` that is copied to `Target`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Success",
              "line": 199,
              "column": 72,
              "type": {
                "label": "Boolean"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "`True` if all elements of `Source` were copied to `Target`.\n"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "label": "Delete_Last",
          "qualifier": "",
          "line": 277,
          "column": 14,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 277,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "procedure"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Delete_Last",
                      "href": "docs/spark_unbound__arrays___spec.html#L277C14"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L277C27"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "in"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "out"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Count",
                      "href": "docs/spark_unbound__arrays___spec.html#L277C56"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "in"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Long_Positive",
                      "href": "docs/spark_unbound___spec.html#L22C12"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":="
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "number",
                      "text": "1"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 278,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Pre => Self.Arr /= "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Length(Self) >= Long_Natural(Count),"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 279,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     Post => Long_Integer(Self.Last'Old) - Long_Integer(Self.Last) = Count"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 280,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Index(Self) > No_Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 281,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                 Ghost_Arr_Equals(Left => Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": ", Right => Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'Old, First => First_Index(Self), Last => Last_Index(Self))"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 282,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "               "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Is_Empty(Self))"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This procedure deletes the last `Count` elements inside `Self`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => Only `Last_Index(Self)` is reduced.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 277,
              "column": 27,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Count",
              "line": 277,
              "column": 56,
              "type": {
                "label": "Spark_Unbound.Long_Positive",
                "docHref": "docs/spark_unbound___spec.html#L22C12"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Number of elements to delete.\n"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "label": "Element",
          "qualifier": "",
          "line": 169,
          "column": 13,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 169,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "function"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Element",
                      "href": "docs/spark_unbound__arrays___spec.html#L169C13"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L169C22"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index",
                      "href": "docs/spark_unbound__arrays___spec.html#L169C44"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index_Type",
                      "href": "docs/spark_unbound__arrays___spec.html#L13C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "return"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Element_Type"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 170,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Pre => Last_Index(Self) > No_Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Index(Self) >= Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " First_Index(Self) <= Index,"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 171,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     Post => Element'Result = Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "(Index)"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This function returns the element inside `Self` at index `Index`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => Index access on array is constant time.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 169,
              "column": 22,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Index",
              "line": 169,
              "column": 44,
              "type": {
                "label": "Spark_Unbound.Arrays.Index_Type",
                "docHref": "docs/spark_unbound__arrays___spec.html#L13C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Array index for the element that should be returned.\n"
                    }
                  ]
                }
              ]
            }
          ],
          "returns": {
            "description": [
              {
                "kind": "paragraph",
                "children": [
                  {
                    "kind": "span",
                    "text": "The element inside `Self` at index `Index`.\n"
                  }
                ]
              }
            ]
          }
        },
        {
          "label": "Find_Index",
          "qualifier": "",
          "line": 337,
          "column": 13,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This function searches the elements of `Self` for an element equal to `Item` (using the generic formal equality operator).\n"
                },
                {
                  "kind": "span",
                  "text": "The search starts at position `Index` and proceeds towards `Last_Index(Self)`.\n"
                },
                {
                  "kind": "span",
                  "text": "If no equal element is found, then `Find_Index` returns `No_Index`. Otherwise, it returns the index of the first equal element encountered.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Note: Same behavior as `Find_Index` defined in `Ada.Containers.Vectors` [RM-A-18-2].\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(n) => All elements might get compared against `Item`.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 337,
              "column": 25,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Item",
              "line": 337,
              "column": 47,
              "type": {
                "label": "Spark_Unbound.Arrays.Element_Type",
                "docHref": "docs/spark_unbound__arrays___spec.html#L12C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Element that is searched for in `Self`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Index",
              "line": 337,
              "column": 68,
              "type": {
                "label": "Spark_Unbound.Arrays.Index_Type",
                "docHref": "docs/spark_unbound__arrays___spec.html#L13C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Array index to start searching towards `Last_Index(Self)` for `Item`.\n"
                    }
                  ]
                }
              ]
            }
          ],
          "returns": {
            "description": [
              {
                "kind": "paragraph",
                "children": [
                  {
                    "kind": "span",
                    "text": "`No_Index` if `Item` was not found, or the index `I` where `Element(Self, I) = Item`.\n"
                  }
                ]
              }
            ]
          }
        },
        {
          "label": "First_Element",
          "qualifier": "",
          "line": 304,
          "column": 13,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 304,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "function"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "First_Element",
                      "href": "docs/spark_unbound__arrays___spec.html#L304C13"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L304C28"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "return"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Element_Type"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 305,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Pre => Self.Arr /= "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Last /= No_Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Length(Self) > Long_Natural'First,"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 306,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     Post => First_Element'Result = Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "(First_Index(Self))"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This function returns the element at `First_Index(Self)`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => Array access is constant time.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 304,
              "column": 28,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            }
          ],
          "returns": {
            "description": [
              {
                "kind": "paragraph",
                "children": [
                  {
                    "kind": "span",
                    "text": "The first element of `Self`.\n"
                  }
                ]
              }
            ]
          }
        },
        {
          "label": "First_Index",
          "qualifier": "",
          "line": 296,
          "column": 13,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 296,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "function"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "First_Index",
                      "href": "docs/spark_unbound__arrays___spec.html#L296C13"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L296C26"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "return"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index_Type",
                      "href": "docs/spark_unbound__arrays___spec.html#L13C9"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 297,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Inline, Post => ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Arr = "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " First_Index'Result = Index_Type'First "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " First_Index'Result = Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'First)"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This function returns the first index of `Self`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => First index is fixed.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 296,
              "column": 26,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            }
          ],
          "returns": {
            "description": [
              {
                "kind": "paragraph",
                "children": [
                  {
                    "kind": "span",
                    "text": "The first index of `Self`.\n"
                  }
                ]
              }
            ]
          }
        },
        {
          "label": "Get_Capacity_Offset",
          "qualifier": "",
          "line": 83,
          "column": 13,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 83,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "function"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Get_Capacity_Offset",
                      "href": "docs/spark_unbound__arrays___spec.html#L83C13"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Offset",
                      "href": "docs/spark_unbound__arrays___spec.html#L83C34"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Long_Positive",
                      "href": "docs/spark_unbound___spec.html#L22C12"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "return"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index_Type",
                      "href": "docs/spark_unbound__arrays___spec.html#L13C9"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 84,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Pre => Ghost_In_Index_Range(Offset),"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 85,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     Post => Index_Type_To_Big.To_Big_Integer(Get_Capacity_Offset'Result)"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 86,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "       = Index_Type_To_Big.To_Big_Integer(Index_Type'First) + (Long_Positive_To_Big.To_Big_Integer(Offset) - Long_Positive_To_Big.To_Big_Integer(Long_Positive'First))"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This function calculates the `Index_Type` for `Offset + Index_Type'Last`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => Integer calculation.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Offset",
              "line": 83,
              "column": 34,
              "type": {
                "label": "Spark_Unbound.Long_Positive",
                "docHref": "docs/spark_unbound___spec.html#L22C12"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "The vallue added to `Index_Type'First`.\n"
                    }
                  ]
                }
              ]
            }
          ],
          "returns": {
            "description": [
              {
                "kind": "paragraph",
                "children": [
                  {
                    "kind": "span",
                    "text": "`Offset + Index_Type'First`.\n"
                  }
                ]
              }
            ]
          }
        },
        {
          "label": "Is_Empty",
          "qualifier": "",
          "line": 153,
          "column": 13,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 153,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "function"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Is_Empty",
                      "href": "docs/spark_unbound__arrays___spec.html#L153C13"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L153C23"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "return"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Boolean"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 154,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Post => ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Index(Self) = No_Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Is_Empty'Result = True "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Is_Empty'Result = False)"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This function denotes if `Self` as no elements.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => Length(Self) is always known.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 153,
              "column": 23,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            }
          ],
          "returns": {
            "description": [
              {
                "kind": "paragraph",
                "children": [
                  {
                    "kind": "span",
                    "text": "`True` if `Self` has no elements, or `False` if `Self` has at least one element.\n"
                  }
                ]
              }
            ]
          }
        },
        {
          "label": "Last_Element",
          "qualifier": "",
          "line": 322,
          "column": 13,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 322,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "function"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Last_Element",
                      "href": "docs/spark_unbound__arrays___spec.html#L322C13"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L322C27"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "return"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Element_Type"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 323,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Pre => Self.Arr /= "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Index(Self) > No_Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Length(Self) > Long_Natural'First,"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 324,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     Post => Last_Element'Result = Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "(Last_Index(Self))"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This function returns the element at `Last_Index(Self)`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => Array access is constant time.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 322,
              "column": 27,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            }
          ],
          "returns": {
            "description": [
              {
                "kind": "paragraph",
                "children": [
                  {
                    "kind": "span",
                    "text": "The last element of `Self`.\n"
                  }
                ]
              }
            ]
          }
        },
        {
          "label": "Last_Index",
          "qualifier": "",
          "line": 313,
          "column": 13,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 313,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "function"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Last_Index",
                      "href": "docs/spark_unbound__arrays___spec.html#L313C13"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L313C25"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "return"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Extended_Index",
                      "href": "docs/spark_unbound__arrays___spec.html#L33C12"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 314,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Post => (Last_Index'Result = Self.Last "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Arr = "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Index'Result = No_Index "
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 315,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                       "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "elsif"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'Length > 0 "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Index'Result <= Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'Last "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Index'Result = No_Index)), Inline"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This function returns the last index of `Self`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => `Last_Index(Self)` is kept with `Self.Last`.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 313,
              "column": 25,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            }
          ],
          "returns": {
            "description": [
              {
                "kind": "paragraph",
                "children": [
                  {
                    "kind": "span",
                    "text": "The last index of `Self`.\n"
                  }
                ]
              }
            ]
          }
        },
        {
          "label": "Length",
          "qualifier": "",
          "line": 143,
          "column": 13,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 143,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "function"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Length",
                      "href": "docs/spark_unbound__arrays___spec.html#L143C13"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L143C21"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "return"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Long_Natural",
                      "href": "docs/spark_unbound___spec.html#L19C12"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 144,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Post => ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Index(Self) = No_Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "or"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Capacity(Self) = Long_Natural'First "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Length'Result = Long_Natural'First"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 145,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " First_Index(Self) > Last_Index(Self) "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Length'Result = Long_Natural'First"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 146,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Length'Result = Long_Natural("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "abs"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "(Long_Integer(Last_Index(Self)) - Long_Integer(First_Index(Self))) + 1)))"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This function returns the number of elements inside `Self`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => First_Index(Self) and Last_Index(Self) is always known.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 143,
              "column": 21,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            }
          ],
          "returns": {
            "description": [
              {
                "kind": "paragraph",
                "children": [
                  {
                    "kind": "span",
                    "text": "Number of elements inside `Self`.\n"
                  }
                ]
              }
            ]
          }
        },
        {
          "label": "Move",
          "qualifier": "",
          "line": 210,
          "column": 14,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 210,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "procedure"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Move",
                      "href": "docs/spark_unbound__arrays___spec.html#L210C14"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Target",
                      "href": "docs/spark_unbound__arrays___spec.html#L210C20"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "in"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "out"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Source",
                      "href": "docs/spark_unbound__arrays___spec.html#L210C51"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "in"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "out"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 211,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Pre => Source.Arr /= "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Target.Arr /= "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Index(Source) /= No_Index"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 212,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Capacity(Target) > Long_Natural'First  "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " First_Index(Source) = First_Index(Target)"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 213,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Ghost_In_Index_Range(Long_Positive(Capacity(Target))) "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Index(Source) <= Get_Capacity_Offset(Long_Positive(Capacity(Target))),"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 214,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     Post => Capacity(Target) = Ghost_Arr_Length(Target.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'Old)"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 215,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Source.Arr = "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Source.Last = No_Index"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 216,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Target.Last = Source.Last'Old "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Ghost_Arr_Equals(Left => Target.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": ", Right => Source.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'Old, First => First_Index(Target), Last => Last_Index(Target))"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Procedure that tries to move elements of `Source` to `Target`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Note: `Capacity(Target)` can be different to `Capacity(Source)`, but all elements of `Source` must fit inside `Target`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: Theta(n) => Alle elements of `Source` must be copied.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Target",
              "line": 210,
              "column": 20,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of `Unbound_Array` with all elements of `Source` being moved to.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Source",
              "line": 210,
              "column": 51,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of `Unbound_Array` that is cleared at the end of `Move`.\n"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "label": "Replace_Element",
          "qualifier": "",
          "line": 179,
          "column": 14,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 179,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "procedure"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Replace_Element",
                      "href": "docs/spark_unbound__arrays___spec.html#L179C14"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L179C31"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "in"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "out"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index",
                      "href": "docs/spark_unbound__arrays___spec.html#L179C60"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "in"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index_Type",
                      "href": "docs/spark_unbound__arrays___spec.html#L13C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "New_Item",
                      "href": "docs/spark_unbound__arrays___spec.html#L179C83"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "in"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Element_Type"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 180,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Pre => Last_Index(Self) > No_Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Index(Self) >= Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " First_Index(Self) <= Index,"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 181,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     Post => Element(Self, Index) = New_Item"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This procedure replaces the element inside `Self` at index `Index` with `New_Item`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => Index access on array is constant time.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 179,
              "column": 31,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Index",
              "line": 179,
              "column": 60,
              "type": {
                "label": "Spark_Unbound.Arrays.Index_Type",
                "docHref": "docs/spark_unbound__arrays___spec.html#L13C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Array index for the element that should be replaced.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "New_Item",
              "line": 179,
              "column": 83,
              "type": {
                "label": "Spark_Unbound.Arrays.Element_Type",
                "docHref": "docs/spark_unbound__arrays___spec.html#L12C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Value that is set for the element at index `Index`.\n"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "label": "Shrink",
          "qualifier": "",
          "line": 131,
          "column": 14,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 131,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "procedure"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Shrink",
                      "href": "docs/spark_unbound__arrays___spec.html#L131C14"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Self",
                      "href": "docs/spark_unbound__arrays___spec.html#L131C22"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "in"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "out"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "New_Capacity",
                      "href": "docs/spark_unbound__arrays___spec.html#L131C51"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Long_Natural",
                      "href": "docs/spark_unbound___spec.html#L19C12"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Success",
                      "href": "docs/spark_unbound__arrays___spec.html#L131C80"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "out"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Boolean"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 132,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Pre => Self.Arr /= "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " New_Capacity >= Length(Self) "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " New_Capacity < Capacity(Self),"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 133,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     Post => ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "If"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " New_Capacity = 0 "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Success "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Capacity(Self) = Long_Natural'First "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Last_Index(Self) = No_Index"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 134,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "              "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Arr /= "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Last = Self.Last'Old"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 135,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "              "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Self.Last'Old > No_Index "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Ghost_Arr_Equals(Left => Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": ", Right => Self.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'Old, First => First_Index(Self), Last => Last_Index(Self)))"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 136,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "              "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Success "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Capacity(Self) = New_Capacity))"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "This procedure tries to move the content of `Self` to an `Unbound_Array` of a smaller capacity.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Note: `Self` remains unchanged if `Success = False`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(n) => All elements are moved, but allocation might fail before.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Self",
              "line": 131,
              "column": 22,
              "type": {
                "label": "Spark_Unbound.Arrays.Unbound_Array",
                "docHref": "docs/spark_unbound__arrays___spec.html#L50C9"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Instance of an `Unbound_Array`.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "New_Capacity",
              "line": 131,
              "column": 51,
              "type": {
                "label": "Spark_Unbound.Long_Natural",
                "docHref": "docs/spark_unbound___spec.html#L19C12"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "The new capacity `Self` should be shrunken to.\n"
                    }
                  ]
                }
              ]
            },
            {
              "label": "Success",
              "line": 131,
              "column": 80,
              "type": {
                "label": "Boolean"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "`True` if `Self` got shrunken or `False` if the content of `Self` could not be moved.\n"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "label": "To_Unbound_Array",
          "qualifier": "",
          "line": 69,
          "column": 13,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 69,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "function"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "To_Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L69C13"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Initial_Capacity",
                      "href": "docs/spark_unbound__arrays___spec.html#L69C31"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ":"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Long_Positive",
                      "href": "docs/spark_unbound___spec.html#L22C12"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "return"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Unbound_Array",
                      "href": "docs/spark_unbound__arrays___spec.html#L50C9"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 70,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Pre => Ghost_In_Index_Range(Initial_Capacity),"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 71,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "            Post => ("
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "if"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " To_Unbound_Array'Result.Arr /= "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "null"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Capacity(To_Unbound_Array'Result) = Long_Natural(Initial_Capacity)"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 72,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                       "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " To_Unbound_Array'Result.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'First = Index_Type'First "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "and"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "then"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " To_Unbound_Array'Result.Arr."
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "all"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "'Last = Get_Capacity_Offset(Initial_Capacity)"
                    }
                  ]
                },
                {
                  "kind": "line",
                  "number": 73,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "                     "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "else"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Capacity(To_Unbound_Array'Result) = Long_Natural'First)"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Sets up a new `Unbound_Array` with `Initial_Capacity` as capacity.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Complexity: O(1) => Only allocates the array without setting any value\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Initial_Capacity",
              "line": 69,
              "column": 31,
              "type": {
                "label": "Spark_Unbound.Long_Positive",
                "docHref": "docs/spark_unbound___spec.html#L22C12"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "Tries to allocate an `Unbound_Array` with `Capacity(To_Unbound_Array'Result) = Initial_Capacity`.\n"
                    }
                  ]
                }
              ]
            }
          ],
          "returns": {
            "description": [
              {
                "kind": "paragraph",
                "children": [
                  {
                    "kind": "span",
                    "text": "`Unbound_Array` with `Capacity(To_Unbound_Array'Result) = Initial_Capacity` if allocation was successful, or `To_Unbound_Array'Result.Arr = null`.\n"
                  }
                ]
              }
            ]
          }
        }
      ],
      "label": "Subprograms"
    },
    {
      "entities": [
        {
          "label": "Index_Type_To_Big",
          "qualifier": "(generic instantiation)",
          "line": 24,
          "column": 12,
          "src": "srcs/spark_unbound-arrays.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 24,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "package"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index_Type_To_Big"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "is"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "new"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Signed_Conversions"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "("
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Int"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "=>"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "Index_Type"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ")"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ],
      "label": "Generic instantiations"
    }
  ]
};