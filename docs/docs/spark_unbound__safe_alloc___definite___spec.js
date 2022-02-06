GNATdoc.Documentation = {
  "label": "Spark_Unbound.Safe_Alloc.Definite",
  "qualifier": "(nested)",
  "summary": [
    {
      "kind": "paragraph",
      "children": [
        {
          "kind": "span",
          "text": "Generic package for safe heap allocation of type `T` whose size is known at compile time.\n"
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
          "text": "Generic package for safe heap allocation of type `T` whose size is known at compile time.\n"
        },
        {
          "kind": "span",
          "text": "Type `T_Acc` is used to access the allocated instance of type `T`.\n"
        }
      ]
    }
  ],
  "entities": [
    {
      "entities": [
        {
          "label": "Alloc",
          "qualifier": "",
          "line": 23,
          "column": 16,
          "src": "srcs/spark_unbound-safe_alloc.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 23,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "      "
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
                      "text": "Alloc",
                      "href": "docs/spark_unbound__safe_alloc___definite___spec.html#L23C16"
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
                      "text": "T_Acc",
                      "href": "docs/spark_unbound__safe_alloc___definite___spec.html#L18C12"
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
                  "text": "Tries to allocate type `T` on the heap.\n"
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
                    "text": "`null` if `Storage_Error` was raised.\n"
                  }
                ]
              }
            ]
          }
        },
        {
          "label": "Free",
          "qualifier": "",
          "line": 27,
          "column": 17,
          "src": "srcs/spark_unbound-safe_alloc.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 27,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "      "
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
                      "text": "Free",
                      "href": "docs/spark_unbound__safe_alloc___definite___spec.html#L27C17"
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
                      "text": "Pointer",
                      "href": "docs/spark_unbound__safe_alloc___definite___spec.html#L27C23"
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
                      "text": "T_Acc",
                      "href": "docs/spark_unbound__safe_alloc___definite___spec.html#L18C12"
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
                  "number": 28,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "        "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "with"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " Post => Pointer = "
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
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Deallocates the instance of type `T` from the heap.\n"
                }
              ]
            }
          ],
          "parameters": [
            {
              "label": "Pointer",
              "line": 27,
              "column": 23,
              "type": {
                "label": "Spark_Unbound.Safe_Alloc.Definite.T_Acc",
                "docHref": "docs/spark_unbound__safe_alloc___definite___spec.html#L18C12"
              },
              "description": [
                {
                  "kind": "paragraph",
                  "children": [
                    {
                      "kind": "span",
                      "text": "The reference to an heap allocated instance of type `T` set to `null` after deallocation.\n"
                    }
                  ]
                }
              ]
            }
          ]
        }
      ],
      "label": "Subprograms"
    }
  ]
};