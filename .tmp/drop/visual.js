var powerbi;
(function (powerbi) {
    var extensibility;
    (function (extensibility) {
        var visual;
        (function (visual) {
            var PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7;
            (function (PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7) {
                /**
                 * Gets property value for a particular object.
                 *
                 * @function
                 * @param {DataViewObjects} objects - Map of defined objects.
                 * @param {string} objectName       - Name of desired object.
                 * @param {string} propertyName     - Name of desired property.
                 * @param {T} defaultValue          - Default value of desired property.
                 */
                function getValue(objects, objectName, propertyName, defaultValue) {
                    if (objects) {
                        var object = objects[objectName];
                        if (object) {
                            var property = object[propertyName];
                            if (property !== undefined) {
                                return property;
                            }
                        }
                    }
                    return defaultValue;
                }
                PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7.getValue = getValue;
                /**
                 * Gets property value for a particular object.
                 *
                 * @function
                 * @param {DataViewObjects} objects - Map of defined objects.
                 * @param {string} objectName       - Name of desired object.
                 * @param {string} propertyName     - Name of desired property.
                 * @param {T} defaultValue          - Default value of desired property.
                 */
                function getValueMinMax(objects, objectName, propertyName, defaultValue, minVal, maxVal) {
                    if (objects) {
                        var object = objects[objectName];
                        if (object) {
                            var property = object[propertyName];
                            if (property < minVal) {
                                return minVal;
                            }
                            if (property > maxVal) {
                                return maxVal;
                            }
                            if (property !== undefined) {
                                return property;
                            }
                        }
                    }
                    return defaultValue;
                }
                PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7.getValueMinMax = getValueMinMax;
                /**
                * Gets property value for a particular object.
                *
                * @function
                * @param {DataViewObjects} objects - Map of defined objects.
                * @param {string} objectName       - Name of desired object.
                * @param {string} propertyName     - Name of desired property.
                * @param {T} defaultValue          - Default value of desired property.
                */
                function getValueNumberMinMax(objects, objectName, propertyName, defaultValue, minValue, maxValue) {
                    if (objects) {
                        var object = objects[objectName];
                        if (object) {
                            var property = object[propertyName];
                            if (property !== undefined) {
                                if (property > maxValue) {
                                    return maxValue;
                                }
                                if (property < minValue) {
                                    return minValue;
                                }
                                return property;
                            }
                        }
                    }
                    return defaultValue;
                }
                PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7.getValueNumberMinMax = getValueNumberMinMax;
                /**
                     * Gets conditional property value for a particular object of type string
                     *
                     * @function
                     * @param {string} inVal     -  current value of parameter
                     * @param {string} contrVal   - control value
                     * @param {string} contrVal2Compare     - specific string to be compared with contrVal
                     * @param {boolean} logic          -  true / false "logic"
                     * @param {string} outValIfCondTrue          - output value if comparison (contrVal == contrVal2Compare) comes out as "logic"
                     */
                function ifStringReturnString(inVal, contrVal, contrVal2Compare, outValIfCondTrue, logic, applyNow) {
                    if (applyNow && contrVal == contrVal2Compare && logic == true)
                        return outValIfCondTrue;
                    if (applyNow && contrVal != contrVal2Compare && logic == false)
                        return outValIfCondTrue;
                    return inVal;
                }
                PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7.ifStringReturnString = ifStringReturnString;
                function inMinMax(a, mi, ma) {
                    if (a < mi)
                        return mi;
                    if (a > ma)
                        return ma;
                    return a;
                }
                PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7.inMinMax = inMinMax;
                /**
                 * Gets property value for a particular object in a category.
                 *
                 * @function
                 * @param {DataViewCategoryColumn} category - List of category objects.
                 * @param {number} index                    - Index of category object.
                 * @param {string} objectName               - Name of desired object.
                 * @param {string} propertyName             - Name of desired property.
                 * @param {T} defaultValue                  - Default value of desired property.
                 */
                function getCategoricalObjectValue(category, index, objectName, propertyName, defaultValue) {
                    var categoryObjects = category.objects;
                    if (categoryObjects) {
                        var categoryObject = categoryObjects[index];
                        if (categoryObject) {
                            var object = categoryObject[objectName];
                            if (object) {
                                var property = object[propertyName];
                                if (property !== undefined) {
                                    return property;
                                }
                            }
                        }
                    }
                    return defaultValue;
                }
                PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7.getCategoricalObjectValue = getCategoricalObjectValue;
            })(PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7 = visual.PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7 || (visual.PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7 = {}));
        })(visual = extensibility.visual || (extensibility.visual = {}));
    })(extensibility = powerbi.extensibility || (powerbi.extensibility = {}));
})(powerbi || (powerbi = {}));
/*
 *  Power BI Visual CLI
 *
 *  Copyright (c) Microsoft Corporation
 *  All rights reserved.
 *  MIT License
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the ""Software""), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */
var powerbi;
(function (powerbi) {
    var extensibility;
    (function (extensibility) {
        var visual;
        (function (visual) {
            var PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7;
            (function (PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7) {
                var Visual = (function () {
                    // Snippet for defining the member property which will hold the property pane values
                    /*private settings: VisualSettings;*/
                    function Visual(options) {
                        this.imageDiv = document.createElement('div');
                        this.imageDiv.className = 'rcv_autoScaleImageContainer';
                        options.element.appendChild(this.imageDiv);
                        this.imageElement = document.createElement('img');
                        this.imageElement.className = 'rcv_autoScaleImage';
                        this.imageDiv.appendChild(this.imageElement);
                        this.settings_labels_params = {
                            show: false,
                            textSize: 10,
                            tl_col: "red",
                        };
                    }
                    Visual.prototype.update = function (options) {
                        var dataViews = options.dataViews;
                        if (!dataViews || dataViews.length === 0)
                            return;
                        var dataView = dataViews[0];
                        if (!dataView || !dataView.metadata)
                            return;
                        this.updateObjects(dataView.metadata.objects);
                        this.settings_labels_params = {
                            show: PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7.getValue(dataView.metadata.objects, 'settings_labels_params', 'show', false),
                            textSize: PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7.getValueMinMax(dataView.metadata.objects, 'settings_labels_params', 'textSize', 10, 5, 50),
                            tl_col: PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7.getValue(dataView.metadata.objects, 'settings_labels_params', 'tl_col', "red"),
                        };
                        var imageUrl = null;
                        if (dataView.scriptResult && dataView.scriptResult.payloadBase64) {
                            imageUrl = "data:image/png;base64," + dataView.scriptResult.payloadBase64;
                        }
                        if (imageUrl) {
                            this.imageElement.src = imageUrl;
                        }
                        else {
                            this.imageElement.src = null;
                        }
                        this.onResizing(options.viewport);
                    };
                    Visual.prototype.onResizing = function (finalViewport) {
                        this.imageDiv.style.height = finalViewport.height + 'px';
                        this.imageDiv.style.width = finalViewport.width + 'px';
                    };
                    /**
                     * This function gets called by the update function above. You should read the new values of the properties into
                     * your settings object so you can use the new value in the enumerateObjectInstances function below.
                     *
                     * Below is a code snippet demonstrating how to expose a single property called "lineColor" from the object called "settings"
                     * This object and property should be first defined in the capabilities.json file in the objects section.
                     * In this code we get the property value from the objects (and have a default value in case the property is undefined)
                     */
                    Visual.prototype.updateObjects = function (objects) {
                        /*this.settings = <VisualSettings>{
                            lineColor: getFillValue(object, 'settings', 'lineColor', "#333333")
                        };*/
                    };
                    /**
                     * This function gets called for each of the objects defined in the capabilities files and allows you to select which of the
                     * objects and properties you want to expose to the users in the property pane.
                     *
                     * Below is a code snippet for a case where you want to expose a single property called "lineColor" from the object called "settings"
                     * This object and property should be first defined in the capabilities.json file in the objects section.
                     */
                    Visual.prototype.enumerateObjectInstances = function (options) {
                        var objectName = options.objectName;
                        var objectEnumeration = [];
                        switch (objectName) {
                            case 'settings_labels_params':
                                objectEnumeration.push({
                                    objectName: objectName,
                                    properties: {
                                        show: this.settings_labels_params.show,
                                        textSize: this.settings_labels_params.textSize,
                                        tl_col: this.settings_labels_params.tl_col
                                    },
                                    selector: null
                                });
                                break;
                        }
                        ;
                        /*switch( objectName ){
                            case 'settings':
                                objectEnumeration.push({
                                    objectName: objectName,
                                    properties: {
                                        lineColor: this.settings.lineColor,
                                     },
                                    selector: null
                                });
                                break;
                        };*/
                        return objectEnumeration;
                    };
                    return Visual;
                }());
                PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7.Visual = Visual;
            })(PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7 = visual.PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7 || (visual.PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7 = {}));
        })(visual = extensibility.visual || (extensibility.visual = {}));
    })(extensibility = powerbi.extensibility || (powerbi.extensibility = {}));
})(powerbi || (powerbi = {}));
var powerbi;
(function (powerbi) {
    var visuals;
    (function (visuals) {
        var plugins;
        (function (plugins) {
            plugins.PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7_DEBUG = {
                name: 'PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7_DEBUG',
                displayName: 'AlRTest',
                class: 'Visual',
                version: '1.0.0',
                apiVersion: '1.4.0',
                create: function (options) { return new powerbi.extensibility.visual.PBI_CV_5503E017_0853_4327_9C12_DEE73CE835B7.Visual(options); },
                custom: true
            };
        })(plugins = visuals.plugins || (visuals.plugins = {}));
    })(visuals = powerbi.visuals || (powerbi.visuals = {}));
})(powerbi || (powerbi = {}));
//# sourceMappingURL=visual.js.map