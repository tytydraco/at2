package com.draco.rive_sample

import app.rive.runtime.kotlin.core.ViewModelInstance

/**
 * Helper to enumerate and replace nested view models by name.
 */
object RiveViewModelHelper {

    /**
     * Finds and replaces all nested view models matching the given name.
     *
     * @param vmi The view model instance to check
     * @param viewModelName The name to search for (e.g., "NestedVM" or "_NestedVM")
     * @param replacement The replacement instance (null for now)
     * @return Number of view models replaced
     */
    fun replaceNestedViewModels(
        vmi: ViewModelInstance,
        viewModelName: String,
        replacement: ViewModelInstance
    ): Int {
        var count = 0

        // Check and replace with exact name
        try {
            val existing = vmi.getInstanceProperty(viewModelName)
            vmi.setInstanceProperty(viewModelName, replacement)
            count++
            // If it's a ViewModelInstance, recursively check it
            count += replaceNestedViewModels(existing, viewModelName, replacement)
        } catch (e: Exception) {
            // Property doesn't exist
        }

        // Check and replace with underscore prefix
        try {
            val existing = vmi.getInstanceProperty("_$viewModelName")
            vmi.setInstanceProperty("_$viewModelName", replacement)
            count++
            // If it's a ViewModelInstance, recursively check it
            count += replaceNestedViewModels(existing, viewModelName, replacement)
        } catch (e: Exception) {
            // Property doesn't exist
        }

        return count
    }
}

